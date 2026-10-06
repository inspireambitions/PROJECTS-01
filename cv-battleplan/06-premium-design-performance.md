# Brief 06 — Premium design system, speed & mobile-first UX (governs all briefs)

**Priority:** 0 — this brief is not a feature; it is the quality bar every other brief is built
against. Codex should read it BEFORE starting briefs 01–05 and apply it to the existing builder
as its own refactor pass.

**Why it matters competitively:** Enhancv and Novoresume win perception on polish alone. Most
Gulf job seekers will meet us on a mid-range Android phone over 4G, often on Chrome or the
Instagram/TikTok in-app browser. "Free" reads as "cheap" unless the product feels expensive —
design and speed ARE the premium positioning.

---

## Part A — Design system (tokens first, no ad-hoc styling)

Create a single `design-tokens` source (CSS custom properties + Tailwind config if the repo uses
Tailwind — follow existing stack) that every component consumes. No raw hex/px in components.

### A1. Color

- **Ground:** warm off-white `#FAF9F6` light / deep neutral `#141517` dark — never pure white/black.
- **Ink:** `#1C1D1F` / `#ECEBE6`, secondary ink at 65% strength.
- **Brand accent:** one confident accent used sparingly (existing brand color if defined; else a
  deep desert gold `#8A611F` with dark-mode counterpart `#D9A94F`). Accent = actions + score dial
  only. Never accent-wash whole sections.
- **Semantic:** success `#2F6B5E`, warning `#93601F`, danger `#A8472C` — reserved for Match Score
  verdicts, compliance strip, and validation. Semantic ≠ brand accent.
- **Dark mode:** full token-level dark theme (`prefers-color-scheme` + manual toggle persisted in
  localStorage). CV *preview/export* always renders on paper-white regardless of app theme.
- WCAG AA contrast on every token pair — verified by an automated check in CI, not by eye.

### A2. Typography

- **UI face:** one modern grotesque with broad script support and self-hosted subsets (e.g.
  Inter or the repo's existing face) — subset to used glyph ranges; Arabic/Urdu/Devanagari faces
  per brief 02/03 load only when that language is active.
- **Type scale:** 12 / 14 / 16 / 20 / 25 / 31 (1.25 ratio). Body 16px minimum on mobile — never
  smaller for inputs (prevents iOS zoom-on-focus).
- Numbers in scores/dates: `font-variant-numeric: tabular-nums`.
- Line length ≤ 68ch for any explanatory text; `text-wrap: balance` on headings.

### A3. Space, shape, elevation, motion

- 4px spacing grid (4/8/12/16/24/32/48/64). No arbitrary values.
- Radius: 8px controls, 12px cards, full round for pills. One shadow scale (rest / raised /
  overlay) — soft and low-alpha, never harsh drops.
- Motion: 150–200ms ease-out micro-transitions on state change; one signature moment only — the
  Match Score dial sweeping up to its value (600ms, spring). Everything else quiet.
  `prefers-reduced-motion` disables all of it.
- Every interactive element: visible focus ring (2px accent offset), pressed state, disabled
  state. Skeleton loaders (not spinners) for anything async > 300ms.

---

## Part B — Mobile-first UX (the builder itself)

Design for 360×800 Android first; scale up. All layouts fluid from **320px to 4K**.

### B1. Editor ↔ preview on phones

- **Segmented control pinned at top: `Edit | Preview | Score`** — the three modes of the product.
  No horizontal scrolling between panes, no pinch-zoomed desktop layout.
- Preview mode renders the actual paginated CV scaled-to-fit with pinch-zoom enabled; a floating
  **Export** button rides the bottom-right (thumb zone).
- Edit mode: one section at a time as collapsible cards with completion ticks; sticky mini-header
  shows section name + overall progress. Reorder via drag handles with touch-friendly 44px targets.
- **Sticky bottom action bar** in Edit: primary action contextual (Next section → Score my CV →
  Export). Respect `env(safe-area-inset-bottom)` (iPhone home bar).

### B2. Forms that feel premium on a phone

- Correct virtual keyboards everywhere: `inputmode`/`type`/`autocomplete` (tel, email,
  organization-title, etc.). `enterkeyhint="next"` chains fields.
- Keyboard never covers the focused input (scroll-into-view with `visualViewport` handling).
- Date pickers: native inputs, not custom desktop calendars.
- AI rewrite + Match results stream in progressively — perceived speed beats actual speed.
- Photo upload: camera + gallery, client-side crop/compress to ≤200KB before any upload.

### B3. Breakpoints

- `<768px`: single pane + segmented control (above).
- `768–1279px` (tablet): Edit + Preview side-by-side 55/45; Score as slide-over panel.
- `≥1280px`: three-zone desktop — section nav rail / editor / live preview; Score docks under preview.
- Test at 320px (SE), 360, 390, 768, 1024, 1440, 1920. Nothing may horizontally scroll except
  the CV preview canvas itself.

### B4. In-app browser reality check

Instagram/TikTok/LinkedIn in-app webviews are a top Gulf traffic source. Verify: export/download
works (these webviews sandbox downloads — provide a "Open in browser to download" fallback with
share-sheet handoff), localStorage persists, and OAuth (brief 04) degrades to email OTP.

---

## Part C — Performance budget (hard gates, enforced in CI)

Measured on emulated **Moto G Power / 4G** via Lighthouse CI on every deploy. Build fails if breached:

| Metric | Budget |
|---|---|
| LCP (homepage & builder) | ≤ 2.5s |
| INP | ≤ 200ms |
| CLS | ≤ 0.05 |
| JS shipped to builder route (gzip) | ≤ 250KB initial |
| Fonts (initial, per active script) | ≤ 120KB, `font-display: swap`, preloaded |
| Lighthouse Performance / Accessibility | ≥ 90 / ≥ 95 |

How to hit it: code-split exports (JPEG/PDF pipelines lazy-load on first use), lazy-load Match
panel and non-default templates, no heavyweight PDF libs on initial route, Next/Image for all
imagery, PostHog loaded post-interactive, zero third-party scripts beyond PostHog — the product
has no payment scripts at all. CV render must never block typing — debounced preview update ≤ 16ms main-thread
chunks (move pagination math to a worker if needed).

---

## Part D — Accessibility & QA gates

- Full keyboard operability; correct labels/roles; score dial has a text equivalent
  ("72 out of 100 — close, fix the gaps").
- Screen-reader pass (VoiceOver iOS + TalkBack) on the core flow each release.
- Device matrix per release: iPhone SE, iPhone 15, mid-range Android (real 4G), iPad, 1440p
  desktop, plus Instagram in-app browser. Automated: Playwright flows at 360px and 1440px
  (build → fill → score → export) + Lighthouse CI budgets above.

---

## Acceptance criteria

- [ ] Token file exists; grep finds no raw hex/px spacing in components; CI contrast check green
- [ ] Dark mode complete; CV preview stays paper-white in dark mode
- [ ] Phone flow: full CV built, scored, exported one-handed at 360px with no horizontal scroll
- [ ] Segmented Edit/Preview/Score control + sticky action bar + safe-area padding shipped
- [ ] All Part C budgets green in Lighthouse CI on the Moto G profile; budgets fail the build when breached
- [ ] Keyboard/inputmode/autocomplete audit passes on iOS Safari + Android Chrome
- [ ] In-app-browser export fallback verified in Instagram webview
- [ ] Playwright 360px + 1440px E2E flows green; A11y score ≥ 95

## Codex handoff prompt

> This brief governs all others. First, audit the existing CV builder against Parts A–C and
> produce a gap report. Then: (1) extract a design-token layer (color incl. full dark mode, type
> scale, spacing, radius, elevation, motion) and refactor existing components onto it, following
> the repo's styling stack; (2) rebuild the mobile experience per Part B — Edit/Preview/Score
> segmented control, collapsible section cards with progress, sticky contextual action bar with
> safe-area handling, scaled pinch-zoomable preview, correct inputmode/autocomplete/enterkeyhint
> on every field; (3) implement the tablet and desktop layouts at the specified breakpoints;
> (4) enforce Part C with Lighthouse CI budgets that fail the build, code-splitting the export
> pipelines and lazy routes as listed; (5) add Playwright E2E flows at 360px and 1440px and an
> automated contrast check. Ship the gap report first for approval, then implement.
