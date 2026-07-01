#!/usr/bin/env bash
set -u
ROOT="C:/Users/Kim/Claude/inspire-ambitions/images"
GEN="$ROOT/gen4"; mkdir -p "$GEN"
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
    --window-size=1200,675 --user-data-dir="$GEN/.c-$slug" --screenshot="$ROOT/f04-$slug.png" "file:///$GEN/$slug.html" >/dev/null 2>&1
  rm -rf "$GEN/.c-$slug"; echo "  rendered f04-$slug.png ($(wc -c < "$ROOT/f04-$slug.png" 2>/dev/null) bytes)"
}

IC_COMPASS='<circle cx="0" cy="0" r="46"/><path d="M0 -34 L10 0 L0 34 L-10 0 Z"/><circle cx="0" cy="0" r="3.4" fill="#c9a227"/>'
IC_CAP='<path d="M-46 -6 L0 -28 L46 -6 L0 16 Z"/><path d="M0 16 V42"/><path d="M28 4 V28 a28 14 0 0 1 -56 0 V4"/>'
IC_TARGET='<circle cx="0" cy="0" r="44"/><circle cx="0" cy="0" r="26"/><path d="M0 0 L34 -34"/><path d="M34 -34 L38 -22 L22 -38 Z" fill="#c9a227"/>'
IC_CV='<rect x="-32" y="-46" width="64" height="92" rx="6"/><circle cx="0" cy="-22" r="10"/><path d="M-16 0 H16 M-22 16 H22 M-22 30 H10"/>'
IC_STAR='<circle cx="0" cy="0" r="44"/><path d="M0 -22 l7 14 16 2 -12 11 3 16 -14 -8 -14 8 3 -16 -12 -11 16 -2 Z" fill="#c9a227" stroke="#c9a227"/>'
IC_STAIRS='<path d="M-46 38 H-22 V14 H2 V-10 H26 V-34 H48"/><circle cx="48" cy="-34" r="5" fill="#c9a227"/><path d="M-46 38 V44 H48"/>'
IC_BELL='<path d="M-30 16 H30 a30 28 0 0 0 -60 0 Z"/><path d="M0 16 V-18 a8 8 0 0 1 16 0 V16" transform="translate(-8,0)"/><circle cx="0" cy="28" r="5"/>'

echo "Building Folder 4 featured images..."
EB="UAE Internships"
page_html "GCC Recruitment Guide" "Recruitment <span class=alt>Guide</span>" "Working and hiring across the Gulf" "$IC_COMPASS" > "$GEN/gcc-recruitment-guide.html"
page_html "$EB" "Internships <span class=alt>Guide</span>" "Your way into the UAE job market" "$IC_CAP" > "$GEN/internships.html"
page_html "$EB" "How To <span class=alt>Get One</span>" "The method that beats luck" "$IC_TARGET" > "$GEN/how-to-get-one.html"
page_html "$EB" "Intern <span class=alt>CV</span>" "Build one with no experience" "$IC_CV" > "$GEN/intern-cv.html"
page_html "$EB" "What Employers <span class=alt>Want</span>" "Attitude, not just grades" "$IC_STAR" > "$GEN/what-employers-want.html"
page_html "$EB" "Intern To <span class=alt>Job</span>" "Turn the placement into an offer" "$IC_STAIRS" > "$GEN/convert-to-a-job.html"
page_html "$EB" "Hospitality <span class=alt>Internships</span>" "Your way into the hotels" "$IC_BELL" > "$GEN/hospitality.html"

for s in gcc-recruitment-guide internships how-to-get-one intern-cv what-employers-want convert-to-a-job hospitality; do render "$s"; done
echo "Done."
