#!/usr/bin/env bash
# Folder 1 publisher (curl-based, no Node needed).
# Creates hub + 6 spokes as the chosen status, sets page hierarchy.
# Title = the <h1> text (theme renders it as the page H1), so the <h1> is
# stripped from the body to avoid a duplicate H1. Idempotent: updates by slug.
set -u
BASE="https://inspireambitions.com"
source ./.wp-creds   # sets WP_USER, WP_APP_PASSWORD (WP_BASE optional)
U="$WP_USER"; P="$WP_APP_PASSWORD"
STATUS="${PUBLISH_STATUS:-draft}"
DIR="folder-01-labour-law"
TMP="./.tmpbody"
mkdir -p "$TMP"

api() { curl -sS -m 40 -u "$U:$P" "$@"; }

# meta_get FILE KEY  -> value from the leading HTML comment
meta_get() { grep -m1 "^$2:" "$1" | sed "s/^$2: *//"; }

find_id() { # slug
  api "$BASE/wp-json/wp/v2/pages?slug=$1&status=publish,draft,pending,private" \
    | grep -oE '"id":[0-9]+' | head -1 | grep -oE '[0-9]+'
}

publish_page() { # file parent_id -> prints new/updated id
  local file="$1" parent="$2"
  local slug h1 title body bodyfile existing resp id
  slug="$(meta_get "$file" slug)"
  h1="$(grep -m1 '<h1>' "$file" | sed 's/.*<h1>//; s/<\/h1>.*//')"
  title="$(meta_get "$file" headline)"; [ -z "$title" ] && title="$h1"
  bodyfile="$TMP/$slug.body.html"
  # strip comment block and the single h1 line
  sed '/<!--/,/-->/d; /<h1>/d' "$file" > "$bodyfile"
  existing="$(find_id "$slug")"
  if [ -n "$existing" ]; then
    resp="$(api -X POST "$BASE/wp-json/wp/v2/pages/$existing" \
      --data-urlencode "title=$title" \
      --data-urlencode "content@$bodyfile" \
      -d "status=$STATUS" -d "parent=$parent")"
    echo "  updated #$existing ($slug)" >&2
  else
    resp="$(api -X POST "$BASE/wp-json/wp/v2/pages" \
      --data-urlencode "title=$title" \
      --data-urlencode "content@$bodyfile" \
      --data-urlencode "slug=$slug" \
      -d "status=$STATUS" -d "parent=$parent")"
    echo "  created ($slug)" >&2
  fi
  id="$(echo "$resp" | grep -oE '"id":[0-9]+' | head -1 | grep -oE '[0-9]+')"
  if [ -z "$id" ]; then echo "  ERROR ($slug): $(echo "$resp" | head -c 300)" >&2; echo ""; return; fi
  # Set AIOSEO custom SEO title + meta description (title_tag/meta_description
  # values contain no quotes/backslashes, so no escaping needed).
  local ttag mdesc
  ttag="$(meta_get "$file" title_tag)"; mdesc="$(meta_get "$file" meta_description)"
  if [ -n "$ttag" ]; then
    api -X POST "$BASE/wp-json/aioseo/v1/post" -H "Content-Type: application/json" \
      --data "{\"id\":$id,\"title\":\"$ttag\",\"description\":\"$mdesc\"}" >/dev/null
    echo "  aioseo meta set (#$id)" >&2
  fi
  echo "$id"
}

echo "Publishing Folder 1 as status=$STATUS"
echo "Hub..."
HUB_ID="$(publish_page "$DIR/00-hub-uae-labour-law.html" 0)"
echo "Hub id=$HUB_ID"
if [ -z "$HUB_ID" ]; then echo "Hub failed, stopping."; exit 1; fi
for f in 01 02 03 04 05 06; do
  file="$(ls $DIR/${f}-*.html)"
  echo "Spoke ${f}..."
  SID="$(publish_page "$file" "$HUB_ID")"
  echo "  -> id=$SID"
done
echo "Done. status=$STATUS, hub=$HUB_ID"
rm -rf "$TMP"
