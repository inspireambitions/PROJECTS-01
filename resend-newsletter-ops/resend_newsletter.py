from __future__ import annotations

import argparse
import json
import os
import re
import sys
from datetime import datetime
from html import unescape
from pathlib import Path
from typing import Any
from urllib.error import HTTPError, URLError
from urllib.parse import urlencode
from urllib.request import Request, urlopen


ROOT = Path(__file__).resolve().parent
EXPORTS = ROOT / "exports"


def load_env() -> None:
    env_path = ROOT / ".env"
    if not env_path.exists():
        return
    for line in env_path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue
        key, value = line.split("=", 1)
        os.environ.setdefault(key.strip().lstrip("\ufeff"), value.strip().strip('"').strip("'"))


def api_key() -> str:
    load_env()
    key = os.environ.get("RESEND_API_KEY", "").strip()
    if not key:
        raise SystemExit(
            "Missing RESEND_API_KEY. Add it to .env or set it as an environment variable."
        )
    return key


def api_base() -> str:
    load_env()
    return os.environ.get("RESEND_API_BASE", "https://api.resend.com").rstrip("/")


def request_json(
    method: str,
    path: str,
    body: dict[str, Any] | None = None,
    params: dict[str, Any] | None = None,
) -> dict[str, Any]:
    url = f"{api_base()}{path}"
    if params:
        clean_params = {k: v for k, v in params.items() if v not in (None, "")}
        if clean_params:
            url = f"{url}?{urlencode(clean_params)}"

    data = None
    headers = {
        "Authorization": f"Bearer {api_key()}",
        "User-Agent": "claude-code-newsletter-ops/1.0",
        "Accept": "application/json",
    }
    if body is not None:
        data = json.dumps(body).encode("utf-8")
        headers["Content-Type"] = "application/json"

    req = Request(url, data=data, headers=headers, method=method.upper())
    try:
        with urlopen(req, timeout=45) as response:
            raw = response.read().decode("utf-8")
            return json.loads(raw) if raw else {}
    except HTTPError as exc:
        detail = exc.read().decode("utf-8", errors="replace")
        raise SystemExit(f"Resend API error {exc.code}: {detail}") from exc
    except URLError as exc:
        raise SystemExit(f"Network error calling Resend: {exc}") from exc


def write_json(path: Path, payload: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(payload, indent=2, ensure_ascii=False), encoding="utf-8")


def clean_filename(value: str) -> str:
    cleaned = re.sub(r"[^A-Za-z0-9._-]+", "-", value.strip()).strip("-")
    return cleaned[:120] or "unnamed"


def strip_html(value: str) -> str:
    text = re.sub(r"(?is)<(script|style).*?>.*?</\1>", " ", value or "")
    text = re.sub(r"(?s)<br\s*/?>", "\n", text)
    text = re.sub(r"(?s)</p\s*>", "\n\n", text)
    text = re.sub(r"(?s)<.*?>", " ", text)
    text = unescape(text)
    text = re.sub(r"[ \t]+", " ", text)
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def list_all(endpoint: str, limit: int = 100) -> list[dict[str, Any]]:
    items: list[dict[str, Any]] = []
    after = None
    while True:
        payload = request_json("GET", endpoint, params={"limit": limit, "after": after})
        batch = payload.get("data", [])
        items.extend(batch)
        if not payload.get("has_more") or not batch:
            break
        after = batch[-1].get("id")
    return items


def cmd_check(_: argparse.Namespace) -> None:
    key = api_key()
    print("RESEND_API_KEY loaded: yes")
    print(f"API base: {api_base()}")


def cmd_list_automations(_: argparse.Namespace) -> None:
    automations = list_all("/automations")
    for item in automations:
        print(f"{item.get('id')} | {item.get('status')} | {item.get('name')}")
    print(f"\nTotal automations: {len(automations)}")


def cmd_get_automation(args: argparse.Namespace) -> None:
    payload = request_json("GET", f"/automations/{args.automation_id}")
    print(json.dumps(payload, indent=2, ensure_ascii=False))


def cmd_list_templates(_: argparse.Namespace) -> None:
    templates = list_all("/templates")
    for item in templates:
        alias = item.get("alias") or ""
        print(f"{item.get('id')} | {item.get('status')} | {alias} | {item.get('name')}")
    print(f"\nTotal templates: {len(templates)}")


def cmd_get_template(args: argparse.Namespace) -> None:
    payload = request_json("GET", f"/templates/{args.template_id}")
    print(json.dumps(payload, indent=2, ensure_ascii=False))


def export_template(template_id: str, export_dir: Path) -> dict[str, Any]:
    template = request_json("GET", f"/templates/{template_id}")
    label = clean_filename(template.get("alias") or template.get("name") or template_id)
    base = export_dir / "templates" / f"{label}__{template_id}"
    base.mkdir(parents=True, exist_ok=True)
    write_json(base / "template.json", template)
    (base / "body.html").write_text(template.get("html") or "", encoding="utf-8")
    (base / "body.txt").write_text(template.get("text") or strip_html(template.get("html") or ""), encoding="utf-8")
    summary = {
        "id": template.get("id"),
        "alias": template.get("alias"),
        "name": template.get("name"),
        "subject": template.get("subject"),
        "status": template.get("status"),
        "published_at": template.get("published_at"),
        "has_unpublished_versions": template.get("has_unpublished_versions"),
        "path": str(base.relative_to(ROOT)),
    }
    return summary


def cmd_export_all(_: argparse.Namespace) -> None:
    timestamp = datetime.now().strftime("%Y%m%d-%H%M%S")
    export_dir = EXPORTS / timestamp
    export_dir.mkdir(parents=True, exist_ok=True)

    automations = list_all("/automations")
    write_json(export_dir / "automations.json", automations)
    for item in automations:
        automation_id = item.get("id")
        if automation_id:
            detail = request_json("GET", f"/automations/{automation_id}")
            label = clean_filename(item.get("name") or automation_id)
            write_json(export_dir / "automations" / f"{label}__{automation_id}.json", detail)

    templates = list_all("/templates")
    write_json(export_dir / "templates.json", templates)
    summaries = [export_template(item["id"], export_dir) for item in templates if item.get("id")]
    write_json(export_dir / "template-index.json", summaries)

    print(f"Exported {len(automations)} automations and {len(summaries)} templates to {export_dir}")


def cmd_find(args: argparse.Namespace) -> None:
    terms = [term.lower() for term in args.terms]
    if not terms:
        raise SystemExit("Add one or more search terms.")
    templates = list_all("/templates")
    matches = []
    for item in templates:
        template_id = item.get("id")
        if not template_id:
            continue
        detail = request_json("GET", f"/templates/{template_id}")
        haystack = "\n".join(
            str(detail.get(field) or "")
            for field in ("alias", "name", "subject", "html", "text")
        ).lower()
        score = sum(1 for term in terms if term in haystack)
        if score:
            matches.append((score, detail))

    matches.sort(key=lambda row: row[0], reverse=True)
    for score, detail in matches:
        print(
            f"{score} | {detail.get('id')} | {detail.get('status')} | "
            f"{detail.get('alias') or ''} | {detail.get('subject') or detail.get('name')}"
        )
    print(f"\nMatches: {len(matches)}")


def cmd_update_template(args: argparse.Namespace) -> None:
    if not args.apply or not args.approved:
        raise SystemExit(
            "Live update blocked. Re-run with --apply --approved only after Kim approves the exact before/after."
        )
    body: dict[str, Any] = {}
    if args.html_file:
        body["html"] = Path(args.html_file).read_text(encoding="utf-8")
    if args.text_file:
        body["text"] = Path(args.text_file).read_text(encoding="utf-8")
    if args.subject:
        body["subject"] = args.subject
    if args.name:
        body["name"] = args.name
    if not body:
        raise SystemExit("Nothing to update. Provide --html-file, --text-file, --subject, or --name.")

    result = request_json("PATCH", f"/templates/{args.template_id}", body=body)
    print(json.dumps(result, indent=2, ensure_ascii=False))


def cmd_publish_template(args: argparse.Namespace) -> None:
    if not args.apply or not args.approved:
        raise SystemExit(
            "Publish blocked. Re-run with --apply --approved only after Kim approves the exact template."
        )
    result = request_json("POST", f"/templates/{args.template_id}/publish")
    print(json.dumps(result, indent=2, ensure_ascii=False))


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Resend newsletter operations for Claude Code.")
    sub = parser.add_subparsers(required=True)

    check = sub.add_parser("check")
    check.set_defaults(func=cmd_check)

    list_automations = sub.add_parser("list-automations")
    list_automations.set_defaults(func=cmd_list_automations)

    get_automation = sub.add_parser("get-automation")
    get_automation.add_argument("automation_id")
    get_automation.set_defaults(func=cmd_get_automation)

    list_templates = sub.add_parser("list-templates")
    list_templates.set_defaults(func=cmd_list_templates)

    get_template = sub.add_parser("get-template")
    get_template.add_argument("template_id")
    get_template.set_defaults(func=cmd_get_template)

    export_all = sub.add_parser("export-all")
    export_all.set_defaults(func=cmd_export_all)

    find = sub.add_parser("find")
    find.add_argument("terms", nargs="+")
    find.set_defaults(func=cmd_find)

    update = sub.add_parser("update-template")
    update.add_argument("template_id")
    update.add_argument("--html-file")
    update.add_argument("--text-file")
    update.add_argument("--subject")
    update.add_argument("--name")
    update.add_argument("--apply", action="store_true")
    update.add_argument("--approved", action="store_true")
    update.set_defaults(func=cmd_update_template)

    publish = sub.add_parser("publish-template")
    publish.add_argument("template_id")
    publish.add_argument("--apply", action="store_true")
    publish.add_argument("--approved", action="store_true")
    publish.set_defaults(func=cmd_publish_template)

    return parser


def main() -> None:
    args = build_parser().parse_args()
    args.func(args)


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        sys.exit(130)
