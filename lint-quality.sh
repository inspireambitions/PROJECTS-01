#!/usr/bin/env bash
# Mechanical quality-rail lint for Inspire Ambitions content.
# Usage: bash lint-quality.sh <dir-with-html>
# Checks the machine-checkable parts of QUALITY-RAIL.md. Human checks
# (hook strength, anecdotes, burstiness feel) still need a read.
set -u
DIR="${1:-.}"
AI_BLACKLIST='furthermore|moreover|delve|it'"'"'s important to note|landscape|notably|specifically|essentially|ultimately|consequently|in conclusion|to summarise|crucial|realm|foster|navigate|leverage'
TRANSITIONS='that said|having said that|it is worth noting|with that in mind|at the end of the day|in today'"'"'s world'
US_SPELL='organization|prioritize|optimize|\bcolor\b|\bcenter\b|analyze|recognize|behavior|\bfavor\b|fulfill|traveler|enrollment|labeled|maximize|minimize'

for f in "$DIR"/*.html; do
  [ -e "$f" ] || continue
  body=$(sed '/<!--/,/-->/d; /<script/,/<\/script>/d' "$f")
  text=$(echo "$body" | sed 's/<[^>]*>//g')
  wc_words=$(echo "$text" | wc -w)
  em=$(grep -o '—' "$f" | wc -l)
  ai=$(echo "$text" | grep -ioE "$AI_BLACKLIST" | sort | uniq -c | tr '\n' ' ')
  tr_hits=$(echo "$text" | grep -ioE "$TRANSITIONS" | sort | uniq -c | tr '\n' ' ')
  us=$(echo "$text" | grep -ioP "$US_SPELL" | sort | uniq -c | tr '\n' ' ')
  fp=$(echo "$text" | grep -oiE '\b(I|I'"'"'ve|I'"'"'m|my|me)\b' | wc -l)
  cta=$(grep -c "Subscribe Now 👉 and never miss an update!" "$f")
  ilinks=$(grep -oE 'href="/[^"]*"' "$f" | wc -l)
  bottomline=$(grep -ic 'the bottom line' "$f")
  h2=$(grep -oc '<h2>' "$f")

  echo "=============================================="
  echo "FILE: $(basename "$f")"
  printf "  words: %s  (target 1200-1500)  %s\n" "$wc_words" "$([ "$wc_words" -ge 1200 ] && echo OK || echo 'FAIL <1200')"
  printf "  em dashes: %s  %s\n" "$em" "$([ "$em" -eq 0 ] && echo OK || echo FAIL)"
  printf "  H2 count: %s\n" "$h2"
  printf "  first-person markers: %s  (want 8-10+)  %s\n" "$fp" "$([ "$fp" -ge 8 ] && echo OK || echo 'LOW')"
  printf "  internal links: %s  (min 2)  %s\n" "$ilinks" "$([ "$ilinks" -ge 2 ] && echo OK || echo FAIL)"
  printf "  CTA exact: %s  %s\n" "$cta" "$([ "$cta" -ge 1 ] && echo OK || echo FAIL)"
  printf "  'Bottom Line' heading: %s  %s\n" "$bottomline" "$([ "$bottomline" -eq 0 ] && echo OK || echo FAIL)"
  printf "  AI blacklist hits: %s\n" "${ai:-none}"
  printf "  formulaic transitions: %s\n" "${tr_hits:-none}"
  printf "  US spellings: %s\n" "${us:-none}"
done
