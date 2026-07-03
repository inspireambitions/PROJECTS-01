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

## Problem 1 — SEO/meta layer contradicted the page (factual error) — FIXED 2026-07-02

Stored in AIOSEO's own table (`wpof_aioseo_posts`, row id 8483, post_id
428), not in postmeta. The same string was reused across three columns
(`description`, `og_description`, `twitter_description`), and the JSON-LD
`WebPage.description` is derived from the same value, so one update
corrected all four surfaces at once.

| Field | Old text | New text (live now) |
|---|---|---|
| `description` | "A weekly briefing for hospitality professionals across the UAE and GCC. Salaries, hiring trends, labour rights, and the moves shaping your next role." | "A career briefing for hospitality professionals across the UAE and GCC, every other Sunday. Salaries, hiring trends, labour rights, and the moves shaping your next role." |
| `og_description` | same old string | same new string |
| `twitter_description` | same old string | same new string |
| JSON-LD `WebPage.description` | same old string | same new string |

Kim approved this exact replacement text on 2026-07-02. Applied via a
direct `UPDATE` on `wpof_aioseo_posts WHERE post_id = 428` (approved
through WPVibe's browser approval flow, since it's a direct DB write) and
verified live afterwards by re-fetching `/wp/v2/pages/428` — all four
fields now show the corrected text with no "weekly" mention anywhere.

## Problem 2 — on-page wording inconsistency — FIXED 2026-07-02

Three spots on the live page said "twice a month" and one said
"Bi-Weekly" instead of "every other Sunday." Kim approved all four
replacements; applied as surgical content edits to the page body and
verified live afterwards (a follow-up search for "twice a month" on the
page now returns zero matches).

1. Signup card reassurance line: *"Sunday mornings, twice a month..."* → *"Every other Sunday. Practical. No spam. Unsubscribe anytime."*
2. Sample Memo section eyebrow label: *"Sample Bi-Weekly Memo"* → *"A Recent Memo"* (drops the cadence claim from a label where it isn't needed and removes the "bi-weekly" ambiguity entirely)
3. About-Kim block: *"...delivered to your inbox twice a month."* → *"...delivered to your inbox every other Sunday."*
4. Bottom CTA micro line: *"Free, twice a month..."* → *"Free, every other Sunday. No spam. Unsubscribe anytime."*

## Problem 3 — welcome-series wording (unverified from this session)

The brief states the welcome series also refers to cadence; I did not have
Resend access this session to check the actual email copy. Before editing
the meta description above, do a quick pass on the 7 welcome emails and
confirm none of them say "weekly" — flag any that do for the same fix.

## Remaining steps

1. ~~Fix the AIOSEO description field on the Subscribe page~~ — done, see
   Problem 1 above.
2. ~~Fix the four on-page wording spots~~ — done, see Problem 2 above. The
   Subscribe page now uses "every other Sunday" consistently everywhere;
   "twice a month" and "Bi-Weekly" no longer appear on it.
3. Check welcome-series copy in Resend for any stray "weekly" references.
4. Re-crawl / re-share-preview the page to confirm the new og:description
   shows correctly on Slack/LinkedIn/WhatsApp link previews (share caches
   can lag behind the live meta tag).
