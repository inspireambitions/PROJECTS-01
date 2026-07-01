#!/usr/bin/env bash
set -u
ROOT="C:/Users/Kim/Claude/inspire-ambitions/images"
GEN="$ROOT/gen11"; mkdir -p "$GEN"
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
  .headline{font-family:Impact,'Arial Narrow Bold',sans-serif;font-weight:400;font-size:74px;line-height:.95;
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
    --window-size=1200,675 --user-data-dir="$GEN/.c-$slug" --screenshot="$ROOT/f11-$slug.png" "file:///$GEN/$slug.html" >/dev/null 2>&1
  rm -rf "$GEN/.c-$slug"; echo "  rendered f11-$slug.png ($(wc -c < "$ROOT/f11-$slug.png" 2>/dev/null) bytes)"
}

IC_SPEECH='<path d="M-44 -30 H44 V14 H-10 L-26 30 V14 H-44 Z"/><circle cx="-18" cy="-8" r="3" fill="#c9a227"/><circle cx="0" cy="-8" r="3" fill="#c9a227"/><circle cx="18" cy="-8" r="3" fill="#c9a227"/>'
IC_MIRROR='<rect x="-30" y="-44" width="60" height="88" rx="30"/><circle cx="0" cy="-10" r="14"/><path d="M-16 18 a16 16 0 0 1 32 0"/>'
IC_RIYAL='<rect x="-42" y="-26" width="84" height="56" rx="6"/><path d="M-20 -12 v22 M-20 -12 h14 a8 8 0 0 1 0 16 H-26"/><circle cx="22" cy="3" r="6" fill="#c9a227"/>'
IC_DOOR='<rect x="-40" y="-46" width="52" height="92" rx="3"/><circle cx="0" cy="2" r="3.4" fill="#c9a227"/><path d="M22 0 h36"/><path d="M44 -14 l16 14 -16 14"/>'
IC_TARGET='<circle cx="0" cy="0" r="44"/><circle cx="0" cy="0" r="26"/><circle cx="0" cy="0" r="8" fill="#c9a227"/>'
IC_COMPASS='<circle cx="0" cy="0" r="46"/><path d="M0 -34 L10 0 L0 34 L-10 0 Z"/><circle cx="0" cy="0" r="3.4" fill="#c9a227"/>'

echo "Building Folder 11 featured images..."
EB="GCC Interview Answers"
page_html "$EB" "Interview <span class=alt>Answers</span>" "Why generic scripts fail here" "$IC_SPEECH" > "$GEN/gcc-interview-answers.html"
page_html "$EB" "Tell Me <span class=alt>About You</span>" "The Gulf-specific structure" "$IC_MIRROR" > "$GEN/tell-me-about-yourself.html"
page_html "$EB" "Expected <span class=alt>Salary</span>" "The answer that protects you" "$IC_RIYAL" > "$GEN/expected-salary.html"
page_html "$EB" "Why You're <span class=alt>Leaving</span>" "The answer panels trust" "$IC_DOOR" > "$GEN/why-leave-your-job.html"
page_html "$EB" "Greatest <span class=alt>Weakness</span>" "A real answer, not a trick" "$IC_TARGET" > "$GEN/greatest-weakness.html"
page_html "$EB" "Why The <span class=alt>Gulf?</span>" "The question no Western guide covers" "$IC_COMPASS" > "$GEN/why-the-gulf.html"

for s in gcc-interview-answers tell-me-about-yourself expected-salary why-leave-your-job greatest-weakness why-the-gulf; do render "$s"; done
echo "Done."
