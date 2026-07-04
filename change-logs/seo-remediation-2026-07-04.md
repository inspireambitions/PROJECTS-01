# SEO Remediation Change Log, 2026-07-04

Branch: `claude/inspire-ambitions-seo-handoff-vd8tva`
Site: `https://inspireambitions.com`

This file is the rollback map. Every live change must record the post ID, field, old value, new value, verification result, and batch gate.

## Starting Baseline

Checked live through WPVibe and WP-CLI on 2026-07-04.

| Metric | 2026-07-03 brief | 2026-07-04 live baseline |
|---|---:|---:|
| Missing AIOSEO meta descriptions | 298 | 298 |
| Custom AIOSEO titles over 60 characters | 278 | 241 |
| Custom AIOSEO descriptions outside 120-160 characters | 175 | 148 |
| Duplicate meta description groups | 78 report finding | 8 live DB groups |
| Duplicate meta description rows | n/a | 34 |
| Duplicate title groups | 69 report finding | 12 live DB groups |
| Duplicate title rows | n/a | 42 |

## Change Entries

### Phase A sample attempt 1, canonicalised rows

These three rows were updated first, but live HTML checks showed each public URL resolves to a canonical target page whose meta description is controlled by the target. These changes are kept because they reduce the missing-description DB count, but they are not treated as the passed live-rendered sample gate.

| Post ID | URL | Field | Old value | New value | Verification |
|---:|---|---|---|---|---|
| 651 | `/how-to-get-a-job-in-abu-dhabi-2024/` | AIOSEO description | `null` | `Learn how to get a job in Abu Dhabi, from key hiring sectors and visa steps to job portals, CV tips, interview prep, and expat work basics.` | AIOSEO DB updated. Public URL rendered canonical target `/abu-dhabi-careers/finding-a-job/`, so not counted as live-rendered sample pass. |
| 654 | `/living-and-working-in-abu-dhabi-2024/` | AIOSEO description | `null` | `See what living and working in Abu Dhabi means for expats, including salaries, housing, family life, costs, culture, and daily work realities.` | AIOSEO DB updated. Public URL rendered canonical target `/abu-dhabi-careers/`, so not counted as live-rendered sample pass. |
| 807 | `/how-to-land-a-top-internship-in-the-uae/` | AIOSEO description | `null` | `Learn how to get a tech internship in Dubai or Abu Dhabi, with skills to build, when to apply, interview prep, and ways to stand out.` | AIOSEO DB updated. Public URL rendered canonical target `/gcc-recruitment-guide/internships/how-to-get-one/`, so not counted as live-rendered sample pass. |

Cache after this attempt: `wp cache purge` succeeded. WPVibe reported `Purged: WP Rocket. Object cache flushed.` Cloudflare purge was not exposed through the available WPVibe CLI.

### Phase A sample 1, live-rendered rows

| Post ID | URL | Field | Old value | New value | Verification |
|---:|---|---|---|---|---|
| 46930 | `/wps-uae-2026-employer-guide/` | AIOSEO description | `null` | `Understand UAE Wage Protection System rules for 2026, including Day 1 salary deadlines, 85% compliance, employer liability, and MOHRE escalation.` | AIOSEO DB updated. Public HTML printed the exact meta description after cache purge. |
| 46932 | `/limited-vs-unlimited-contract-uae/` | AIOSEO description | `null` | `Learn what limited vs unlimited contract means in the UAE now, including fixed-term rules, notice periods, renewal, gratuity, and employee rights.` | AIOSEO DB updated. Public HTML printed the exact meta description after cache purge. |
| 46933 | `/golden-visa-uae-salary-requirement/` | AIOSEO description | `null` | `Check the UAE Golden Visa salary requirement, what the AED 30,000 rule means, and how salary thresholds affect skilled expat applications.` | AIOSEO DB updated. Public HTML printed the exact meta description after cache purge. |

## Verification Gates

- Phase A baseline on 2026-07-04: missing descriptions 298, over-60 custom titles 241, out-of-range custom descriptions 148, duplicate description groups 8, duplicate title groups 12.
- After canonicalised row updates: missing descriptions 295.
- After live-rendered sample updates: missing descriptions 292.
- Mechanical meta checks: all six descriptions were 120-160 characters, no em dashes, no AI blacklist hits, no US spelling hits.
- Cache purge: `wp cache purge` succeeded after each sample attempt. WP Rocket purged and object cache flushed. Cloudflare purge was not available through WPVibe CLI.
- Live-rendered sample gate: passed for post IDs 46930, 46932, and 46933.
- Independent review: separate Codex reviewer `019f2bc1-295e-74d3-b55f-02b392d81bf3` passed all six descriptions. Reviewer confirmed the live-rendered sample gate should pass for IDs 46930, 46932, and 46933.

## Open Decisions

- `/tools/cake-day-gifts/` and language copies: waiting for Kim decision.
- `/car-auction-sharjah/` and `/car-auction-sharjah-2/`: waiting for Kim decision.
- `/bn/`, `/ar/`, `/hi/` language pages: investigate first, then waiting for Kim decision.
- Inactive `ia-hospitality-career-map-{1..4}` plugin folders: waiting for Kim decision before deletion.
