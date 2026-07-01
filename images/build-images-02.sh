#!/usr/bin/env bash
# Folder 2 (Freelance Visa) featured images, same Inspire Ambitions brand.
set -u
ROOT="C:/Users/Kim/Claude/inspire-ambitions/images"
GEN="$ROOT/gen2"
mkdir -p "$GEN"
CHROME="/c/Program Files/Google/Chrome/Application/chrome.exe"

page_html() { # EYEBROW HEADLINE_HTML SUBLINE ICON_SVG_INNER
  local eyebrow="$1" headline="$2" sub="$3" icon="$4"
cat <<HTML
<!doctype html><html><head><meta charset="utf-8"><style>
  html,body{margin:0;padding:0;width:1200px;height:675px;overflow:hidden}*{box-sizing:border-box}
  .canvas{position:relative;width:1200px;height:675px;background:#0c1828;
    background-image:radial-gradient(rgba(255,255,255,.035) 1px, transparent 1.4px);
    background-size:7px 7px;font-family:Arial,Helvetica,sans-serif;color:#fff}
  .frame{position:absolute;inset:22px;border:1px solid rgba(201,162,39,.35)}
  .vrule{position:absolute;left:54px;top:90px;bottom:90px;width:2px;background:#c9a227}
  .glow{position:absolute;left:120px;top:150px;width:620px;height:360px;border-radius:50%;
    background:radial-gradient(closest-side,rgba(28,58,92,.85),rgba(12,24,40,0));filter:blur(6px)}
  .content{position:absolute;left:96px;top:158px;width:640px}
  .eyebrow{color:#c9a227;font-size:17px;font-weight:700;letter-spacing:6px;text-transform:uppercase;margin-bottom:22px}
  .headline{font-family:Impact,'Arial Narrow Bold','Haettenschweiler',sans-serif;font-weight:400;
    font-size:80px;line-height:.92;text-transform:uppercase;letter-spacing:1px;margin:0}
  .headline .alt{color:#b8cadd}.headline .gold{color:#c9a227}
  .divider{width:170px;height:2px;background:#c9a227;margin:30px 0 24px}
  .sub{font-family:Georgia,'Times New Roman',serif;font-style:italic;font-size:27px;color:#d9b94a;line-height:1.25}
  .brand{position:absolute;left:96px;bottom:54px;font-size:18px;font-weight:700;letter-spacing:3px}
  .brand .dom{color:#c9a227;font-weight:400;letter-spacing:1px}
  .radar{position:absolute;right:130px;top:337px;transform:translateY(-50%)}
</style></head>
<body><div class="canvas">
  <div class="frame"></div><div class="glow"></div><div class="vrule"></div>
  <div class="radar"><svg width="360" height="360" viewBox="0 0 360 360" fill="none">
      <circle cx="180" cy="180" r="170" stroke="rgba(201,162,39,.55)" stroke-width="1.2"/>
      <circle cx="180" cy="180" r="125" stroke="rgba(201,162,39,.30)" stroke-width="1"/>
      <circle cx="180" cy="180" r="80" stroke="rgba(201,162,39,.20)" stroke-width="1"/>
      <g stroke="rgba(201,162,39,.25)" stroke-width="1">
        <line x1="180" y1="6" x2="180" y2="40"/><line x1="180" y1="320" x2="180" y2="354"/>
        <line x1="6" y1="180" x2="40" y2="180"/><line x1="320" y1="180" x2="354" y2="180"/></g>
      <g transform="translate(180,180)" stroke="#c9a227" stroke-width="3.2" stroke-linecap="round" stroke-linejoin="round" fill="none">$icon</g>
    </svg></div>
  <div class="content"><div class="eyebrow">$eyebrow</div><h1 class="headline">$headline</h1>
    <div class="divider"></div><div class="sub">$sub</div></div>
  <div class="brand">INSPIRE AMBITIONS &nbsp;<span class="dom">| inspireambitions.com</span></div>
</div></body></html>
HTML
}

render() { local slug="$1"
  "$CHROME" --headless=new --disable-gpu --hide-scrollbars --no-first-run \
    --force-device-scale-factor=1 --window-size=1200,675 --user-data-dir="$GEN/.c-$slug" \
    --screenshot="$ROOT/f02-$slug.png" "file:///$GEN/$slug.html" >/dev/null 2>&1
  rm -rf "$GEN/.c-$slug"
  echo "  rendered f02-$slug.png ($(wc -c < "$ROOT/f02-$slug.png" 2>/dev/null) bytes)"
}

IC_PASSPORT='<rect x="-32" y="-46" width="64" height="92" rx="6"/><circle cx="0" cy="-10" r="15"/><path d="M-15 -10 H15 M0 -25 V5"/><line x1="-16" y1="28" x2="16" y2="28"/>'
IC_STEPS='<path d="M-46 38 H-22 V14 H2 V-10 H26 V-34 H48"/><circle cx="48" cy="-34" r="5" fill="#c9a227"/>'
IC_COINS='<ellipse cx="0" cy="-24" rx="34" ry="12"/><path d="M-34 -24 V-2 a34 12 0 0 0 68 0 V-24"/><path d="M-34 2 V22 a34 12 0 0 0 68 0 V2"/>'
IC_FORK='<path d="M0 44 V2"/><path d="M0 2 L-32 -38"/><path d="M0 2 L32 -38"/><path d="M-32 -38 l16 4 M-32 -38 l4 16"/><path d="M32 -38 l-16 4 M32 -38 l-4 16"/>'
IC_QMARK='<path d="M-18 -20 a18 18 0 1 1 26 22 q-8 6 -8 16"/><circle cx="0" cy="36" r="3.6" fill="#c9a227"/>'
IC_GRID='<rect x="-42" y="-42" width="36" height="36" rx="6"/><rect x="6" y="-42" width="36" height="36" rx="6"/><rect x="-42" y="6" width="36" height="36" rx="6"/><rect x="6" y="6" width="36" height="36" rx="6"/>'

echo "Building Folder 2 featured images..."
EB="UAE Freelance Visa"
page_html "$EB" "Work For <span class=alt>Yourself</span>" "Your guide to the freelance visa" "$IC_PASSPORT" > "$GEN/uae-freelance-visa.html"
page_html "$EB" "How It <span class=alt>Works</span>" "From permit to residence, step by step" "$IC_STEPS" > "$GEN/how-it-works.html"
page_html "$EB" "Cost <span class=gold>&amp;</span> <span class=alt>Fees</span>" "What you really pay in 2026" "$IC_COINS" > "$GEN/cost-and-fees.html"
page_html "$EB" "Freelance <span class=gold>vs</span> <span class=alt>Employment</span>" "The honest trade-offs" "$IC_FORK" > "$GEN/freelance-vs-employment-visa.html"
page_html "$EB" "Is It <span class=alt>Worth It?</span>" "The real test before you leap" "$IC_QMARK" > "$GEN/is-it-worth-it.html"
page_html "$EB" "Eligible <span class=alt>Activities</span>" "What your permit actually covers" "$IC_GRID" > "$GEN/eligible-activities.html"

for s in uae-freelance-visa how-it-works cost-and-fees freelance-vs-employment-visa is-it-worth-it eligible-activities; do
  render "$s"
done
echo "Done."
