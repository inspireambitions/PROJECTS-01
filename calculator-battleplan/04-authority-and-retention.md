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
