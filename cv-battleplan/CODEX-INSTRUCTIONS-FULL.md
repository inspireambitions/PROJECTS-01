# CODEX BUILD INSTRUCTIONS — InspireAmbitions CV Builder (consolidated)

> Single-file handoff. Contains the master plan + all 6 build briefs in build order.
> Build order: Brief 06 first (governing quality bar — audit + gap report before code),
> then 01 → 02 → 03 → 05 → 04. Each brief ends with its own handoff prompt and
> acceptance criteria. The product is 100% FREE — no Stripe, no payment code anywhere.
> The only gate in the product: PDF/Word export asks for an email once; JPEG never does.

---

# CV Builder Battle Plan — Master Document

**Product:** cv.inspireambitions.com (Next.js on Vercel, project `cv-builder-for-blog-inspireambitions-com`)
**Owner:** Kim / InspireAmbitions
**Date:** July 2026
**Builder of record:** Codex (feature briefs 01–05 in this folder are written as Codex handoffs)

---

## 1. The strategy in one paragraph

Every global competitor (Zety, Resume.io, MyPerfectResume, Enhancv, CVMaker) monetizes through a
$1–3 trial that auto-renews at $24–30/month — a model they cannot abandon and that dominates their
negative reviews. Every regional competitor (Tadween, CV Gulf, Naukrigulf) has language but no
hiring credibility and no job data. We win by fusing the two assets Kim already owns —
**a free, HR-specialist-authored CV builder** and **the JobStrike UAE live job database**
(Supabase project `txnkaztivqvqppyeedwm`: `jobs`, `applications`, `fit_scores`, 645 scrape runs) —
into one product loop no competitor can copy: *build a GCC-native CV → score it against real,
live UAE vacancies → track the applications — all free, with the email list as the asset we grow.*

## 2. The five bets (build order)

| # | Brief | What it is | Beats | Effort |
|---|-------|-----------|-------|--------|
| 0 | `06-premium-design-performance.md` | **Governing quality bar** — design tokens + dark mode, mobile-first Edit/Preview/Score UX, hard performance budgets in CI, all-screen layouts 320px→4K | Enhancv/Novoresume on polish; every builder on mobile speed | Pass 1 up front, then enforced in every brief |
| 1 | `01-gulf-match-score.md` | Paste a job description (or pick a live JobStrike job), get a 0–100 Gulf Match Score with a keyword-gap list and one-click fixes | Rezi Score, Novoresume Skill Gap, Teal Job Matcher | ~1–2 wks |
| 2 | `02-templates-and-rtl.md` | 8 sector templates + true RTL/Arabic editing mode | Tadween, CV Gulf, every Western builder | ~2 wks |
| 3 | `03-language-packs.md` | UI + section headings in EN / AR / HI / UR / TL | Nobody covers all five — near blue ocean | ~1 wk |
| 4 | `04-jobstrike-bridge.md` | Application tracker on live UAE jobs + trackable CV share links | Teal ($13/wk, US-only), VisualCV analytics | ~2–3 wks |
| 5 | `05-trust-and-monetization.md` | Review flywheel, "no trap" positioning, comparison pages, email-gated PDF/Word export (list building via Resend) | The entire category's trust problem | ~1–2 wks |

**Sequencing rule:** brief 06's audit + token/mobile refactor pass comes first, then ship
1 → 2 → 3 → 5 → 4 with 06's budgets enforced throughout. The Match Score is the demo-able wow feature;
templates+RTL defend the regional claim; languages are cheap and uncontested; trust/monetization
turns traffic into reviews and revenue; the JobStrike bridge is the moat but needs the most
plumbing, so it lands last.

## 3. Positioning (use everywhere)

> **"The only CV builder built by a practising Gulf HR specialist — scored against real UAE jobs,
> free forever. No $2.95 trial. No $25 surprise renewal."**

- Lead with the human credential, not "AI-powered" (everyone says that).
- Name the trial-trap directly on the homepage and download button. Competitors are structurally
  unable to answer this.
- "Gulf Match Score" is a brandable asset — always capitalize, always show the number.

## 4. Monetization principle — fully free, email as the currency

**No payments anywhere. No Stripe.** The tool is 100% free; the asset we build is the email list
(which feeds the existing Resend newsletter and, later, JobStrike):

1. **JPEG export:** instant, anonymous, no email, no watermark — the headline free claim stays intact.
2. **PDF & Word (DOCX) export:** gated behind a single email field. Honest copy, one-time per
   device, address goes to a Resend audience. Spec in brief 05, Part D.
3. **Never** gate the builder itself, the Match Score, or templates. The email gate exists at
   exactly one point: choosing PDF/Word at download.
4. Paid offerings (HR Review, JobStrike Pro) are explicitly **deferred** — revisit only once the
   list and review base are grown. Nothing in briefs 01–06 should build payment plumbing.

## 5. KPIs (instrument via PostHog, org "Job Strike")

| Event | Name |
|---|---|
| CV started | `cv_started` |
| CV exported | `cv_exported` (props: template, language, format) |
| Match run | `match_score_run` (props: score, source=paste\|jobstrike) |
| Gap fix applied | `match_gap_fixed` |
| Review request shown / clicked | `review_prompt_shown` / `review_prompt_clicked` |
| Email gate shown / completed | `email_gate_shown` / `email_captured` (props: format) |

90-day targets: 200+ Trustpilot reviews (from 27), Match Score used in ≥40% of sessions,
2,000+ emails captured via the PDF/Word gate, comparison pages ranking for
"zety alternative uae" / "dubai cv builder".

## 6. Ground rules for Codex

- The CV builder codebase lives in its own repo (deployed via Vercel project
  `prj_AIfXZRQO63nPlcque7QQzpO4EO44`). These briefs are specs, not diffs — read the existing
  code first and follow its conventions (state management, styling, component patterns).
- The builder currently has **no auth and no database**. Briefs 01–03 and 05 must keep it that
  way (localStorage + stateless API routes). Only brief 04 introduces Supabase auth, and only
  behind an optional "save & track" flow — never as a wall in front of the builder.
- All AI calls server-side (Next.js API routes / route handlers), Anthropic API, cheap model for
  extraction, deterministic scoring in code (scores must be reproducible — see brief 01).
- Every feature ships with PostHog events from the table above.
- RTL and i18n are foundations, not afterthoughts: from brief 02 onward all new components use
  CSS logical properties (`margin-inline-start`, not `margin-left`).

## 7. Verification checklist per brief

Each brief has its own acceptance criteria. Globally, nothing ships unless:
- [ ] Works on mobile Safari + Chrome Android (most Gulf job seekers are mobile-first)
- [ ] Passes brief 06's performance budgets (Lighthouse CI on the Moto G/4G profile) and uses
      its design tokens — no ad-hoc styling
- [ ] Arabic string rendering verified in RTL mode (no bidi breakage with mixed EN/AR)
- [ ] Free JPEG export still works with zero signup and zero email; PDF/Word email gate is the
      only gate anywhere in the product
- [ ] PostHog events fire (check live in the Job Strike project)

---

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

---

# Brief 01 — Gulf Match Score™ (JD-matching engine)

**Priority:** 1 (build first)
**Competitive target:** Rezi Score (23-point ATS check), Novoresume Skill Gap Analyzer, Teal Job Matcher — all paid. Ours is free and Gulf-calibrated.

## Objective

A user pastes a job description (or, in phase 2, picks a live job from JobStrike) and gets a
**0–100 Gulf Match Score** for the CV they're editing, with a prioritized gap list and one-click
fixes. This is the feature that turns "another free CV builder" into "the tool that tells me if
I'll get shortlisted for THIS job."

## User story

> As a job seeker in Dubai, I paste the Emirates NBD job ad I found on LinkedIn, and within
> seconds I see "72/100 — missing: 'AML compliance', 'notice period', UAE driving license not
> stated" — and I can click each gap to fix my CV on the spot.

## UX

1. New panel/tab in the builder: **"Match to a job"** with a textarea ("Paste the job ad") and a
   prominent **Score my CV** button.
2. Result view:
   - Big score dial (0–100) with verdict label: <50 "Not shortlist-ready", 50–74 "Close — fix the gaps", 75+ "Shortlist-ready".
   - **Gap list**, grouped and ordered by weight (see scoring). Each gap row = what's missing,
     why it matters (one line), and a **Fix** action that jumps to / pre-fills the relevant CV section.
   - **GCC Compliance strip** (unique to us, always shown): visa status stated? nationality stated?
     photo present? notice period? driving license (if JD mentions driving/site work)? location line?
3. Re-score is instant after edits (client keeps last JD; recompute on demand, not per keystroke).
4. Empty/abuse handling: JD under 200 chars → "That doesn't look like a full job ad — paste the whole posting."

## Architecture (important — read carefully)

Two-stage design so scores are **deterministic and reproducible**:

- **Stage A — extraction (LLM, server-side):** `POST /api/match/extract` takes JD text, returns
  structured JSON: `{ title, seniority, hard_skills[], soft_skills[], certifications[],
  languages[], years_required, gcc_flags: { driving_required, arabic_required, visa_mentioned,
  location } }`. Use Anthropic API, model `claude-haiku-4-5-20251001`, temperature 0, JSON schema
  via tool-use so parsing never fails. Never send the user's CV to this endpoint — JD only.
- **Stage B — scoring (pure TypeScript, client or server, NO LLM):** deterministic function
  `computeGulfMatchScore(cvJson, extractedJd) → { score, gaps[], compliance[] }`.
  Same inputs must always produce the same score.

### Scoring weights (v1 — tune later against real recruiter feedback)

| Component | Weight |
|---|---|
| Hard skills coverage (exact + synonym match against skills/experience/summary text) | 40 |
| Title/seniority alignment (fuzzy match of JD title vs. CV headline & recent roles) | 15 |
| Years of experience vs. required | 10 |
| Certifications & languages coverage | 10 |
| **GCC compliance items** (visa status, nationality, notice period, location, photo, license when relevant) | 15 |
| ATS hygiene (has summary, dated roles, bullet lengths 8–30 words, quantified bullets ≥30%, no empty sections) | 10 |

Synonym matching: ship a static `skills-synonyms.json` (e.g. "AML" ↔ "anti-money laundering",
"MEP" ↔ "mechanical electrical plumbing") seeded for the 8 sector templates in brief 02. Simple
normalized-string + synonym lookup is enough for v1 — no embeddings.

### Phase 2 (after brief 04): "Score against live jobs"

Replace paste-only with a second source: search the JobStrike `jobs` table (Supabase project
`txnkaztivqvqppyeedwm`) via a read-only API route, pick a vacancy, score against it. Store the
score in `fit_scores` when the user has opted into an account. **Do not build this in v1** — but
keep `extractedJd` as the interface boundary so a JobStrike job can be mapped into the same shape.

## Guardrails

- Rate-limit `/api/match/extract` (IP-based, e.g. 20/hour) — it's an open LLM endpoint.
- Cache extraction by JD text hash (LRU or Vercel KV) so re-scores are free.
- The API must never log or store CV content.

## Acceptance criteria

- [ ] Pasting a real Bayt/LinkedIn JD returns a score in <6s cold, <1s re-score
- [ ] Same CV + same JD always → same score
- [ ] Every gap row's **Fix** action lands the user in the right CV section
- [ ] GCC compliance strip renders even at score 100
- [ ] Works with Arabic-language JDs (extraction prompt must handle AR input)
- [ ] PostHog: `match_score_run` (score, jd_lang, source), `match_gap_fixed` (gap_type)
- [ ] Rate limit + cache verified; no CV data in server logs

## Codex handoff prompt

> Read this brief and the existing CV builder codebase. Implement the Gulf Match Score exactly as
> specified: (1) an `/api/match/extract` route handler calling Anthropic claude-haiku-4-5 with
> tool-use-enforced JSON output, JD-hash caching and IP rate limiting; (2) a pure, unit-tested
> `computeGulfMatchScore` module with the weight table above and a seeded `skills-synonyms.json`;
> (3) the "Match to a job" panel with score dial, weighted gap list with Fix deep-links, and the
> GCC Compliance strip; (4) PostHog events. Follow existing state-management and styling
> conventions. Write unit tests for the scorer covering: perfect match, empty CV, Arabic JD,
> synonym hits, and the driving-license conditional.

---

# Brief 02 — Sector template system + true RTL mode

**Priority:** 2
**Competitive target:** Tadween and CV Gulf (who currently out-execute us on Arabic/bilingual), and the "one template" perception gap vs. Enhancv/Kickresume.

## Objective

Go from one GCC template to a **template system**: 8 sector-tuned templates on a shared engine,
plus a genuine RTL editing/export mode — not "Arabic-friendly spacing" but a mirrored, Arabic-first
layout. This makes the region-native claim defensible against the two players who actually contest it.

## The 8 sector templates

Each = same data model, different layout emphasis + seeded section order + sector synonym pack
(feeds brief 01's scorer). Every template supports photo on/off and EN/AR/bilingual.

| Template | Sector | Layout emphasis |
|---|---|---|
| Site | Construction / Engineering | Certifications & licenses block up top (driving license, safety cards), project list with values ("AED 40M tower, 14-month delivery") |
| Service | Hospitality / F&B | Photo prominent, languages bar, brand names of previous employers highlighted |
| Care | Healthcare | License/DataFlow/DHA-MOH-HAAD status block first, clinical skills matrix |
| Ledger | Banking / Finance | Conservative single column, compliance certs (AML/CFA), quantified achievements enforced |
| Crew | Aviation | Photo + measurements/grooming-standards block (regional airline norms), languages, service metrics |
| Stack | IT / Tech | Skills matrix first, projects with stack tags, ATS-plain option |
| Move | Logistics / Retail | License classes, systems (SAP/WMS), shift availability field |
| Corner | Executive / Management | Two-page, board-style summary, P&L ownership highlights |

Also keep the current GCC template as **"Classic GCC"** (default, backward compatible).

## Engine requirements

1. **One schema, many skins.** Templates are React layout components over the existing CV JSON —
   no per-template data forks. Adding template #9 must be a new layout file + config entry only.
2. **Template config** (`templates/*.config.ts`): section order, which optional GCC fields are
   surfaced by default (visa, nationality, notice period, license), photo default, accent palette,
   sector synonym pack id.
3. **Live switch:** changing template never loses data; unsupported optional fields hide, not delete.
4. **Export parity — three formats, one gate:**
   - **JPEG:** works for all 8 templates, instant, anonymous, no email, no watermark (unchanged headline claim).
   - **PDF and Word (DOCX):** also free and watermark-free for all 8 templates, but behind the
     one-time email gate specced in brief 05 Part D. PDF via the DOM print pipeline; DOCX via a
     lazy-loaded generator (e.g. the `docx` npm package) mapping the CV JSON to a clean
     single-column document — recruiters edit Word files, so DOCX must be genuinely editable
     (real headings/lists, no images-of-text). Both pipelines code-split per brief 06's budgets.
   - Note Enhancv ships **no Word export at all** and others paywall it — free DOCX is a
     comparison-table win; make sure brief 05's `/vs/*` data reflects it.

## True RTL mode

1. `dir="rtl"` at the document root of both the editor preview and exports when CV language = AR.
2. **CSS logical properties only** in all template CSS (`padding-inline-start`, `text-align: start`,
   `border-inline-end`…). Audit existing styles and convert — this is the bulk of the work.
3. Arabic typography: bundle an Arabic-capable font pair (e.g. IBM Plex Sans Arabic for headings,
   Noto Naskh Arabic for body — self-hosted, subset). Latin fallback for mixed content. Line-height
   +10–15% vs. Latin settings.
4. **Bidi safety:** phone numbers, emails, dates, and Latin company names inside Arabic text must
   render correctly (`unicode-bidi: isolate` / `<bdi>` on those value spans).
5. Arabic section-heading dictionary comes from brief 03's i18n layer — build against it, don't hardcode.
6. **Bilingual export (v1.5, flag it):** one CV, two pages — AR first then EN — from the same data.
   CV Gulf's whole pitch; ours is one click. If time-boxed out, ship behind a feature flag.

## Acceptance criteria

- [ ] 8 templates + Classic GCC, all photo on/off, all exporting JPEG (ungated) + PDF + DOCX
      (email-gated) free with no watermark; DOCX opens clean and editable in MS Word and Google Docs
- [ ] Template switch round-trip (A→B→A) preserves every field
- [ ] Full RTL: layout mirrors, no left-anchored artifacts, bidi-safe contact lines
- [ ] Arabic CV printed/exported renders identical to preview
- [ ] New-template test: adding a dummy 10th template touches only layout + config files
- [ ] PostHog: `template_selected` (template, sector), `cv_exported` gains `template`, `direction`, `format` props

## Codex handoff prompt

> Read the existing template/export code first. Refactor to a config-driven template engine (one
> CV JSON schema, per-template layout component + config for section order, GCC field defaults,
> palette, synonym pack). Convert all template CSS to logical properties. Implement the 8 sector
> templates per the table, RTL mode per the spec (root dir, self-hosted Arabic fonts, bdi-isolated
> contact values), and free PDF + editable DOCX export (lazy-loaded pipelines) alongside the
> existing ungated JPEG path — PDF/DOCX sit behind brief 05's email gate. Do not break the current
> GCC template for existing users. Deliver a visual QA page rendering all templates × {EN, AR} ×
> {photo, no-photo} for manual review.

---

# Brief 03 — Language packs (EN / AR / HI / UR / TL)

**Priority:** 3 (cheap, fast, nearly uncontested)
**Competitive target:** Nobody. Rezi covers Hindi; no builder covers Arabic + Hindi + Urdu +
Tagalog together — yet that's the actual language map of the Gulf workforce (majority South Asian
and Filipino, not Arabic-first).

## Objective

Make the builder *usable* by a Filipino hospitality worker or a Pakistani site engineer in their
own language, while the CV itself stays in the language recruiters expect (usually English, or
Arabic via brief 02). UI language ≠ CV language — keep the two axes independent.

## Scope

1. **i18n foundation** (if none exists): `next-intl` or equivalent; locale files
   `locales/{en,ar,hi,ur,tl}.json`. Two independent settings:
   - `uiLang` — builder chrome, labels, help text, buttons.
   - `cvLang` — section headings + date formatting in the exported document (v1: `en`, `ar`;
     add `hi`/`ur`/`tl` headings later only if users ask — Gulf recruiters read EN/AR).
2. **What gets translated (UI):** all builder chrome, all field labels and placeholder examples,
   the Gulf Match Score verdicts and gap explanations (brief 01), export dialogs, the GCC
   compliance strip. Placeholder examples must be *localized, not just translated* — a Tagalog
   hospitality placeholder should read like a Filipina F&B supervisor's real bullet, not a
   translated American one.
3. **RTL coupling:** `uiLang = ar` or `ur` flips the builder chrome RTL (brief 02's logical-CSS
   work makes this nearly free). Urdu needs the same bidi care as Arabic; use a Nastaliq-capable
   font stack for UI text where feasible, fall back to Naskh.
4. **AI rewrite localization:** the existing AI rewrite feature accepts input in any of the five
   languages and outputs polished **English** CV content by default (with an "output in Arabic"
   toggle). That's the killer use: type your experience in Urdu, get recruiter-grade English bullets.
   This is one system-prompt change plus a language hint — do it in this brief.
5. **Language switcher:** flag-free (use language names in their own script: العربية, हिन्दी,
   اردو, Tagalog, English), persisted in localStorage, auto-suggested from `navigator.language`
   on first visit via a dismissible one-line banner — never a blocking modal.

## Translation quality rule

Machine-translate first pass is acceptable to ship, but every string file gets a native-speaker
review pass (Kim's network) before the language is listed publicly. Until reviewed, a language
ships behind `?lang=` URL param only. Do not launch marketing for a language on MT-only strings.

## Acceptance criteria

- [ ] Full builder flow (start → fill → match → export) completable with `uiLang` = each of the 5
- [ ] `uiLang=ar`/`ur` renders builder chrome RTL with no layout breakage
- [ ] `cvLang` toggle changes exported section headings/dates only — never user content
- [ ] AI rewrite: Urdu/Hindi/Tagalog input → English output verified with real sample text
- [ ] No hardcoded English strings left in components (lint rule or grep check in CI)
- [ ] PostHog: `ui_lang_set`, `cv_lang_set`, `rewrite_run` gains `input_lang`/`output_lang` props

## Codex handoff prompt

> Introduce i18n to the CV builder per this brief: next-intl (or the repo's existing i18n lib if
> one exists) with en/ar/hi/ur/tl locale files; separate uiLang (builder chrome) from cvLang
> (exported headings, en+ar only in v1); RTL chrome for ar/ur reusing the logical-properties CSS
> from brief 02; localized placeholder examples per language; AI-rewrite language hint (any input
> language → English output, Arabic-output toggle); script-native language switcher with
> localStorage persistence and navigator.language suggestion banner. Extract every hardcoded
> string; add a CI check that fails on untranslated literals in components. Seed non-English
> files with clearly-marked machine translations for native review.

---

# Brief 05 — Trust flywheel + honest monetization

**Priority:** 4 (before the JobStrike bridge — it compounds with time, start it early)
**Competitive target:** the entire category's reputation. Zety/Resume.io/MyPerfectResume/Enhancv/
CVMaker are structurally locked into the $2–3-trial → $24–30/4-weeks auto-renewal model. They
cannot copy honesty. Also: 27 Trustpilot reviews vs. Kickresume's 3,600 — trust volume is our
most visible weakness and the cheapest to fix.

## Part A — Review flywheel

1. **Post-export moment:** after a successful export (the peak-happiness moment), show a
   one-time, dismissible card: "Did this help? A 60-second review helps other Gulf job seekers
   find us." → deep link to the Trustpilot review form. Never re-show after dismiss
   (localStorage flag); never before a completed export.
2. **Email follow-up (only where an email exists** — PDF/Word gate captures, brief 04 accounts,
   alert subscribers): the review ask rides the welcome email (Part D.4) or a single follow-up
   via Resend 3 days after the trigger event — one ask ever per address.
3. **Ethics rule (non-negotiable):** ask everyone the same way, no incentives, no filtering happy
   users first. The honest brand is the product; review-gating would poison it and violates
   Trustpilot rules anyway.
4. Surface the live Trustpilot score on the homepage once ≥ 4.3 with ≥ 100 reviews.

## Part B — "No trap" positioning on the product itself

1. **Homepage hero rewrite:**
   - H1: *"The CV builder built by a Gulf HR specialist — not an algorithm guessing what one looks like."*
   - Sub: *"Free forever. No $2.95 trial. No $25 surprise renewal. No card — not now, not ever.
     JPEG downloads need nothing at all; PDF and Word just take an email."*
   - Trust strip under the CTA: ✓ Free JPEG, PDF & Word ✓ No account, no card ✓ Built by a
     practising recruiter ✓ Gulf Match Score included
2. **Download-button microcopy:** "Download free — no card, ever." (the exact moment competitors
   spring their paywall is the exact moment we say this; the email gate copy in Part D carries
   the same tone).
3. **"Why free?" page:** one honest paragraph — Kim's story, why the only thing we ever ask for
   is an email for PDF/Word, and what will never cost money. Link it in the footer. This page
   converts skeptics and earns links.

## Part C — Comparison pages (SEO offense)

Programmatic-ish but hand-finished pages: `/vs/zety`, `/vs/resume-io`, `/vs/enhancv`,
`/vs/kickresume`, `/vs/canva`, plus `/best-cv-builder-uae` and `/dubai-cv-format` (consolidate
with the existing inspireambitions.com Dubai page — canonical to one URL, don't compete with
yourself).

Rules: every claim factual and dated ("Zety's 14-day trial renews at $23.95–25.95/4 weeks as of
July 2026 — source linked"), a real feature table (Gulf template ✓/✗, Arabic RTL ✓/✗, free
export ✓/✗, trial trap ✗/✓, live Gulf jobs ✓/✗), no fabricated review quotes, JSON-LD
`SoftwareApplication` + `FAQPage` schema, shared template so adding competitor #7 is a data file.

## Part D — Email gate on PDF & Word export (no payments — the tool is fully free)

**Model decision (final):** no Stripe, no paid tiers anywhere. The product is 100% free. The
asset we grow is the email list. Exactly one gate exists in the whole product:

| Format | Gate |
|---|---|
| **JPEG** | None. Instant, anonymous, no watermark. This claim is sacred — never touch it. |
| **PDF** | One-time email capture |
| **Word (DOCX)** | One-time email capture (same gate — one email unlocks both, forever on that device) |

1. **The gate UI:** when the user picks PDF or Word in the export dialog: a single inline email
   field — not a separate page, not a modal wall. Copy:
   *"PDF and Word downloads are free — we just ask for your email. We'll send you Gulf job-search
   tips you can unsubscribe from with one tap. Prefer not to? JPEG is yours with no email at all."*
   The JPEG opt-out link stays visible inside the gate — that honesty is the brand, and it
   inoculates us against "email trap" accusations that would poison the review flywheel.
2. **Behavior:** validate format + basic MX check server-side; on success set a localStorage flag
   (`downloads_unlocked`) so the user is **never asked again on that device**, then trigger the
   download immediately in the same tap. No confirm-your-email-first loop — the download must not
   be held hostage to inbox friction (double opt-in happens in the welcome email for the
   newsletter itself, per Resend/UAE PDPL norms).
3. **Where the email goes:** server route → Resend Audience (`cv-builder-leads`, separate from
   the existing Hospitality Memo audience) with props: template, sector, cvLang, uiLang, match
   score bucket if one exists. Triggers the existing-style welcome sequence (reuse the
   `resend-newsletter-ops/` patterns in this repo). Unsubscribe honored everywhere.
4. **Follow-up value, not spam:** welcome email = their download link (re-download portability),
   3 Gulf CV tips, and the Trustpilot ask from Part A folded in (replaces the separate review
   email for this segment). Weekly-at-most cadence after that.
5. **What NOT to build:** no accounts here (that's brief 04), no password, no "verify to
   download", no pre-checked marketing checkboxes, no gate on JPEG ever.

## Acceptance criteria

- [ ] Review card: fires once, post-export only, dismiss is permanent, deep-links to Trustpilot
- [ ] Homepage hero + download microcopy shipped as specced (copy above is final, not placeholder)
- [ ] 5 `/vs/*` pages + UAE page live, every competitor claim source-linked and dated, schema
      validates; feature tables show our free Word/DOCX export vs. competitors' paywalled/missing one
- [ ] Email gate: JPEG path has zero gate; PDF/Word gate captures once per device, download fires
      in the same tap, address lands in the `cv-builder-leads` Resend audience with props, welcome
      email (with re-download link + review ask) sends; JPEG opt-out link visible inside the gate
- [ ] No payment code, Stripe references, or price strings anywhere in the product
- [ ] "Why free?" page live and footer-linked
- [ ] PostHog: `review_prompt_shown/clicked`, `vs_page_view` (competitor), `email_gate_shown`
      (format), `email_captured` (format), `email_gate_declined_to_jpeg`

## Codex handoff prompt

> Implement per this brief: (A) the one-time post-export Trustpilot review card with permanent
> dismiss, plus a Resend follow-up email template for users whose email we hold; (B) the homepage
> hero, trust strip, download-button microcopy, and "Why free?" page using the exact copy in Part
> B; (C) a data-driven comparison-page template rendering /vs/{competitor} from JSON data files
> with feature table, dated sourced claims, and SoftwareApplication+FAQPage JSON-LD, seeded for
> zety, resume-io, enhancv, kickresume, canva plus /best-cv-builder-uae; (D) the email gate on
> PDF/Word export exactly as specced — inline field with the JPEG opt-out link visible, server
> route with format+MX validation posting to the cv-builder-leads Resend audience with props,
> localStorage unlock so the gate shows once per device, download firing in the same tap, and the
> welcome email with re-download link. There is NO payment code in this product — do not add
> Stripe or pricing anywhere. Wire all PostHog events including email_gate_declined_to_jpeg.

---

# Brief 04 — The JobStrike Bridge (the moat)

**Priority:** 5 (build last — most plumbing, biggest payoff)
**Competitive target:** Teal's tracker ($13/wk, US job boards only) and VisualCV's link analytics
($24/mo). Neither has a single Gulf job in their data. We have a live scraped UAE feed.

## Why this is the moat

Supabase project `jobstrike-uae` (`txnkaztivqvqppyeedwm`, ap-south-1) already holds:
`jobs` (live listings, 645 scrape runs), `applications`, `fit_scores`, `candidate_profiles`,
`companies`, `alerts`, `subscriptions` — all RLS-enabled. Every competitor would need to build a
Gulf job-scraping operation to copy this. The CV builder becomes the front door of JobStrike:
**build CV → score against real vacancies → track applications → get alerts.** One loop, two
products, zero equivalent anywhere.

## Scope (three features, one optional account)

### 4.1 Optional accounts (Supabase Auth) — the gate for this brief only

- Email OTP / magic link (no passwords), Google optional. **The builder and export stay
  100% usable without an account** — auth is offered only when the user taps a save/track/alert
  feature. Copy: "Save your CV & track applications — free."
- On signup: current CV JSON syncs to a new `cvs` table; localStorage remains source of truth
  for anonymous users. Multiple named CV versions per user (VisualCV-style tailoring).
- New tables (with RLS mirroring existing conventions): `cvs`, `cv_share_links`, `cv_link_views`.
  Reuse `candidate_profiles` for profile data rather than duplicating.

### 4.2 Application tracker on live jobs

- **"Jobs for you" tab:** query `jobs` filtered by the sector/title of the active CV; each card
  shows the Gulf Match Score (brief 01's scorer against the stored extraction — populate/reuse
  `fit_scores`). One tap: "Track this application" → row in `applications` with status pipeline
  `saved → applied → interviewing → offer → rejected`.
- Manual add for jobs found elsewhere (paste URL/title) so the tracker isn't limited to scraped inventory.
- Kanban-lite board (mobile-first: swimlane list, not desktop kanban), per-application notes,
  applied-with-which-CV-version link.
- **Alerts:** reuse the `alerts` table — "email me new jobs matching this CV over 70" (daily
  digest via Resend, which Kim already uses for the newsletter).

### 4.3 Trackable CV share links

- "Share as link" → `cv.inspireambitions.com/v/{slug}` renders a read-only web CV (same template
  engine from brief 02) + PDF download.
- Log views to `cv_link_views` (timestamp, coarse geo from Vercel header, referrer; **no
  fingerprinting** — say so in the UI, it's on-brand honesty).
- Owner dashboard: "Your CV was viewed 3 times this week — twice from Dubai." Notification email
  on first view per day (Resend).
- Links revocable; `noindex` on view pages; slug ≥ 96 bits of entropy.

## Architecture notes

- CV builder talks to Supabase via `@supabase/ssr` with the **publishable key + RLS** — no
  service-role key in the CV builder deployment. Cross-check existing RLS policies on
  `applications`/`fit_scores` before writing (they were designed for the JobStrike app; extend,
  don't fork).
- Scoring reuses `computeGulfMatchScore` from brief 01 — extract it to a shared package if the
  repos are separate, or duplicate the pure module with a sync test. JD extraction for scraped
  jobs runs batch-side in JobStrike (one extraction per job, stored), NOT per-user.
- Keep JobStrike branding light in v1: the tab is "Jobs for you", powered-by-JobStrike footnote.
  Full cross-product identity is a later marketing decision, not a build decision.

## Acceptance criteria

- [ ] Anonymous flow completely untouched (build + export with zero auth prompts)
- [ ] Signup → CV synced, versions save/load/rename, RLS verified (user A cannot read user B's rows — test it)
- [ ] Jobs tab shows live `jobs` rows with per-job scores; track → `applications` row; status pipeline works
- [ ] Daily alert email sends via Resend for score-≥threshold matches
- [ ] Share link renders all templates from brief 02 (EN + AR), logs views, revocation kills the URL
- [ ] `noindex` verified on `/v/*`; no service-role key shipped to the CV builder
- [ ] PostHog: `account_created`, `application_tracked` (status), `share_link_created`, `share_link_viewed`, `job_alert_set`

## Codex handoff prompt

> Read this brief plus the existing schemas in Supabase project txnkaztivqvqppyeedwm before
> writing any migration. Implement: optional Supabase email-OTP auth (never blocking the free
> builder); `cvs`, `cv_share_links`, `cv_link_views` tables with RLS matching existing
> conventions; the "Jobs for you" tab querying `jobs` with stored batch JD extractions scored by
> the shared computeGulfMatchScore module and persisted to `fit_scores`; a mobile-first
> application tracker writing to `applications` with the 5-status pipeline and manual job add;
> daily Resend alert digests from `alerts`; and trackable, revocable, noindexed share links with
> a view-analytics dashboard. Write RLS tests proving cross-user isolation. Use the publishable
> key only in the CV builder app.

