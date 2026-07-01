#!/usr/bin/env bash
# Point old duplicate posts' canonical at their new consolidated page, to
# ensure no duplicate content. Reads an AIOSEO-format redirect CSV
# (Source URL,Target URL,...) and sets canonicalUrl on each source.
# Usage: bash dedupe-canonical.sh <redirect-csv>
set -u
BASE="https://inspireambitions.com"
source ./.wp-creds; U="$WP_USER"; P="$WP_APP_PASSWORD"
CSV="${1:?usage: bash dedupe-canonical.sh <csv>}"

find_obj(){ # slug -> "id" (posts first, then pages)
  local id
  id=$(curl -sS -m 20 -u "$U:$P" "$BASE/wp-json/wp/v2/posts?slug=$1&status=publish,draft" | grep -oE '"id":[0-9]+' | head -1 | grep -oE '[0-9]+')
  [ -z "$id" ] && id=$(curl -sS -m 20 -u "$U:$P" "$BASE/wp-json/wp/v2/pages?slug=$1&status=publish,draft" | grep -oE '"id":[0-9]+' | head -1 | grep -oE '[0-9]+')
  echo "$id"
}

tail -n +2 "$CSV" | while IFS=',' read -r src tgt rest; do
  [ -z "$src" ] && continue
  slug=$(echo "$src" | sed 's#^/##; s#/$##')
  target="$BASE$tgt"
  id=$(find_obj "$slug")
  if [ -z "$id" ]; then echo "  SKIP (not found): $src"; continue; fi
  curl -sS -m 25 -u "$U:$P" -X POST "$BASE/wp-json/aioseo/v1/post" -H "Content-Type: application/json" \
    --data "{\"id\":$id,\"canonicalUrl\":\"$target\"}" >/dev/null
  echo "  #$id  $src  -> canonical $tgt"
done
