#!/usr/bin/env bash
set -u
ROOT="C:/Users/Kim/Claude/inspire-ambitions/images"
GEN="$ROOT/gen7"; mkdir -p "$GEN"
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
    --window-size=1200,675 --user-data-dir="$GEN/.c-$slug" --screenshot="$ROOT/f07-$slug.png" "file:///$GEN/$slug.html" >/dev/null 2>&1
  rm -rf "$GEN/.c-$slug"; echo "  rendered f07-$slug.png ($(wc -c < "$ROOT/f07-$slug.png" 2>/dev/null) bytes)"
}

IC_BARS='<rect x="-42" y="-6" width="20" height="48"/><rect x="-10" y="-22" width="20" height="64"/><rect x="22" y="-38" width="20" height="80"/>'
IC_ROLES='<rect x="-44" y="-32" width="88" height="64" rx="4"/><circle cx="-22" cy="-8" r="9"/><circle cx="22" cy="-8" r="9"/><path d="M-36 24 a14 14 0 0 1 28 0"/><path d="M8 24 a14 14 0 0 1 28 0"/>'
IC_BUILDING='<rect x="-40" y="-44" width="36" height="88"/><rect x="4" y="-20" width="36" height="64"/><path d="M-36 -32 H-12 M-36 -16 H-12 M-36 0 H-12 M-36 16 H-12"/><path d="M8 -8 H36 M8 8 H36 M8 24 H36"/>'
IC_HANDSHAKE='<path d="M-44 -4 L-22 -22 L0 -4 L-22 14 Z"/><path d="M44 -4 L22 -22 L0 -4 L22 14 Z"/><circle cx="0" cy="-4" r="6" fill="#c9a227"/>'
IC_MASK='<path d="M-44 -10 a20 20 0 0 0 40 0 V-30 H-44 Z"/><path d="M44 -10 a20 20 0 0 1 -40 0 V-30 H44 Z"/><circle cx="-24" cy="-18" r="3" fill="#c9a227"/><circle cx="24" cy="-18" r="3" fill="#c9a227"/>'

echo "Building Folder 7 featured images..."
EB="UAE Salary Guide"
page_html "$EB" "Salary <span class=alt>Guide</span>" "Honest numbers and hidden ones" "$IC_BARS" > "$GEN/uae-salary-guide.html"
page_html "$EB" "By <span class=alt>Role</span>" "Real bands for the jobs people ask" "$IC_ROLES" > "$GEN/by-role.html"
page_html "$EB" "By <span class=alt>Sector</span>" "Where the money sits in 2026" "$IC_BUILDING" > "$GEN/by-sector.html"
page_html "$EB" "Negotiate <span class=alt>The Offer</span>" "Push the number, keep the job" "$IC_HANDSHAKE" > "$GEN/negotiating-your-offer.html"
page_html "$EB" "What The <span class=alt>Band Hides</span>" "The numbers that actually pay" "$IC_MASK" > "$GEN/what-the-band-hides.html"

for s in uae-salary-guide by-role by-sector negotiating-your-offer what-the-band-hides; do render "$s"; done
echo "Done."
