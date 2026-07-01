#!/usr/bin/env bash
set -u
ROOT="C:/Users/Kim/Claude/inspire-ambitions/images"
GEN="$ROOT/gen5"; mkdir -p "$GEN"
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
    --window-size=1200,675 --user-data-dir="$GEN/.c-$slug" --screenshot="$ROOT/f05-$slug.png" "file:///$GEN/$slug.html" >/dev/null 2>&1
  rm -rf "$GEN/.c-$slug"; echo "  rendered f05-$slug.png ($(wc -c < "$ROOT/f05-$slug.png" 2>/dev/null) bytes)"
}

IC_DOC='<rect x="-30" y="-46" width="60" height="92" rx="4"/><path d="M-16 -26 H16 M-16 -10 H16 M-16 6 H10 M-16 22 H16"/><circle cx="0" cy="-36" r="6" fill="#c9a227"/>'
IC_GRID='<rect x="-40" y="-46" width="80" height="92" rx="4"/><line x1="-40" y1="-22" x2="40" y2="-22"/><line x1="-40" y1="0" x2="40" y2="0"/><line x1="0" y1="-46" x2="0" y2="46"/>'
IC_PHOTO='<rect x="-44" y="-30" width="88" height="60" rx="4"/><circle cx="0" cy="0" r="16"/><path d="M-44 16 L-20 -6 L0 8 L16 -10 L44 16"/>'
IC_BADGE='<rect x="-32" y="-42" width="64" height="84" rx="4"/><circle cx="0" cy="-14" r="10"/><path d="M-18 6 H18 M-18 18 H10 M-18 30 H14"/>'
IC_GLOBE='<circle cx="0" cy="0" r="42"/><ellipse cx="0" cy="0" rx="42" ry="18"/><path d="M0 -42 V42"/><path d="M-38 -16 H38 M-38 16 H38"/>'
IC_COMPARE='<rect x="-44" y="-30" width="36" height="60" rx="3"/><rect x="8" y="-30" width="36" height="60" rx="3"/><path d="M-26 -10 H-14 M-26 4 H-18 M-26 18 H-14"/><path d="M16 -10 H30 M16 4 H26 M16 18 H30"/>'
IC_ENVELOPE='<rect x="-42" y="-26" width="84" height="56" rx="4"/><path d="M-42 -22 L0 8 L42 -22"/>'

echo "Building Folder 5 featured images..."
EB="UAE CV Guide"
page_html "$EB" "CV <span class=alt>Guide</span>" "How to write a CV that works in Dubai" "$IC_DOC" > "$GEN/gcc-cv-guide.html"
page_html "$EB" "CV <span class=alt>Format</span>" "The structure that wins interviews" "$IC_GRID" > "$GEN/cv-format-for-dubai.html"
page_html "$EB" "Photo or <span class=alt>No Photo?</span>" "The Gulf answer in plain English" "$IC_PHOTO" > "$GEN/photo-or-no-photo.html"
page_html "$EB" "Visa Status <span class=alt>Line</span>" "What to write and why it matters" "$IC_BADGE" > "$GEN/visa-status-line.html"
page_html "$EB" "The Nationality <span class=alt>Question</span>" "Why it belongs on a Gulf CV" "$IC_GLOBE" > "$GEN/nationality-question.html"
page_html "$EB" "Why Western <span class=alt>Advice Fails</span>" "And what to do instead" "$IC_COMPARE" > "$GEN/why-western-cv-advice-fails.html"
page_html "$EB" "Cover <span class=alt>Letter</span>" "The short version that works" "$IC_ENVELOPE" > "$GEN/cover-letter-for-uae-jobs.html"

for s in gcc-cv-guide cv-format-for-dubai photo-or-no-photo visa-status-line nationality-question why-western-cv-advice-fails cover-letter-for-uae-jobs; do render "$s"; done
echo "Done."
