# Folder 4: Internships — Review Gate Handoff

**Status:** Published to WordPress as DRAFTS, fully optimised (guardrail + FAQ + keyphrase + featured images). Pillar `/gcc-recruitment-guide/` is a lightweight PLACEHOLDER (will be expanded fully at Slot 10). Awaiting Kim's anecdote sign-off, then Codex review and publish on approval.

## Live draft page IDs
| Page | ID | URL on go-live | Parent |
|---|---|---|---|
| Pillar (placeholder) | 47545 | /gcc-recruitment-guide/ | 0 (top level) |
| Hub | 47546 | /gcc-recruitment-guide/internships/ | 47545 |
| How to get one | 47547 | /gcc-recruitment-guide/internships/how-to-get-one/ | 47546 |
| Intern CV | 47548 | /gcc-recruitment-guide/internships/intern-cv/ | 47546 |
| What employers want | 47549 | /gcc-recruitment-guide/internships/what-employers-want/ | 47546 |
| Convert to a job | 47550 | /gcc-recruitment-guide/internships/convert-to-a-job/ | 47546 |
| Hospitality | 47551 | /gcc-recruitment-guide/internships/hospitality/ | 47546 |

## Rail + optimisation (verified live)
All articles: word count 1,200–1,249; 0 em dashes / AI phrases / US spellings / formulaic transitions; 9–16 first-person markers; exact CTA; 2 gender-balanced anecdotes; title in 40–58, meta 120–160, headline 8–12 words. AIOSEO title/desc, Article + Breadcrumb + FAQ schema, canonical, og:image, max-image-preview:large, per-page focus keyphrase, featured image (media #47552–47564), all verified.

**Pillar (#47545)** is intentional placeholder: 537 words, no FAQ. Will be expanded to full rail at Slot 10 (GCC Recruitment).

**Structure rotation:** hub=question-driven, how-to-get-one=cold-open, intern-cv=data-first, what-employers-want=contrarian, convert-to-a-job=question-driven, hospitality=cold-open. No two adjacent alike.

## Facts verified against official channels
- MOHRE Student Training and Employment Permit (age 15+); non-nationals need residence visa + medical fitness + institution NOC; written guardian consent for ages 15–18 — confirmed at u.ae and mohre.gov.ae.
- Service free via MOHRE beyond federal fees — confirmed.
- Nafis programme referenced for Emirati students.

## Consolidation (redirects/aioseo-import-folder-04.csv) — 23 301s
Targets cover: /internship/, /internship-ultimate-guide/, /uae-internship-guide-2026/, /uae-internship-regulations-2026-mohre-guide/ → hub; hospitality cluster (5 sources) → /hospitality/; how-to-apply / how-to-get / summer (6 sources) → /how-to-get-one/; intern-to-employee (3 sources) → /convert-to-a-job/; stipends/benefits (2 sources) → /what-employers-want/; paid-intern (2 sources) → hub.
**Deferred (not in this folder's redirects):** /nafis-internship-programme-uae/ (keep + link), /dubai-internship-eligibility-checker/ (KEEP — tool already linked from hub), generic global posts (US/Google/Bali etc) NOT folded in (different intent, off-topic to Dubai cluster).

## Go-live (when approved)
1. `PUBLISH_STATUS=publish bash publish.sh folder-04-internships` (note: pillar publishes too as top-level page).
2. Apply canonicals on old duplicate posts → new pages: `bash dedupe-canonical.sh redirects/aioseo-import-folder-04.csv`
3. Import 23 redirects via AIOSEO UI: All in One SEO → Redirects → Import/Export → upload aioseo-import-folder-04.csv (REST endpoint does not accept programmatic import on this install).
4. Verify all 7 URLs return HTTP 200 and key old URLs return 301 / canonical to new pages.
