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

