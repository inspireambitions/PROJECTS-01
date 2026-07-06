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
