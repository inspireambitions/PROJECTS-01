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
live UAE vacancies → track the applications → upgrade to a human HR review.*

## 2. The five bets (build order)

| # | Brief | What it is | Beats | Effort |
|---|-------|-----------|-------|--------|
| 0 | `06-premium-design-performance.md` | **Governing quality bar** — design tokens + dark mode, mobile-first Edit/Preview/Score UX, hard performance budgets in CI, all-screen layouts 320px→4K | Enhancv/Novoresume on polish; every builder on mobile speed | Pass 1 up front, then enforced in every brief |
| 1 | `01-gulf-match-score.md` | Paste a job description (or pick a live JobStrike job), get a 0–100 Gulf Match Score with a keyword-gap list and one-click fixes | Rezi Score, Novoresume Skill Gap, Teal Job Matcher | ~1–2 wks |
| 2 | `02-templates-and-rtl.md` | 8 sector templates + true RTL/Arabic editing mode | Tadween, CV Gulf, every Western builder | ~2 wks |
| 3 | `03-language-packs.md` | UI + section headings in EN / AR / HI / UR / TL | Nobody covers all five — near blue ocean | ~1 wk |
| 4 | `04-jobstrike-bridge.md` | Application tracker on live UAE jobs + trackable CV share links | Teal ($13/wk, US-only), VisualCV analytics | ~2–3 wks |
| 5 | `05-trust-and-monetization.md` | Review flywheel, "no trap" positioning, comparison pages, paid human HR review | The entire category's trust problem | ~1–2 wks |

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

## 4. Monetization principle

Never gate the core builder or export. Revenue comes from:
1. **HR Review** — one-off paid human review by Kim (AED 149 suggested), Stripe payment link, no subscription.
2. **JobStrike Pro** (later) — alerts + fit scores on the live job feed, transparent monthly price, cancel anytime, price shown before email capture.

## 5. KPIs (instrument via PostHog, org "Job Strike")

| Event | Name |
|---|---|
| CV started | `cv_started` |
| CV exported | `cv_exported` (props: template, language, format) |
| Match run | `match_score_run` (props: score, source=paste\|jobstrike) |
| Gap fix applied | `match_gap_fixed` |
| Review request shown / clicked | `review_prompt_shown` / `review_prompt_clicked` |
| HR Review purchased | `hr_review_purchased` |

90-day targets: 200+ Trustpilot reviews (from 27), Match Score used in ≥40% of sessions,
first 50 HR Review sales, comparison pages ranking for "zety alternative uae" / "dubai cv builder".

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
- [ ] Free export still works with zero signup
- [ ] PostHog events fire (check live in the Job Strike project)
