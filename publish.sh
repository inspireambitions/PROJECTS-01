#!/usr/bin/env bash
# Generic folder publisher: bash publish.sh <folder-dir>
# Publishes hub (00-*.html) + spokes (0[1-9]-*.html) as $PUBLISH_STATUS,
# sets page hierarchy, applies custom AIOSEO title/description. Idempotent.
set -u
BASE="https://inspireambitions.com"
source ./.wp-creds
U="$WP_USER"; P="$WP_APP_PASSWORD"
STATUS="${PUBLISH_STATUS:-draft}"
DIR="${1:?usage: bash publish.sh <folder-dir>}"
TMP="./.tmpbody"; mkdir -p "$TMP"

api(){ curl -sS -m 40 -u "$U:$P" "$@"; }
meta_get(){ grep -m1 "^$2:" "$1" | sed "s/^$2: *//"; }
# Match on slug AND parent — WP allows the same slug under different parents,
# so keying on slug alone can hijack another cluster's page.
find_id(){ api "$BASE/wp-json/wp/v2/pages?slug=$1&parent=$2&status=publish,draft,pending,private" \
  | grep -oE '"id":[0-9]+' | head -1 | grep -oE '[0-9]+'; }

publish_page(){ # file parent_id -> prints id
  local file="$1" parent="$2" slug h1 title bodyfile existing resp id ttag mdesc
  slug="$(meta_get "$file" slug)"; [ "$slug" = "(none" ] && slug="$(basename "$file" .html | sed 's/^00-hub-//')"
  h1="$(grep -m1 '<h1>' "$file" | sed 's/.*<h1>//; s/<\/h1>.*//')"
  title="$(meta_get "$file" headline)"; [ -z "$title" ] && title="$h1"
  bodyfile="$TMP/$slug.body.html"
  sed '/<!--/,/-->/d; /<h1>/d' "$file" > "$bodyfile"
  existing="$(find_id "$slug" "$parent")"
  if [ -n "$existing" ]; then
    resp="$(api -X POST "$BASE/wp-json/wp/v2/pages/$existing" --data-urlencode "title=$title" \
      --data-urlencode "content@$bodyfile" -d "status=$STATUS" -d "parent=$parent")"
    echo "  updated #$existing ($slug)" >&2
  else
    resp="$(api -X POST "$BASE/wp-json/wp/v2/pages" --data-urlencode "title=$title" \
      --data-urlencode "content@$bodyfile" --data-urlencode "slug=$slug" -d "status=$STATUS" -d "parent=$parent")"
    echo "  created ($slug)" >&2
  fi
  id="$(echo "$resp" | grep -oE '"id":[0-9]+' | head -1 | grep -oE '[0-9]+')"
  if [ -z "$id" ]; then echo "  ERROR ($slug): $(echo "$resp"|head -c 240)" >&2; echo ""; return; fi
  ttag="$(meta_get "$file" title_tag)"; mdesc="$(meta_get "$file" meta_description)"
  [ -n "$ttag" ] && api -X POST "$BASE/wp-json/aioseo/v1/post" -H "Content-Type: application/json" \
      --data "{\"id\":$id,\"title\":\"$ttag\",\"description\":\"$mdesc\"}" >/dev/null && echo "  aioseo set (#$id)" >&2
  echo "$id"
}

hub="$(ls "$DIR"/00-*.html)"
echo "Publishing $DIR as status=$STATUS"
echo "Hub: $(basename "$hub")"
HUB_ID="$(publish_page "$hub" 0)"
echo "Hub id=$HUB_ID"; [ -z "$HUB_ID" ] && { echo "hub failed"; exit 1; }
for f in "$DIR"/0[1-9]-*.html; do
  echo "Spoke: $(basename "$f")"
  SID="$(publish_page "$f" "$HUB_ID")"; echo "  -> id=$SID"
done
rm -rf "$TMP"
echo "Done. status=$STATUS, hub=$HUB_ID"
