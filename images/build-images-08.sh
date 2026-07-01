#!/usr/bin/env bash
set -u
ROOT="C:/Users/Kim/Claude/inspire-ambitions/images"
GEN="$ROOT/gen8"; mkdir -p "$GEN"
CHROME="/c/Program Files/Google/Chrome/Application/chrome.exe"

page_html() { local eyebrow="$1" headline="$2" sub="$3" icon="$4"
cat <<HTML
<!doctype html><html><head><meta charset="utf-8"><style>
  html,body{margin:0;padding:0;width:1200px;height:675px;overflow:hidden}*{box-sizing:border-box}
  .canvas{position:relative;width:1200px;height:675px;background:#0c1828;
    background-image:radial-gradient(rgba(255,255,255,.035) 1px, transparent 1.4px);background-size:7px 7px;
    font-family:Arial,Helvetica,sans-serif;color:#fff}
  .frame{position:absolute;inset:22px;border:1px solid rgba(201,162,39,.35)}
  .vrule{position:absolute;left:54px;top:90px;bottom:90px;width:2px;background:#c9a227}
  .glow{position:absolute;left:120px;top:150px;width:620px;height:360px;border-radius:50%;
    background:radial-gradient(closest-side,rgba(28,58,92,.85),rgba(12,24,40,0));filter:blur(6px)}
  .content{position:absolute;left:96px;top:158px;width:640px}
  .eyebrow{color:#c9a227;font-size:17px;font-weight:700;letter-spacing:6px;text-transform:uppercase;margin-bottom:22px}
  .headline{font-family:Impact,'Arial Narrow Bold',sans-serif;font-weight:400;font-size:80px;line-height:.92;
    text-transform:uppercase;letter-spacing:1px;margin:0}
  .headline .alt{color:#b8cadd}.headline .gold{color:#c9a227}
  .divider{width:170px;height:2px;background:#c9a227;margin:30px 0 24px}
  .sub{font-family:Georgia,serif;font-style:italic;font-size:27px;color:#d9b94a;line-height:1.25}
  .brand{position:absolute;left:96px;bottom:54px;font-size:18px;font-weight:700;letter-spacing:3px}
  .brand .dom{color:#c9a227;font-weight:400;letter-spacing:1px}
  .radar{position:absolute;right:130px;top:337px;transform:translateY(-50%)}
</style></head><body><div class="canvas">
  <div class="frame"></div><div class="glow"></div><div class="vrule"></div>
  <div class="radar"><svg width="360" height="360" viewBox="0 0 360 360" fill="none">
    <circle cx="180" cy="180" r="170" stroke="rgba(201,162,39,.55)" stroke-width="1.2"/>
    <circle cx="180" cy="180" r="125" stroke="rgba(201,162,39,.30)" stroke-width="1"/>
    <circle cx="180" cy="180" r="80" stroke="rgba(201,162,39,.20)" stroke-width="1"/>
    <g stroke="rgba(201,162,39,.25)" stroke-width="1"><line x1="180" y1="6" x2="180" y2="40"/>
      <line x1="180" y1="320" x2="180" y2="354"/><line x1="6" y1="180" x2="40" y2="180"/>
      <line x1="320" y1="180" x2="354" y2="180"/></g>
    <g transform="translate(180,180)" stroke="#c9a227" stroke-width="3.2" stroke-linecap="round" stroke-linejoin="round" fill="none">$icon</g>
  </svg></div>
  <div class="content"><div class="eyebrow">$eyebrow</div><h1 class="headline">$headline</h1>
    <div class="divider"></div><div class="sub">$sub</div></div>
  <div class="brand">INSPIRE AMBITIONS &nbsp;<span class="dom">| inspireambitions.com</span></div>
</div></body></html>
HTML
}
render() { local slug="$1"
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --no-first-run --force-device-scale-factor=1 \
    --window-size=1200,675 --user-data-dir="$GEN/.c-$slug" --screenshot="$ROOT/f08-$slug.png" "file:///$GEN/$slug.html" >/dev/null 2>&1
  rm -rf "$GEN/.c-$slug"; echo "  rendered f08-$slug.png ($(wc -c < "$ROOT/f08-$slug.png" 2>/dev/null) bytes)"
}

IC_SKYLINE='<path d="M-46 38 L-46 -8 L-32 -8 L-32 -28 L-12 -28 L-12 6 L8 6 L8 -38 L24 -38 L24 -2 L46 -2 L46 38 Z"/><line x1="-46" y1="38" x2="46" y2="38"/>'
IC_FIND='<circle cx="-6" cy="-6" r="26"/><path d="M14 14 L38 38"/><circle cx="-6" cy="-6" r="6" fill="#c9a227"/>'
IC_BADGE='<rect x="-30" y="-44" width="60" height="88" rx="6"/><rect x="-12" y="-54" width="24" height="12" rx="3"/><path d="M-15 -10 L-5 0 L15 -18"/>'
IC_PASSPORT='<rect x="-32" y="-46" width="64" height="92" rx="6"/><circle cx="0" cy="-10" r="15"/><path d="M-15 -10 H15 M0 -25 V5"/><line x1="-16" y1="28" x2="16" y2="28"/>'
IC_RIYAL='<rect x="-42" y="-26" width="84" height="56" rx="6"/><path d="M-20 -12 v22 M-20 -12 h14 a8 8 0 0 1 0 16 H-26"/><circle cx="22" cy="3" r="6" fill="#c9a227"/>'
IC_HOUSE='<path d="M-44 -2 L0 -40 L44 -2 V38 H-44 Z"/><rect x="-12" y="6" width="24" height="32"/><line x1="0" y1="-40" x2="0" y2="-2"/>'

echo "Building Folder 8 featured images..."
EB="Working in Saudi Arabia"
page_html "$EB" "Saudi <span class=alt>Arabia</span>" "The honest 2026 guide" "$IC_SKYLINE" > "$GEN/working-in-saudi-arabia.html"
page_html "$EB" "Finding <span class=alt>A Job</span>" "The method that works" "$IC_FIND" > "$GEN/finding-a-job.html"
page_html "$EB" "Saudisation <span class=alt>Explained</span>" "Nitaqat bands for expatriates" "$IC_BADGE" > "$GEN/saudisation.html"
page_html "$EB" "Work <span class=alt>Visa</span>" "Your employer pays, not you" "$IC_PASSPORT" > "$GEN/work-visa.html"
page_html "$EB" "Saudi <span class=alt>Salaries</span>" "What expatriates earn in 2026" "$IC_RIYAL" > "$GEN/salaries.html"
page_html "$EB" "Culture <span class=gold>&amp;</span> <span class=alt>Relocation</span>" "What the move really feels like" "$IC_HOUSE" > "$GEN/culture-and-relocation.html"

for s in working-in-saudi-arabia finding-a-job saudisation work-visa salaries culture-and-relocation; do render "$s"; done
echo "Done."
