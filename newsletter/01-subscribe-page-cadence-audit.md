# Subscribe page cadence audit

Live source: https://inspireambitions.com/subscribe/ (page ID 428, read via
WPVibe REST API on 2026-07-02, last modified 2026-06-04). Read-only — no
edits made.

Recommended standard wording (per brief, section 6a): **"every other
Sunday"**. Use it everywhere cadence is mentioned. Avoid "weekly" (wrong)
and avoid "twice a month" / "bi-weekly" (correct in spirit but inconsistent
phrasing, and "bi-weekly" is genuinely ambiguous — it can mean twice a week
to some readers).

## Confirmed: on-page body copy is already correct

The hero and the signup card both already say "every other Sunday, 6:00 AM
GST" and "Free · Every other Sunday." No change needed there.

## Problem 1 — SEO/meta layer contradicts the page (factual error, high priority)

Set via All in One SEO Pro on this page (post ID 428, AIOSEO meta fields).
The same string is reused across four fields, so one fix in AIOSEO's page
description field corrects all four automatically:

| Field | Current text |
|---|---|
| Meta description (`aioseo_meta_data.description`) | "A weekly briefing for hospitality professionals across the UAE and GCC. Salaries, hiring trends, labour rights, and the moves shaping your next role." |
| `og:description` | same string |
| `twitter:description` | same string |
| JSON-LD `WebPage.description` (schema, auto-derived) | same string |

**Proposed replacement** (same length class, same keywords, fixes the
cadence claim):

> "A career briefing for hospitality professionals across the UAE and GCC, every other Sunday. Salaries, hiring trends, labour rights, and the moves shaping your next role."

This is a one-field edit in AIOSEO's page-level SEO settings for the
Subscribe page (or via `aioseo_meta_data.description` through the REST
API / WP-CLI `option`/postmeta update). It touches a shared SEO plugin
surface, so **do not apply until Kim approves the exact replacement text
above.**

## Problem 2 — on-page wording inconsistency (minor, not a factual error)

Three spots on the live page say "twice a month" and one says "Bi-Weekly"
instead of "every other Sunday":

1. Signup card reassurance line: *"Sunday mornings, twice a month. Practical. No spam. Unsubscribe anytime."*
2. Sample Memo section eyebrow label: *"Sample Bi-Weekly Memo"*
3. About-Kim block: *"...delivered to your inbox twice a month."*
4. Bottom CTA micro line: *"Free, twice a month. No spam. Unsubscribe anytime."*

None of these are wrong exactly, but the brief asks for one consistent
phrase across every surface. Proposed replacements, ready for approval:

1. → "Every other Sunday. Practical. No spam. Unsubscribe anytime."
2. → "A Recent Memo" (drops the cadence claim from a label where it isn't needed and removes the "bi-weekly" ambiguity entirely)
3. → "...delivered to your inbox every other Sunday."
4. → "Free, every other Sunday. No spam. Unsubscribe anytime."

## Problem 3 — welcome-series wording (unverified from this session)

The brief states the welcome series also refers to cadence; I did not have
Resend access this session to check the actual email copy. Before editing
the meta description above, do a quick pass on the 7 welcome emails and
confirm none of them say "weekly" — flag any that do for the same fix.

## Suggested order of operations once Kim approves

1. Fix the AIOSEO description field on the Subscribe page (fixes meta, og,
   twitter, and JSON-LD in one edit).
2. Fix the four on-page wording spots (Problem 2) — small, low-risk content
   edits inside the existing page HTML block.
3. Check welcome-series copy in Resend for any stray "weekly" references.
4. Re-crawl / re-share-preview the page afterwards to confirm the new
   og:description shows correctly on Slack/LinkedIn/WhatsApp link previews.
