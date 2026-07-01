#!/usr/bin/env bash
# Folder 3 (Employment Visa) featured images, same Inspire Ambitions brand.
set -u
ROOT="C:/Users/Kim/Claude/inspire-ambitions/images"
GEN="$ROOT/gen3"; mkdir -p "$GEN"
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
    --window-size=1200,675 --user-data-dir="$GEN/.c-$slug" --screenshot="$ROOT/f03-$slug.png" "file:///$GEN/$slug.html" >/dev/null 2>&1
  rm -rf "$GEN/.c-$slug"; echo "  rendered f03-$slug.png ($(wc -c < "$ROOT/f03-$slug.png" 2>/dev/null) bytes)"
}

IC_BADGE='<rect x="-30" y="-44" width="60" height="88" rx="6"/><rect x="-12" y="-54" width="24" height="12" rx="3"/><circle cx="0" cy="-14" r="12"/><path d="M-18 16 h36 M-18 30 h24"/>'
IC_STEPS='<path d="M-46 38 H-22 V14 H2 V-10 H26 V-34 H48"/><circle cx="48" cy="-34" r="5" fill="#c9a227"/>'
IC_WALLET='<rect x="-42" y="-26" width="84" height="54" rx="8"/><path d="M22 -4 a9 9 0 0 0 0 18 H42 V-4 Z"/><circle cx="30" cy="5" r="3.2" fill="#c9a227"/><path d="M-42 -8 H20"/>'
IC_LAYERS='<path d="M0 -42 L46 -18 L0 6 L-46 -18 Z"/><path d="M-46 2 L0 26 L46 2"/><path d="M-46 18 L0 42 L46 18"/>'
IC_RENEW='<path d="M-30 -8 a30 30 0 0 1 52 -20"/><path d="M22 -42 l4 16 -16 2"/><path d="M30 8 a30 30 0 0 1 -52 20"/><path d="M-22 42 l-4 -16 16 -2"/>'
IC_SWAP='<path d="M-42 -12 H28"/><path d="M12 -28 l18 16 -18 16"/><path d="M42 16 H-28"/><path d="M-12 0 l-18 16 18 16"/>'

echo "Building Folder 3 featured images..."
EB="UAE Employment Visa"
page_html "$EB" "Employment <span class=alt>Visa</span>" "How working in the UAE really works" "$IC_BADGE" > "$GEN/uae-employment-visa.html"
page_html "$EB" "How It <span class=alt>Works</span>" "From offer to residence, step by step" "$IC_STEPS" > "$GEN/how-it-works.html"
page_html "$EB" "Who <span class=alt>Pays?</span>" "The real cost question, answered" "$IC_WALLET" > "$GEN/cost-and-who-pays.html"
page_html "$EB" "Visa <span class=alt>Types</span>" "Which permit fits your job" "$IC_LAYERS" > "$GEN/visa-types.html"
page_html "$EB" "Status <span class=gold>&amp;</span> <span class=alt>Renewal</span>" "Keeping your visa valid" "$IC_RENEW" > "$GEN/status-and-renewal.html"
page_html "$EB" "Cancel <span class=gold>&amp;</span> <span class=alt>Transfer</span>" "Changing jobs the clean way" "$IC_SWAP" > "$GEN/cancellation-and-transfer.html"

for s in uae-employment-visa how-it-works cost-and-who-pays visa-types status-and-renewal cancellation-and-transfer; do render "$s"; done
echo "Done."
