#!/usr/bin/env bash
set -u
ROOT="C:/Users/Kim/Claude/inspire-ambitions/images"
GEN="$ROOT/gen10"; mkdir -p "$GEN"
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
    --window-size=1200,675 --user-data-dir="$GEN/.c-$slug" --screenshot="$ROOT/f10-$slug.png" "file:///$GEN/$slug.html" >/dev/null 2>&1
  rm -rf "$GEN/.c-$slug"; echo "  rendered f10-$slug.png ($(wc -c < "$ROOT/f10-$slug.png" 2>/dev/null) bytes)"
}

IC_COMPASS='<circle cx="0" cy="0" r="46"/><path d="M0 -34 L10 0 L0 34 L-10 0 Z"/><circle cx="0" cy="0" r="3.4" fill="#c9a227"/>'
IC_UAE='<rect x="-44" y="-30" width="88" height="60" rx="4"/><line x1="-44" y1="-10" x2="44" y2="-10"/><line x1="-44" y1="10" x2="44" y2="10"/><circle cx="-30" cy="0" r="6" fill="#c9a227"/>'
IC_KSA='<path d="M-44 -34 L44 -34 L44 34 L-44 34 Z"/><path d="M-30 -16 H30" stroke="#c9a227"/><path d="M-26 0 H26" stroke="#c9a227"/><path d="M-22 16 H22" stroke="#c9a227"/>'
IC_QATAR='<path d="M-44 -32 L44 -32 L20 -16 L44 0 L20 16 L44 32 L-44 32 Z"/>'
IC_DOC='<rect x="-30" y="-46" width="60" height="92" rx="4"/><path d="M-16 -26 H16 M-16 -10 H16 M-16 6 H10 M-16 22 H16"/><circle cx="0" cy="-36" r="6" fill="#c9a227"/>'
IC_FILTER='<path d="M-44 -34 L44 -34 L20 -2 V34 L-20 18 V-2 Z"/>'
IC_PANEL='<circle cx="-30" cy="-18" r="11"/><circle cx="0" cy="-22" r="12"/><circle cx="30" cy="-18" r="11"/><path d="M-44 16 a14 14 0 0 1 28 0 M-14 16 a14 14 0 0 1 28 0 M16 16 a14 14 0 0 1 28 0"/>'
IC_PASSPORT='<rect x="-32" y="-46" width="64" height="92" rx="6"/><circle cx="0" cy="-10" r="15"/><path d="M-15 -10 H15 M0 -25 V5"/><line x1="-16" y1="28" x2="16" y2="28"/>'
IC_SCALES='<line x1="0" y1="-44" x2="0" y2="38"/><line x1="-42" y1="-28" x2="42" y2="-28"/><circle cx="0" cy="-44" r="4" fill="#c9a227"/><path d="M-42 -28 L-56 8 a14 14 0 0 0 28 0 Z"/><path d="M42 -28 L28 8 a14 14 0 0 0 28 0 Z"/>'
IC_QUOTA='<rect x="-42" y="14" width="22" height="22"/><rect x="-10" y="-6" width="22" height="42"/><rect x="22" y="-26" width="22" height="62"/>'
IC_BARS='<rect x="-42" y="-6" width="20" height="48"/><rect x="-10" y="-22" width="20" height="64"/><rect x="22" y="-38" width="20" height="80"/>'

echo "Building Folder 10 featured images..."
EB="GCC Recruitment"
page_html "$EB" "Recruitment <span class=alt>Guide</span>" "How Gulf hiring really works" "$IC_COMPASS" > "$GEN/gcc-recruitment-guide.html"
page_html "$EB" "UAE <span class=alt>Hiring</span>" "What managers need to know" "$IC_UAE" > "$GEN/uae.html"
page_html "$EB" "Saudi <span class=alt>Arabia</span>" "Vision 2030 hiring market" "$IC_KSA" > "$GEN/saudi-arabia.html"
page_html "$EB" "Qatar <span class=alt>Recruitment</span>" "The smaller market worth taking seriously" "$IC_QATAR" > "$GEN/qatar.html"
page_html "$EB" "Job <span class=alt>Descriptions</span>" "Writing ones that hire" "$IC_DOC" > "$GEN/job-descriptions.html"
page_html "$EB" "Screening <span class=alt>CVs</span>" "What good reviewers look at" "$IC_FILTER" > "$GEN/screening-cvs.html"
page_html "$EB" "Interview <span class=alt>Stages</span>" "Process that actually hires" "$IC_PANEL" > "$GEN/interview-stages.html"
page_html "$EB" "Work <span class=alt>Visas</span>" "Employer responsibility, not friction" "$IC_PASSPORT" > "$GEN/work-visas.html"
page_html "$EB" "Labour <span class=alt>Law</span>" "Employer essentials across the region" "$IC_SCALES" > "$GEN/labour-law.html"
page_html "$EB" "Nationalisation <span class=alt>Quotas</span>" "Emiratisation, Saudisation, Qatarisation" "$IC_QUOTA" > "$GEN/nationalisation-quotas.html"
page_html "$EB" "Salary <span class=alt>Benchmarking</span>" "Build bands worth defending" "$IC_BARS" > "$GEN/salary-benchmarking.html"

for s in gcc-recruitment-guide uae saudi-arabia qatar job-descriptions screening-cvs interview-stages work-visas labour-law nationalisation-quotas salary-benchmarking; do render "$s"; done
echo "Done."
