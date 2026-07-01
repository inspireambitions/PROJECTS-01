# Folder 7: UAE Salary Guide — Review Gate Handoff

**Status:** Published to WordPress as DRAFTS, fully optimised. Awaiting Kim's anecdote sign-off, then publish on approval.

## Live draft page IDs (parent = hub 47612)
| Page | ID | URL on go-live |
|---|---|---|
| Hub | 47612 | /uae-salary-guide/ |
| By role | 47613 | /uae-salary-guide/by-role/ |
| By sector | 47614 | /uae-salary-guide/by-sector/ |
| Negotiating your offer | 47615 | /uae-salary-guide/negotiating-your-offer/ |
| What the band hides | 47616 | /uae-salary-guide/what-the-band-hides/ |

## Rail + optimisation (verified live)
All 5: word count 1,201–1,371; 0 em dashes / AI phrases / US spellings / formulaic transitions; 8–16 first-person markers; exact CTA; 2 gender-balanced anecdotes; FAQ + FAQPage schema; AIOSEO meta + focus keyphrase set; featured images (media #47617–47625) attached.

**Structure rotation:** hub=contrarian, by-role=data-first, by-sector=question-driven, negotiating=cold-open, band-hides=data-first. No two adjacent alike.

## Strategy executed per playbook
Aggregators own raw numbers, so this cluster wins on **judgement**: basic-pay-split, gratuity impact, cost-of-living drag, bonus-target reality, service charge, DIFC vs mainland. Salary ranges given as bands with caveats, not point estimates.

## Consolidation (redirects/aioseo-import-folder-07.csv) — 45 301s
The salary swamp is the biggest yet:
- 27 role-specific posts (accountant, chef, engineer, nurse, etc.) → /by-role/
- 9 sector posts (tech, finance, healthcare, hospitality, etc.) → /by-sector/
- 2 negotiation posts → /negotiating-your-offer/
- 5 cost-of-living + basic vs total → /what-the-band-hides/
- 3 generic → hub

## Go-live (when approved)
1. `PUBLISH_STATUS=publish bash publish.sh folder-07-salary-guide`
2. `bash dedupe-canonical.sh redirects/aioseo-import-folder-07.csv` (45 canonicals; will need parallel cache-bust)
3. Verify URLs and canonicals; batch-import all CSVs via AIOSEO UI when convenient.
