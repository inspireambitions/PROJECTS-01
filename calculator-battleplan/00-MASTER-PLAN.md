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
