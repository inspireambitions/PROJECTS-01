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
2. **Email follow-up (only where an email exists** — HR Review buyers, brief 04 accounts, alert
   subscribers): single review-ask email via Resend, 3 days after the trigger event, one ever.
3. **Ethics rule (non-negotiable):** ask everyone the same way, no incentives, no filtering happy
   users first. The honest brand is the product; review-gating would poison it and violates
   Trustpilot rules anyway.
4. Surface the live Trustpilot score on the homepage once ≥ 4.3 with ≥ 100 reviews.

## Part B — "No trap" positioning on the product itself

1. **Homepage hero rewrite:**
   - H1: *"The CV builder built by a Gulf HR specialist — not an algorithm guessing what one looks like."*
   - Sub: *"Free forever. No $2.95 trial. No $25 surprise renewal. Export without a watermark, no card, no signup."*
   - Trust strip under the CTA: ✓ Free PDF & JPEG ✓ No account needed ✓ Built by a practising recruiter ✓ Gulf Match Score included
2. **Download-button microcopy:** "Download free — no card, ever." (the exact moment competitors
   spring their paywall is the exact moment we say this).
3. **"Why free?" page:** one honest paragraph — Kim's story, what's paid (HR Review) and what
   never will be. Link it in the footer. This page converts skeptics and earns links.

## Part C — Comparison pages (SEO offense)

Programmatic-ish but hand-finished pages: `/vs/zety`, `/vs/resume-io`, `/vs/enhancv`,
`/vs/kickresume`, `/vs/canva`, plus `/best-cv-builder-uae` and `/dubai-cv-format` (consolidate
with the existing inspireambitions.com Dubai page — canonical to one URL, don't compete with
yourself).

Rules: every claim factual and dated ("Zety's 14-day trial renews at $23.95–25.95/4 weeks as of
July 2026 — source linked"), a real feature table (Gulf template ✓/✗, Arabic RTL ✓/✗, free
export ✓/✗, trial trap ✗/✓, live Gulf jobs ✓/✗), no fabricated review quotes, JSON-LD
`SoftwareApplication` + `FAQPage` schema, shared template so adding competitor #7 is a data file.

## Part D — HR Review (first revenue, no subscription)

1. **Offer:** "Get your CV reviewed by the HR specialist who built this tool." Async, 48h
   turnaround, delivered as annotated PDF + a short Loom-style video. **AED 149 one-off**
   (~$40 — mid-market: fiverr-cheap signals low quality, agency-$300 kills volume; validate with
   the first 20 sales).
2. **Flow (v1, deliberately manual):** Stripe Payment Link (no Stripe integration build) →
   success page + webhook → row in a `hr_review_orders` table (or, v0, an email to Kim via
   Resend with the CV attached JSON→PDF) → Kim delivers by email. Automate only after 50 sales
   prove demand.
3. **Placement:** after export ("Want human eyes on it before you send it?"), and on Match Score
   results between 50–74 — the exact segment that knows it's close but stuck. Never a popup
   before value is delivered.
4. **Capacity guard:** hard cap of N orders/week with a visible "this week is fully booked —
   join the list" state, so a spike never breaks the 48h promise. Scarcity here is honest AND good marketing.

## Acceptance criteria

- [ ] Review card: fires once, post-export only, dismiss is permanent, deep-links to Trustpilot
- [ ] Homepage hero + download microcopy shipped as specced (copy above is final, not placeholder)
- [ ] 5 `/vs/*` pages + UAE page live, every competitor claim source-linked and dated, schema validates
- [ ] HR Review: Stripe Payment Link E2E test (test mode) → order recorded → Kim notified with CV attached; capacity cap works
- [ ] "Why free?" page live and footer-linked
- [ ] PostHog: `review_prompt_shown/clicked`, `vs_page_view` (competitor), `hr_review_cta_clicked` (placement), `hr_review_purchased`

## Codex handoff prompt

> Implement per this brief: (A) the one-time post-export Trustpilot review card with permanent
> dismiss, plus a Resend follow-up email template for users whose email we hold; (B) the homepage
> hero, trust strip, download-button microcopy, and "Why free?" page using the exact copy in Part
> B; (C) a data-driven comparison-page template rendering /vs/{competitor} from JSON data files
> with feature table, dated sourced claims, and SoftwareApplication+FAQPage JSON-LD, seeded for
> zety, resume-io, enhancv, kickresume, canva plus /best-cv-builder-uae; (D) the HR Review
> purchase flow via Stripe Payment Link with webhook → order record → Resend notification to Kim
> including the exported CV, weekly capacity cap with fully-booked state. Wire all PostHog events.
