# Brief 01 — The Network Shell (connect everything, kill the duplicate, unify analytics)

**Priority:** 1 — cheapest, highest leverage. Turns one working SEO channel into distribution
for the whole portfolio.

## 1.1 Shared cross-link strip `[CODE + WP]`

- A compact, consistent component rendered on **every** property (header link or footer band):
  *"Free GCC career tools: CV Builder · AI Job Risk Calculator · Gratuity Calculator ·
  Job Decision Tool · Guides"* — plain HTML links (crawlable, no JS-only nav), current property
  de-emphasized, UTM-free but PostHog-tracked (`network_strip_clicked` with from/to props).
- Implementation: a tiny shared package or copied component for the Next.js apps
  (cv, calculator, tools if Next.js); a footer widget/menu for WordPress properties `[WP]`.
- **Contextual CTAs beat the strip** — the strip is the floor, not the ceiling. Each brief
  defines its tool-specific "next step" CTAs; the strip guarantees no page is ever a dead end
  even where contextual CTAs don't fit.

## 1.2 Kill the duplicate builder `[CODE]`

- **Decision (final): cv.inspireambitions.com is the one CV builder.**
  resume.inspireambitions.com is deprecated:
  1. Inventory its indexed URLs (`site:resume.inspireambitions.com`, Search Console).
  2. 301 every URL to the closest equivalent on cv. (templates page → cv.'s templates section;
     unknown paths → cv. homepage).
  3. Keep redirects permanently (domain mapping stays on Vercel); remove the app.
  4. Update every internal link and any main-site wrapper page pointing at resume.*.
- Anything unique on resume.* (a template, copy that ranks) migrates INTO cv. first.

## 1.3 Unified analytics `[CODE + WP]`

- PostHog (org "Job Strike") on **all** properties with a shared property: `product` =
  cv-builder | calculator | tools-hub | decision-tool | main-site | blog.
- Cross-domain session stitching where PostHog supports it; GA properties dual-run 30 days
  then retire (except any GA the WP site needs for legacy reasons — Kim's call `[WP]`).
- One dashboard: entries by property → cross-navigation flows → capture events. This makes the
  "traffic network" measurable for the first time.

## 1.4 SEO hygiene sweep `[CODE + WP]`

- Every property: verified in Search Console, sitemap submitted, robots sane, canonical
  correct, one `<h1>`, OG image present.
- Main site gets `/network` (or footer block) linking every property — a crawlable hub page
  passing authority outward (the "sitemap index" of the portfolio).
- Blog permalink fix is specced in brief 04 (it's `[WP]` work but listed here as a dependency:
  do it before building blog internal links).

## Acceptance criteria

- [ ] Network strip live on cv, calculator, tools hub, main site, blog; links crawlable; events fire
- [ ] resume.* fully 301'd; Search Console shows redirects processed; zero internal links to it remain
- [ ] PostHog reporting sessions from all properties with correct `product` prop; cross-nav flow visible
- [ ] All properties verified in Search Console with submitted sitemaps
- [ ] Zero-dead-end crawl passes: no page without onward internal links

## Codex handoff prompt

> Implement per this brief across the Next.js properties: the shared network-strip component
> (crawlable links, PostHog network_strip_clicked events, current-property de-emphasis) added to
> cv-builder, calculator, and tools-hub apps; full 301 mapping from resume.inspireambitions.com
> URLs to cv.inspireambitions.com equivalents with the old app retired; PostHog snippets with the
> shared `product` property on all code properties. Produce a checklist file of the `[WP]` items
> (WordPress strip widget, GA decision, permalink dependency) for Kim to execute manually or via
> WPVibe. Finish with a crawler script that fails on any page lacking onward internal links.
