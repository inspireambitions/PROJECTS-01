# CODEX MASTER INSTRUCTIONS — InspireAmbitions Product Suite

**Prepared:** July 2026 · **Owner:** Kim (InspireAmbitions) · **Builder:** Codex
**Scope:** Two products, one strategy, one design system.

| Product | URL | Vercel project | Stack |
|---|---|---|---|
| CV Builder | cv.inspireambitions.com | `cv-builder-for-blog-inspireambitions-com` | Next.js, no DB, no auth |
| AI Job Risk Calculator | calculator.inspireambitions.com | `ai-job-risk-calculator` | Next.js, no DB, no auth |
| Shared backend asset | — | Supabase `txnkaztivqvqppyeedwm` (jobstrike-uae) | live scraped UAE `jobs`, `applications`, `fit_scores` |

---

## PART 1 — WHAT is to be done

Based on a full competitive audit (10 global CV builders, 5 GCC regional players, 6 AI-risk
calculators), build **eleven workstreams across the two products**, in this order:

**CV Builder (6 briefs — folder `cv-battleplan/`):**
1. **Brief 06 first — Premium quality bar:** design-token system with dark mode, mobile-first
   Edit/Preview/Score UX, hard performance budgets in CI, layouts 320px→4K. Governs everything after it.
2. **Brief 01 — Gulf Match Score:** paste a job description → 0–100 score, weighted gap list
   with one-click fixes, GCC compliance strip. LLM extraction + deterministic scorer.
3. **Brief 02 — Template system + RTL:** 8 sector templates on one config-driven engine, true
   Arabic RTL mode, free JPEG (ungated) + PDF + editable Word/DOCX export.
4. **Brief 03 — Language packs:** builder UI in EN/AR/HI/UR/TL; AI rewrite accepts any of the
   five languages and outputs recruiter-grade English.
5. **Brief 05 — Trust & list-building:** one-time email gate on PDF/Word only (JPEG never),
   Resend audience, post-export Trustpilot flywheel, "no trap" homepage copy, /vs/ comparison pages.
6. **Brief 04 — JobStrike bridge (last):** optional accounts, application tracker on live UAE
   jobs, trackable CV share links.

**Calculator (4 briefs — folder `calculator-battleplan/`):**
7. **Brief 01 — Distribution engine:** ~420 programmatic occupation × region SEO pages,
   JSON-LD, /methodology page, embeddable widget.
8. **Brief 02 — Share loop:** branded result cards with dynamic OG images, WhatsApp-first
   sharing, benchmark lines, Arabic RTL results.
9. **Brief 03 — Result-to-action:** per-task protection plan, Leverage Score, task→CV handoff
   into the CV builder, "safer roles hiring now" from JobStrike jobs, optional PDF email report.
10. **Brief 04 — Authority & retention:** quarterly GCC AI Risk Index, "your risk changed"
    alerts, PostHog migration, premium design pass.

**Cross-product (implicit in the above):**
11. One design system, one analytics plane (PostHog org "Job Strike"), one email platform
    (Resend), and the task→CV→jobs funnel connecting everything.

## PART 2 — HOW it is to be done

**Non-negotiable ground rules (apply to every brief):**
- **100% free products. No Stripe, no payment code, no paid tiers, anywhere.** The only gates
  in the entire suite: (a) CV builder — one-time email for PDF/Word downloads (JPEG always
  ungated); (b) calculator — optional "email my PDF report" and "notify me if my risk changes"
  (on-screen results never gated). All captures land in Resend audiences
  (`cv-builder-leads`, `calculator-leads`).
- **Read the existing codebase of each product first** and follow its conventions. These briefs
  are specs, not diffs.
- **cv-battleplan/06 is the shared quality bar:** design tokens (no raw hex/px in components),
  full dark mode, CSS logical properties everywhere (RTL is a first-class requirement),
  self-hosted subset fonts, LCP ≤ 2.5s on mid-range Android/4G, ≤ 250KB initial JS, Lighthouse
  CI budgets that fail the build, Playwright E2E at 360px and 1440px, accessibility ≥ 95.
- **AI calls:** server-side route handlers only, Anthropic API (claude-haiku tier for
  extraction), temperature 0 with tool-enforced JSON, input-hash caching, IP rate limiting.
  Scoring itself is deterministic TypeScript — same input, same score, always. Never log or
  store CV content server-side.
- **Data:** Supabase publishable key + RLS only in client apps (never service-role); RLS
  cross-user isolation tests required. Privacy copy must change to "never stored with your
  identity" BEFORE any aggregate feature (benchmarks/index) ships.
- **Honesty is the brand:** Displacement Years always render as ranges ("~2031 (2029–2034)");
  competitor claims on /vs/ pages are factual, dated, and source-linked; email-gate copy always
  shows the no-email JPEG alternative; benchmark lines are suppressed below n≥30, index cells
  below n≥100.
- **Instrumentation:** every feature ships with its PostHog events (schemas in each master
  plan) into org "Job Strike".
- **Working method per brief:** read brief → audit existing code → (brief 06 and calculator
  brief 01 explicitly require a gap report / data files for Kim's approval first) → implement →
  meet every acceptance checkbox → ship. Items marked for Kim's review (occupation task
  profiles, translation files, homepage copy already marked final) must not launch unreviewed.

## PART 3 — END GOAL and expected results

**End state:** InspireAmbitions is the definitive career platform for the Gulf — the only place
on the internet where a job seeker can measure their AI risk against real research, turn their
actual daily tasks into a GCC-native CV in five languages, score that CV against live UAE
vacancies, track applications, and get alerts — all free, all mobile-first, from a brand whose
whole identity is "built by a real Gulf HR specialist, no tricks, no trial traps."

**Competitive results this delivers:**
- Beats **Zety/Resume.io/MyPerfectResume/Enhancv/CVMaker** on trust (their trial-trap model is
  structural; our free+honest model is stated on every page) and on Word export, Arabic RTL,
  GCC fields — which none of them have.
- Beats **Rezi/Novoresume/Teal** by making JD-matching free and Gulf-calibrated, and by pairing
  it with live GCC job data none of them possess.
- Beats **Tadween/CV Gulf/Naukrigulf** on credibility (practising-HR authorship), product depth
  (Match Score, 8 sector templates, 5 languages), and the calculator funnel they don't have.
- Beats **WillRobotsTakeMyJob/TripleTen/WhatAboutAI** with task-level analysis (unique),
  Displacement Year + Protection + Leverage scores (unique), GCC awareness (unique), SEO pages
  + share loop (their only strengths, replicated), and an honest no-lead-gen-bait model.

**Measurable 90-day targets (PostHog):**
- CV builder: Match Score used in ≥40% of sessions; 2,000+ emails via the PDF/Word gate;
  200+ Trustpilot reviews (from 27); /vs/ pages ranking for "zety alternative uae", "dubai cv builder".
- Calculator: 100+ indexed occupation×region pages; ≥15% of results shared or emailed; ≥10% of
  high-risk results clicking through to the CV builder; first GCC AI Risk Index published with
  ≥1 regional press pickup.
- Suite: measurable calculator → CV builder → JobStrike funnel visible end-to-end in PostHog.

**Definition of done, per brief:** every acceptance-criteria checkbox in that brief checked, the
global ship checklist in each product's master plan passed, and brief 06's budgets green in CI.

---

*The two product plans follow in full, in build order: CV Builder first, then Calculator.*

---

# ============================================================
# PRODUCT 1: CV BUILDER — FULL BRIEFS (cv-battleplan/)
# ============================================================

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


---

# ============================================================
# PRODUCT 2: AI JOB RISK CALCULATOR — FULL BRIEFS (calculator-battleplan/)
# ============================================================

# CODEX BUILD INSTRUCTIONS — AI Job Risk Calculator (consolidated)

> Single-file handoff: master plan + all 4 briefs in build order (01 → 02 → 03 → 04).
> The shared quality bar cv-battleplan/06-premium-design-performance.md governs this
> product too. Fully FREE product — no payments/Stripe; on-screen results never gated;
> email captured only at the optional PDF-report and risk-alert points.

---

# AI Job Risk Calculator Battle Plan — Master Document

**Product:** calculator.inspireambitions.com (Next.js on Vercel, project `ai-job-risk-calculator`)
**Owner:** Kim / InspireAmbitions
**Date:** July 2026
**Relationship to the CV builder plan:** `../cv-battleplan/06-premium-design-performance.md`
(design tokens, performance budgets, mobile UX) **governs this product too.** One design system
across the whole InspireAmbitions suite is what makes it read as a premium agency product rather
than a collection of side projects.

---

## 1. Strategic position (from the July 2026 competitive audit)

The calculator **wins every product column and loses every distribution column**:

- **We alone do:** free-text task-level analysis, a Displacement Year, a Protection Score,
  GCC/region adjustment, WEF-2025-era data. Confirmed: no competitor has any of these.
- **They alone have:** reach. WillRobotsTakeMyJob owns ~700 occupation SERPs (~100K+ visits/mo,
  ad-monetized, 2013-era Oxford data). TripleTen buys traffic and funnels it into bootcamp
  sales. WhatAboutAI personalizes with dropdowns. BBC's tool is frozen in 2015.
- **Nobody (including us, today) has:** a share loop, an Arabic version, an action plan attached
  to the score, or any bridge from "diagnosis" to "what do I do now".

**The play:** keep the superior engine, bolt on the distribution the incumbents built their whole
business on, and connect the result screen to the InspireAmbitions ecosystem (CV builder +
JobStrike) so the attention converts. The calculator's job in the portfolio: **top-of-funnel
anxiety → action → CV builder → JobStrike → email list.**

## 2. The four briefs (build order)

| # | Brief | What it is | Effort |
|---|-------|-----------|--------|
| 1 | `01-distribution-engine.md` | Programmatic occupation × region SEO pages, JSON-LD, methodology page, embeddable widget | ~2 wks |
| 2 | `02-share-loop.md` | Shareable result cards + per-result OG images, WhatsApp-first, benchmark line, Arabic results | ~1–2 wks |
| 3 | `03-result-to-action.md` | Protection plan, augmentation score, task→CV handoff, "safer roles hiring now" (JobStrike), compare-two-jobs, PDF-report email capture | ~2 wks |
| 4 | `04-authority-and-retention.md` | GCC AI Risk Index (quarterly report), "your risk changed" alerts, PostHog migration, premium polish pass | ~1–2 wks |

Sequencing logic: distribution first (it compounds longest), share loop second (multiplies the
new traffic), then conversion, then authority/retention (needs stored aggregates from 2–3).

## 3. Model & principles

- **Fully free. No payments, no Stripe, anywhere.** Same rule as the CV builder.
- The score and analysis are **never gated**. Email is captured at exactly two optional points:
  "email me my full report (PDF)" and "notify me when my risk changes". Both feed Resend
  audience `calculator-leads`.
- **Privacy copy update (required by briefs 02–04):** today the page says "Your data is not
  stored." Benchmarking, the Index, and alerts need anonymized aggregates. New line everywhere:
  *"Your analysis is never stored with your identity. We keep anonymous statistics to power
  benchmarks and research."* Do not ship aggregate features before this copy ships.
- **Defensibility discipline:** the Displacement Year is our boldest claim and biggest attack
  surface (Frey & Osborne was academically shredded for less). Every score surface shows a
  range, not false precision: "~2031 (2029–2034)". The methodology page (brief 01) is the
  load-bearing wall for all press work.

## 4. KPIs (PostHog, org "Job Strike" — migration in brief 04)

| Event | Name |
|---|---|
| Analysis completed | `risk_analysis_run` (props: score_band, country, industry, task_count) |
| SEO page entry | `seo_page_view` (occupation, region) |
| Result shared | `result_shared` (channel) |
| CV handoff clicked | `cv_handoff_clicked` (score_band) |
| Safer-roles job clicked | `safer_role_clicked` |
| Report emailed / alert set | `report_email_captured` / `risk_alert_set` |

90-day targets: 100+ indexed occupation×region pages, ≥15% of results shared or emailed,
≥10% of high-risk results clicking through to the CV builder, first quarterly GCC AI Risk
Index published and picked up by at least one regional outlet.

## 5. Ground rules for Codex

- The calculator codebase is its own repo (Vercel project `prj_pOlZ3EEeLLaZnsmh3DXAj8Wgf0GU`).
  Read existing conventions first; these briefs are specs, not diffs.
- Apply `cv-battleplan/06-premium-design-performance.md` as the quality bar: its tokens, budgets
  (LCP ≤ 2.5s mid-range Android/4G), logical-properties CSS (Arabic results are coming), and
  self-hosted fonts (replace the current Google Fonts Inter link — it's both a perf and a
  consistency fix).
- No auth in this product. Ecosystem bridges pass data via URL/handoff, not shared accounts.
- LLM calls server-side, rate-limited, cached by input hash — same pattern as the CV builder's
  Match Score extraction endpoint.

---

# Brief 01 — Distribution engine (programmatic SEO + credibility infrastructure)

**Priority:** 1. WillRobotsTakeMyJob's only real moat is ~700 occupation pages owning every
"will robots take my job [title]" SERP. Our engine is better; our site is one page. This brief
builds the roads.

## 1.1 Programmatic occupation × region pages

- **Routes:** `/jobs/[occupation]` and `/jobs/[occupation]/[region]`
  (e.g. `/jobs/hr-manager`, `/jobs/hr-manager/uae`, `/jobs/accountant/dubai`).
- **Launch set:** 60 occupations × 6 GCC regions + global = ~420 pages, statically generated.
  Occupation list: the roles with real search volume AND relevance to the InspireAmbitions
  audience (start from the CV builder's 8 sectors — construction, hospitality, healthcare,
  banking, aviation, IT, logistics, executive — plus office/admin roles, which have the highest
  AI-risk search intent).
- **Each page contains (pre-rendered, unique, not thin):**
  - The typical task profile for that role (8–12 tasks from a curated data file — this is our
    task engine's content advantage; WRTMJ shows a bare probability),
  - a pre-computed sample Risk/Protection/Displacement result with per-task bars,
  - region context paragraph (adoption pace, regulatory notes — 2–3 sentences per region,
    written once per region and blended per occupation),
  - the live calculator form pre-seeded with those tasks ("these aren't your tasks? edit them"),
  - internal links: 5 related occupations, the region hub, the CV builder
    ("future-proof your CV — free").
- **Content quality gate:** every page must pass a "would a human bookmark this?" bar — no
  boilerplate paragraphs repeated across all 420 pages with only the title swapped (that's a
  Google spam-update casualty pattern). Occupation task profiles and risk commentary come from
  a reviewed data file (`occupations.json`), not free-running LLM output at build time.

## 1.2 Structured data & technical SEO

- JSON-LD on every page: `FAQPage` (the FAQ content already exists on-page but has no schema),
  `WebApplication` for the tool, `BreadcrumbList` on occupation pages.
- XML sitemap, per-page canonical, per-page OG images (occupation + sample score baked in —
  reuse brief 02's OG image generator).
- Internal-link architecture: home → sector hubs → occupation pages → region variants.

## 1.3 Methodology page (`/methodology`)

The load-bearing credibility asset — required before any press/Index work:
- How task scores are derived (technical capability × economic incentive × regulatory friction —
  the three factors already described on the homepage, expanded with the WEF/Goldman/McKinsey/
  Oxford citations as real links, not name-drops).
- How the Displacement Year is computed and **why it's a range** — show "~2031 (2029–2034)"
  format here and everywhere scores render.
- Honest limitations section (what task-level analysis can't know). Honesty is the brand;
  it also pre-empts the Frey & Osborne-style academic takedown.
- If the Yahoo Finance coverage is confirmed as ours: an "As featured in" strip here + homepage.

## 1.4 Embeddable widget

- `/embed` route: compact calculator (title + tasks + score) in an iframe-safe layout,
  `powered by InspireAmbitions` backlink. One-line embed snippet on a `/widget` marketing page
  pitched at career coaches, universities, and news sites. This is how Omni Calculator built its
  network — backlinks compound like the SEO pages do.
- Keep the existing permissive frame headers for this route only; the main app should set
  sensible `frame-ancestors` instead of the current `ALLOWALL`.

## Acceptance criteria

- [ ] ~420 pages statically generated from `occupations.json` + `regions.json`; build fails on
      missing/duplicate slugs; no page renders with an empty task profile
- [ ] Form on occupation pages arrives pre-seeded with that page's tasks and is fully editable
- [ ] FAQPage/WebApplication/BreadcrumbList JSON-LD validates (Rich Results test)
- [ ] Sitemap lists all pages; Search Console verified; Lighthouse SEO ≥ 95 on samples
- [ ] `/methodology` live, every citation an actual link, ranges shown wherever a year renders
- [ ] Embed renders in a third-party test page; main app no longer serves `ALLOWALL`
- [ ] PostHog `seo_page_view` firing with occupation/region props (GA dual-run until brief 04)

## Codex handoff prompt

> Read the existing calculator codebase and this brief. Build the programmatic SEO layer:
> statically generated /jobs/[occupation] and /jobs/[occupation]/[region] pages driven by
> reviewed occupations.json + regions.json data files (60 occupations, GCC regions per spec),
> each with unique task profiles, pre-computed sample results, pre-seeded editable calculator
> form, and internal links; JSON-LD (FAQPage, WebApplication, BreadcrumbList), sitemap,
> canonicals; a /methodology page with linked citations and range-formatted Displacement Years
> applied product-wide; and an iframe-safe /embed route with backlink while tightening
> frame-ancestors on the main app. Seed occupations.json for the 60 launch roles with 8–12
> tasks each, clearly marked for Kim's HR review before launch.

---

# Brief 02 — The share loop (result cards, WhatsApp-first, benchmarks, Arabic)

**Priority:** 2. Risk-calculator tools grow on "I got 73% 😱" screenshots. No competitor —
including WillRobotsTakeMyJob — has a real share loop. Whoever builds one first converts every
result into an acquisition channel.

## 2.1 Shareable result cards

- After analysis, generate a **branded result card**: role, Risk dial, Protection dial,
  Displacement range ("~2031 (2029–2034)"), top risky + top safe task, and the tagline
  *"AI replaces tasks, not jobs — calculator.inspireambitions.com"*.
- **Share URL:** `/r/[id]` — a server-stored anonymous result snapshot (score data only, no
  identity; ~90-day TTL). The page renders the card + "Get YOUR score" CTA + the calculator.
  This page is the viral landing surface — treat it with landing-page care.
- **Per-result OG image** via dynamic OG generation (`@vercel/og` / ImageResponse) so the card
  renders rich in WhatsApp, LinkedIn, X, iMessage previews. This is the actual growth mechanic —
  most shares are link pastes, not downloads.
- Buttons: **WhatsApp first** (this audience's real channel), then LinkedIn, X, copy-link, and
  download-as-image (mobile long-press friendly).

## 2.2 Benchmark line

- On the result: *"You're safer than 68% of Marketing Managers in the UAE."*
- Computed from anonymized aggregates (new `result_stats` storage — score, occupation slug,
  country, timestamp; NOTHING else). Cold-start: until an occupation×country cell has n ≥ 30,
  fall back to occupation-global or suppress the line — never fake it.
- **Prerequisite:** the privacy copy change from the master plan ships in the same deploy.
- The benchmark line goes ON the share card once available — it's the most screenshot-able
  sentence in the product.

## 2.3 Arabic results (blue ocean)

- There is no Arabic AI-job-risk calculator anywhere. Ship an `ar` locale for the result +
  share surfaces first (highest share value), then the form.
- Requirements piggyback on the CV builder work: logical-properties CSS, RTL root, self-hosted
  Arabic font subset, bidi-safe number rendering (scores/years stay Latin digits inside RTL
  text unless full Eastern Arabic numerals are chosen — pick one, apply consistently).
- Share card generator must render the Arabic variant (RTL layout mirrored, correct font in the
  OG image renderer — test this explicitly; @vercel/og needs the font loaded manually).

## 2.4 The example-result section becomes live social proof

- Replace the static "Marketing Manager, Dubai" example with a rotating set of real anonymized
  recent results ("Analysed 3 minutes ago: Accountant, Riyadh — 61% risk") once aggregates
  exist. Fallback to the static example when volume is low. Social proof + freshness signal in
  one move.

## Acceptance criteria

- [ ] Result card generates for every analysis; `/r/[id]` renders card + CTA; snapshots are
      anonymous and expire (~90 days)
- [ ] OG image correct in WhatsApp + LinkedIn preview debuggers for EN and AR cards
- [ ] WhatsApp share is the first/primary button on mobile; download-as-image works on iOS Safari
- [ ] Benchmark line appears only at n ≥ 30 with the correct comparison cohort; suppressed
      cleanly below threshold; privacy copy updated in the same release
- [ ] Full result flow works in Arabic RTL with no layout breakage; numerals policy consistent
- [ ] PostHog: `result_shared` (channel, locale), `share_landing_view`, `share_landing_converted`

## Codex handoff prompt

> Implement the share loop per this brief: branded result cards with dynamic OG images
> (@vercel/og, EN + RTL Arabic variants with manually loaded font subsets), anonymous /r/[id]
> result snapshots with TTL, WhatsApp-first share row with copy-link and image download,
> benchmark line from a new anonymized result_stats aggregate (n ≥ 30 threshold with
> occupation-global fallback and clean suppression), the updated privacy copy, and the rotating
> live-example module with static fallback. Reuse the design tokens and performance budgets from
> cv-battleplan/06. Test OG rendering in WhatsApp/LinkedIn debuggers for both locales.

---

# Brief 03 — From diagnosis to action (protection plan, ecosystem bridges, email report)

**Priority:** 3. Today the result is a dead end: we generate anxiety and hand it to Google.
Every competitor either does the same (WRTMJ) or funnels it into a self-serving pitch
(TripleTen's "join our bootcamp"). We convert it into the user's next step — inside our own
ecosystem, honestly.

## 3.1 Protection plan (per-task prescriptions)

- For each task scoring ≥ 60% risk, render a prescription: the adjacent skill that neutralizes
  it, an "automate it yourself first" suggestion where applicable, and a realistic horizon.
  Generated in the same LLM analysis call (extend the response schema — no second round-trip),
  grounded by a reviewed prescription library per task category so output stays specific, not
  "learn AI skills" mush.
- Rendered as a "Your protection plan" section under the scores; included in the PDF report (3.4).

## 3.2 Augmentation score (reframe fear → advantage)

- Add a per-task second dimension: **replaces you vs. multiplies you**. Tasks where AI is a
  force-multiplier get a green "leverage" badge: "AI makes you ~3× faster here — adopters gain."
- Surface an overall **Leverage Score** next to Risk and Protection. Three dials, not two —
  and the only calculator on the market with an optimistic, actionable axis. Goes on the share
  card (brief 02) once shipped.

## 3.3 Ecosystem bridges (the unfair advantage — nobody else owns both sides)

1. **Task → CV handoff (highest value).** The user already typed their real daily tasks — that's
   CV raw material we collected. Results CTA: *"Turn these tasks into achievement bullets on a
   future-proof CV — free."* Pass tasks + role + country to the CV builder via a signed handoff
   payload (URL fragment or short-lived server token — user-initiated, no accounts), landing in
   the builder with experience bullets pre-drafted. Coordinate the receiving side with
   `cv-battleplan` (add to its backlog as a small brief-01-adjacent task).
2. **Safer roles hiring now.** For high-risk results (score ≥ 60), query the JobStrike `jobs`
   table (Supabase `txnkaztivqvqppyeedwm`, read-only API route) for 3 live lower-risk vacancies
   matching the user's country/sector: *"Roles hiring in the UAE with lower AI risk."*
   Risk-tag jobs at batch time using the occupation risk data from brief 01's `occupations.json`.
   No consumer tool on earth does this today.
3. **Compare two jobs.** "Comparing an offer?" mode: run two roles side by side (risk deltas per
   axis), cross-linking the existing "Should I Take This Dubai Job?" tool. Cheap — it's the same
   engine run twice with a comparison layout.
- CTA placement discipline: bridges render AFTER the full result, contextual to score band
  (high risk → CV + safer roles; low risk → leverage framing + CV polish). Never interrupt the
  reveal moment.

## 3.4 Email report (the only capture point, optional, never gating)

- After results render fully: *"Email me my full report (PDF)"* — the on-screen result is never
  gated. PDF = scores + per-task analysis + protection plan + benchmark, nicely typeset (reuse
  the CV builder's PDF pipeline patterns).
- Email → Resend audience `calculator-leads` (props: score band, occupation, country). Welcome
  email carries the report + one CV-builder line. Same honest-copy standards as the CV builder's
  gate; one-time localStorage flag so repeat analyses auto-offer "email this one too?" without
  re-asking for the address.

## Acceptance criteria

- [ ] Protection plan renders for every task ≥ 60% risk; grounded in the prescription library;
      no generic "learn AI" filler (spot-check 20 varied inputs)
- [ ] Leverage Score computed and displayed as the third dial; present on new share cards
- [ ] CV handoff delivers tasks/role/country into the CV builder with drafted bullets; works on
      mobile; no account required either side
- [ ] Safer-roles module shows 3 live JobStrike vacancies for high-risk GCC users; hides
      gracefully for countries with no inventory; jobs risk-tagged at batch time
- [ ] Compare-two-jobs mode works and links the Dubai job decision tool
- [ ] PDF report emails via Resend with correct props; on-screen results never gated; second
      analysis re-offers without re-asking for the address
- [ ] PostHog: `cv_handoff_clicked`, `safer_role_clicked`, `job_compare_run`,
      `report_email_captured` — all with score_band props

## Codex handoff prompt

> Implement per this brief: (1) protection-plan prescriptions generated within the existing
> analysis call via extended response schema, grounded by a reviewed per-category prescription
> library; (2) the per-task augmentation dimension and overall Leverage Score as a third dial;
> (3) the three ecosystem bridges — signed task→CV handoff payload into the CV builder,
> safer-roles module reading risk-tagged live jobs from the JobStrike Supabase via a read-only
> route, and compare-two-jobs mode; (4) the optional post-result PDF email report via Resend to
> the calculator-leads audience. Score-band-contextual CTA placement after the result reveal.
> No payments, no accounts, on-screen results never gated. Wire all PostHog events.

---

# Brief 04 — Authority & retention (GCC AI Risk Index, risk-change alerts, premium pass)

**Priority:** 4 (needs briefs 01–03's aggregates and traffic to matter).

## 4.1 The GCC AI Risk Index (quarterly — the PR machine)

- Aggregate anonymized `result_stats` into a quarterly report: **"The GCC AI Job Risk Index"** —
  most/least exposed roles per country, quarter-over-quarter movement, augmentation leaders.
- Journalists cite indexes, not calculators. Every citation = a backlink WillRobotsTakeMyJob
  cannot match regionally, and a recurring press hook (the Yahoo-style coverage becomes
  repeatable instead of one-off).
- Build: `/index` hub + `/index/[quarter]` report pages, charts pre-rendered (static images or
  lightweight SSR — don't ship a charting library to the client bundle), key-findings summary
  written by Kim each quarter from an auto-generated data pack (JSON + draft narrative).
- **Integrity gates:** publish only cells with n ≥ 100 per occupation×country; methodology
  footnote linking `/methodology`; version the dataset per quarter so numbers never silently
  change after publication. Credibility is the entire value of this asset.
- Downloadable data (CSV) under CC-BY with attribution — attribution is the point.

## 4.2 "Your risk changed" alerts (retention loop)

- Optional post-result capture #2: *"AI capability moves fast. Notify me when my score changes."*
  Stores the anonymous result snapshot id + email (this pair is pseudonymous — reflect it in the
  privacy copy) with occupation/country.
- On engine updates (new model capabilities, quarterly recalibration), batch re-run stored
  snapshots; where a score moves ≥ 5 points, send: *"We re-checked: your risk moved 47% → 52%.
  Here's what changed."* → links to a fresh full analysis.
- Every major AI model release becomes a legitimate, on-brand reason to re-engage the entire
  list. Cadence guard: max one alert email per quarter per address, plus an annual "your yearly
  re-check" fallback so quiet quarters still touch the list once.

## 4.3 Analytics migration + premium polish pass

- **PostHog migration:** the calculator currently runs GA (`G-PY9B70N583`) while the rest of the
  stack is on PostHog (org "Job Strike"). Add PostHog with the full event schema from the master
  plan; dual-run with GA for 30 days, then drop GA. Without this, cross-product funnels
  (calculator → CV builder → JobStrike) are invisible.
- **Premium pass (apply `cv-battleplan/06`):**
  - Migrate to the shared design tokens + dark mode; self-host Inter (drop the Google Fonts
    link — perf + consistency),
  - score-reveal moment: the three dials animate up staggered (the product's one signature
    motion; `prefers-reduced-motion` respected),
  - skeleton states during analysis with progressive streaming of per-task rows (perceived
    speed), Lighthouse CI budgets wired to this repo too,
  - range formatting ("~2031 (2029–2034)") audited everywhere a year appears.

## Acceptance criteria

- [ ] Index hub + first quarterly report page live from real aggregates; n ≥ 100 gate enforced;
      dataset versioned; CSV download with license note
- [ ] Alert flow: capture → engine-version bump triggers batch re-score → ≥ 5-point movers get
      the email (test with a synthetic engine change); cadence caps enforced; unsubscribe works
- [ ] PostHog live with all master-plan events; GA dual-run documented with a removal date
- [ ] Token migration complete (no raw hex/px in components), fonts self-hosted, dial animation
      + reduced-motion verified, Lighthouse CI green on brief-06 budgets
- [ ] Privacy copy reflects pseudonymous alert storage; deleting an alert deletes the snapshot pair

## Codex handoff prompt

> Implement per this brief: (1) the quarterly GCC AI Risk Index — aggregation job over
> result_stats with n ≥ 100 publication gate, versioned per-quarter datasets, /index hub and
> report pages with pre-rendered charts, CSV export, and an auto-generated data pack + draft
> narrative for Kim's editorial pass; (2) risk-change alerts — pseudonymous snapshot+email
> storage, engine-version-triggered batch re-scoring, ≥ 5-point-delta notification emails via
> Resend with quarterly cadence caps and clean unsubscribe/deletion; (3) PostHog integration
> with the master-plan event schema (30-day GA dual-run), and the premium pass: design-token
> migration per cv-battleplan/06, self-hosted fonts, staggered dial reveal animation with
> reduced-motion support, streaming skeleton states, Lighthouse CI budgets, and a product-wide
> audit that every Displacement Year renders as a range.

