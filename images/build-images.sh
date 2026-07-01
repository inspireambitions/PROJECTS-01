#!/usr/bin/env bash
# Generate 7 on-brand featured images (1200x675) for Folder 1 and render to PNG
# via headless Chrome. Matches the Inspire Ambitions brand: dark navy, gold
# radar/compass motif, heavy condensed wordmark, gold italic serif sub-line.
set -u
ROOT="C:/Users/Kim/Claude/inspire-ambitions/images"
GEN="$ROOT/gen"
mkdir -p "$GEN"
CHROME="/c/Program Files/Google/Chrome/Application/chrome.exe"

page_html() { # EYEBROW  HEADLINE_HTML  SUBLINE  ICON_SVG_INNER
  local eyebrow="$1" headline="$2" sub="$3" icon="$4"
cat <<HTML
<!doctype html><html><head><meta charset="utf-8"><style>
  html,body{margin:0;padding:0;width:1200px;height:675px;overflow:hidden}
  *{box-sizing:border-box}
  .canvas{position:relative;width:1200px;height:675px;
    background:#0c1828;
    background-image:radial-gradient(rgba(255,255,255,.035) 1px, transparent 1.4px);
    background-size:7px 7px;font-family:Arial,Helvetica,sans-serif;color:#fff}
  .frame{position:absolute;inset:22px;border:1px solid rgba(201,162,39,.35)}
  .vrule{position:absolute;left:54px;top:90px;bottom:90px;width:2px;background:#c9a227}
  .glow{position:absolute;left:120px;top:150px;width:620px;height:360px;border-radius:50%;
    background:radial-gradient(closest-side,rgba(28,58,92,.85),rgba(12,24,40,0));filter:blur(6px)}
  .content{position:absolute;left:96px;top:150px;width:640px}
  .eyebrow{color:#c9a227;font-size:17px;font-weight:700;letter-spacing:6px;text-transform:uppercase;margin-bottom:22px}
  .headline{font-family:Impact,'Arial Narrow Bold','Haettenschweiler',sans-serif;
    font-weight:400;font-size:78px;line-height:.92;text-transform:uppercase;letter-spacing:1px;margin:0}
  .headline .alt{color:#b8cadd}
  .headline .gold{color:#c9a227}
  .divider{width:170px;height:2px;background:#c9a227;margin:30px 0 24px}
  .sub{font-family:Georgia,'Times New Roman',serif;font-style:italic;font-size:27px;color:#d9b94a;line-height:1.25}
  .brand{position:absolute;left:96px;bottom:54px;font-size:18px;font-weight:700;letter-spacing:3px}
  .brand .dom{color:#c9a227;font-weight:400;letter-spacing:1px}
  .radar{position:absolute;right:130px;top:337px;transform:translateY(-50%)}
</style></head>
<body><div class="canvas">
  <div class="frame"></div>
  <div class="glow"></div>
  <div class="vrule"></div>
  <div class="radar">
    <svg width="360" height="360" viewBox="0 0 360 360" fill="none">
      <circle cx="180" cy="180" r="170" stroke="rgba(201,162,39,.55)" stroke-width="1.2"/>
      <circle cx="180" cy="180" r="125" stroke="rgba(201,162,39,.30)" stroke-width="1"/>
      <circle cx="180" cy="180" r="80" stroke="rgba(201,162,39,.20)" stroke-width="1"/>
      <g stroke="rgba(201,162,39,.25)" stroke-width="1">
        <line x1="180" y1="6" x2="180" y2="40"/><line x1="180" y1="320" x2="180" y2="354"/>
        <line x1="6" y1="180" x2="40" y2="180"/><line x1="320" y1="180" x2="354" y2="180"/>
      </g>
      <g transform="translate(180,180)" stroke="#c9a227" stroke-width="3.2" stroke-linecap="round" stroke-linejoin="round" fill="none">
        $icon
      </g>
    </svg>
  </div>
  <div class="content">
    <div class="eyebrow">$eyebrow</div>
    <h1 class="headline">$headline</h1>
    <div class="divider"></div>
    <div class="sub">$sub</div>
  </div>
  <div class="brand">INSPIRE AMBITIONS &nbsp;<span class="dom">| inspireambitions.com</span></div>
</div></body></html>
HTML
}

render() { # slug
  local slug="$1"
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --no-first-run \
    --force-device-scale-factor=1 --window-size=1200,675 \
    --user-data-dir="$GEN/.chrome-$slug" \
    --screenshot="$ROOT/$slug.png" "file:///$GEN/$slug.html" >/dev/null 2>&1
  rm -rf "$GEN/.chrome-$slug"
  echo "  rendered $slug.png ($(wc -c < "$ROOT/$slug.png" 2>/dev/null) bytes)"
}

# --- icon paths (gold line art, centred on 0,0, ~ -45..45) ---
IC_SCALES='<line x1="0" y1="-46" x2="0" y2="40"/><line x1="-44" y1="-30" x2="44" y2="-30"/><circle cx="0" cy="-46" r="4" fill="#c9a227"/><path d="M-44 -30 L-58 6 a14 14 0 0 0 28 0 Z"/><path d="M44 -30 L30 6 a14 14 0 0 0 28 0 Z"/><line x1="-20" y1="42" x2="20" y2="42"/>'
IC_DOC='<rect x="-34" y="-46" width="68" height="92" rx="5"/><line x1="-20" y1="-24" x2="20" y2="-24"/><line x1="-20" y1="-4" x2="20" y2="-4"/><line x1="-20" y1="16" x2="6" y2="16"/>'
IC_CLOCK='<circle cx="0" cy="0" r="46"/><line x1="0" y1="0" x2="0" y2="-28"/><line x1="0" y1="0" x2="22" y2="10"/>'
IC_CAL='<rect x="-42" y="-38" width="84" height="80" rx="6"/><line x1="-42" y1="-14" x2="42" y2="-14"/><line x1="-24" y1="-52" x2="-24" y2="-30"/><line x1="24" y1="-52" x2="24" y2="-30"/><path d="M-16 12 l10 12 18 -24"/>'
IC_HEART='<path d="M0 40 C -46 6 -40 -40 -10 -30 C 0 -26 0 -16 0 -16 C 0 -16 0 -26 10 -30 C 40 -40 46 6 0 40 Z"/><line x1="-14" y1="-2" x2="14" y2="-2"/><line x1="0" y1="-16" x2="0" y2="12"/>'
IC_PARENT='<circle cx="-12" cy="-30" r="13"/><path d="M-34 44 v-20 a22 22 0 0 1 44 0 v20"/><circle cx="26" cy="-6" r="9"/><path d="M10 44 v-12 a16 16 0 0 1 32 0 v12"/>'
IC_DOOR='<rect x="-40" y="-46" width="52" height="92" rx="3"/><circle cx="0" cy="2" r="3.4" fill="#c9a227"/><path d="M22 0 h36"/><path d="M44 -14 l16 14 -16 14"/>'

echo "Building Folder 1 featured images..."
page_html "UAE Labour Law Guide" "Know Your <span class=alt>Rights</span> At Work" "Your plain-English guide for 2026" "$IC_SCALES" > "$GEN/uae-labour-law.html"
page_html "UAE Labour Law" "Contract Types <span class=gold>&amp;</span> <span class=alt>Probation</span>" "What your contract really means" "$IC_DOC" > "$GEN/contract-types-explained.html"
page_html "UAE Labour Law" "Working Hours <span class=gold>&amp;</span> <span class=alt>Overtime</span>" "The numbers that decide your pay" "$IC_CLOCK" > "$GEN/working-hours-overtime.html"
page_html "UAE Labour Law" "Annual <span class=alt>Leave</span> Entitlement" "The paid days you are earning" "$IC_CAL" > "$GEN/annual-leave-entitlement.html"
page_html "UAE Labour Law" "Sick <span class=alt>Leave</span> Rules" "Your pay when you are unwell" "$IC_HEART" > "$GEN/sick-leave-rules.html"
page_html "UAE Labour Law" "Maternity <span class=gold>&amp;</span> <span class=alt>Paternity</span>" "Your rights as a new parent" "$IC_PARENT" > "$GEN/maternity-paternity-leave.html"
page_html "UAE Labour Law" "Termination <span class=gold>&amp;</span> <span class=alt>Notice</span>" "Leave with your money intact" "$IC_DOOR" > "$GEN/termination-rules.html"

for s in uae-labour-law contract-types-explained working-hours-overtime annual-leave-entitlement sick-leave-rules maternity-paternity-leave termination-rules; do
  render "$s"
done
echo "Done."
