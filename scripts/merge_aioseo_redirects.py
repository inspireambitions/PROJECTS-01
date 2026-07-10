#!/usr/bin/env python3
"""Merge a live AIOSEO JSON export with a remediation CSV safely."""

import argparse
import csv
import json
from pathlib import Path
from urllib.parse import urlparse


FIELDS = ["Source URL", "Target URL", "Redirect Type", "Ignore Slash", "Ignore Case", "Regex"]


def normalise_source(value: str) -> str:
    value = value.strip()
    parsed = urlparse(value)
    if parsed.scheme and parsed.netloc:
        value = parsed.path or "/"
        if parsed.query:
            value += f"?{parsed.query}"
    if not value.startswith("/") and not value.startswith("^"):
        value = f"/{value}"
    return value


def target_path(value: str) -> str:
    value = value.strip()
    if not value:
        return ""
    parsed = urlparse(value)
    if parsed.scheme and parsed.netloc:
        return parsed.path or "/"
    return value if value.startswith("/") else f"/{value}"


def live_to_csv(row: dict[str, object]) -> dict[str, str]:
    return {
        "Source URL": normalise_source(str(row.get("source_url") or "")),
        "Target URL": str(row.get("target_url") or "").strip(),
        "Redirect Type": str(row.get("type") or "301").strip(),
        "Ignore Slash": "1" if str(row.get("ignore_slash") or "0") == "1" else "0",
        "Ignore Case": "1" if str(row.get("ignore_case") or "0") == "1" else "0",
        "Regex": "1" if str(row.get("regex") or "0") == "1" else "0",
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("live_json", type=Path)
    parser.add_argument("remediation_csv", type=Path)
    parser.add_argument("output_csv", type=Path)
    args = parser.parse_args()

    live_rows = json.loads(args.live_json.read_text(encoding="utf-8"))
    merged: dict[str, dict[str, str]] = {}
    for source in (live_to_csv(row) for row in live_rows):
        merged[source["Source URL"]] = source

    collision_count = 0
    with args.remediation_csv.open(encoding="utf-8-sig", newline="") as handle:
        for raw in csv.DictReader(handle):
            row = {field: (raw.get(field) or "").strip() for field in FIELDS}
            row["Source URL"] = normalise_source(row["Source URL"])
            if row["Source URL"] in merged:
                collision_count += 1
            merged[row["Source URL"]] = row

    sources = set(merged)
    flattened_chains = 0
    for row in merged.values():
        if row["Redirect Type"] == "410":
            continue
        target = target_path(row["Target URL"])
        seen = {row["Source URL"]}
        while target in sources and merged[target]["Redirect Type"] != "410":
            if target in seen:
                raise SystemExit(f"Unsafe merge: redirect cycle involving {sorted(seen | {target})}")
            seen.add(target)
            next_target = merged[target]["Target URL"]
            target = target_path(next_target)
            row["Target URL"] = next_target
            flattened_chains += 1

    chains = []
    for row in merged.values():
        target = target_path(row["Target URL"])
        if row["Redirect Type"] != "410" and target in sources and target != row["Source URL"]:
            chains.append((row["Source URL"], target))

    self_redirects = [
        row["Source URL"]
        for row in merged.values()
        if row["Redirect Type"] != "410" and target_path(row["Target URL"]) == row["Source URL"]
    ]
    if chains or self_redirects:
        raise SystemExit(
            f"Unsafe merge: {len(chains)} redirect chains and {len(self_redirects)} self redirects. "
            f"Chains={chains[:10]} self_redirects={self_redirects[:10]}"
        )

    args.output_csv.parent.mkdir(parents=True, exist_ok=True)
    with args.output_csv.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDS)
        writer.writeheader()
        writer.writerows(merged.values())

    print(
        json.dumps(
            {
                "live_rows": len(live_rows),
                "remediation_rows": sum(1 for _ in args.remediation_csv.open(encoding="utf-8-sig")) - 1,
                "source_collisions_overridden_by_remediation": collision_count,
                "output_rows": len(merged),
                "redirect_chains_flattened": flattened_chains,
                "redirect_chains_remaining": 0,
                "self_redirects": 0,
                "output": str(args.output_csv),
            },
            indent=2,
        )
    )


if __name__ == "__main__":
    main()
