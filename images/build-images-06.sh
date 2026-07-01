#!/usr/bin/env bash
set -u
ROOT="C:/Users/Kim/Claude/inspire-ambitions/images"
GEN="$ROOT/gen6"; mkdir -p "$GEN"
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
    --window-size=1200,675 --user-data-dir="$GEN/.c-$slug" --screenshot="$ROOT/f06-$slug.png" "file:///$GEN/$slug.html" >/dev/null 2>&1
  rm -rf "$GEN/.c-$slug"; echo "  rendered f06-$slug.png ($(wc -c < "$ROOT/f06-$slug.png" 2>/dev/null) bytes)"
}

IC_BRIEFCASE='<rect x="-40" y="-26" width="80" height="56" rx="4"/><path d="M-18 -26 V-38 a4 4 0 0 1 4 -4 H14 a4 4 0 0 1 4 4 V-26"/><line x1="-40" y1="-4" x2="40" y2="-4"/><circle cx="0" cy="-4" r="4" fill="#c9a227"/>'
IC_INDIA='<circle cx="0" cy="0" r="42"/><path d="M-42 0 H42"/><path d="M-42 -16 H42"/><path d="M-42 16 H42"/><circle cx="0" cy="0" r="6" fill="#c9a227"/>'
IC_GRADCAP='<path d="M0 -10 L-46 6 L0 22 L46 6 Z"/><path d="M0 22 V42"/><path d="M30 12 V32 a30 12 0 0 1 -60 0 V12"/>'
IC_PLANE='<path d="M-44 0 L-12 -8 L0 -34 L8 -34 L4 -8 L40 -16 L40 -8 L4 4 L8 26 L0 26 L-12 4 L-44 8 Z"/>'
IC_TARGET='<circle cx="0" cy="0" r="44"/><circle cx="0" cy="0" r="26"/><circle cx="0" cy="0" r="8" fill="#c9a227"/>'

echo "Building Folder 6 featured images..."
EB="UAE Job Search"
page_html "$EB" "Get A <span class=alt>Job</span> In The UAE" "The honest 2026 playbook" "$IC_BRIEFCASE" > "$GEN/how-to-get-a-job-in-the-uae.html"
page_html "$EB" "From <span class=alt>India</span>" "The real path, no scams" "$IC_INDIA" > "$GEN/from-india.html"
page_html "$EB" "For <span class=alt>Freshers</span>" "Numbers, sectors, and steps" "$IC_GRADCAP" > "$GEN/for-freshers.html"
page_html "$EB" "On A <span class=alt>Visit Visa</span>" "When it works, when it does not" "$IC_PLANE" > "$GEN/on-a-visit-visa.html"
page_html "$EB" "No <span class=alt>Experience</span>" "A real plan, not false hope" "$IC_TARGET" > "$GEN/no-experience.html"

for s in how-to-get-a-job-in-the-uae from-india for-freshers on-a-visit-visa no-experience; do render "$s"; done
echo "Done."
