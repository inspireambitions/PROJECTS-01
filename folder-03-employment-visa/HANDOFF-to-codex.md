# Folder 3: UAE Employment Visa — Review Gate Handoff

**Status:** Published to WordPress as DRAFTS, fully optimised (guardrail + FAQ + keyphrase + featured images + cross-links). Awaiting Kim's anecdote sign-off, then Codex review and publish on approval. Publish order: after Folders 1 and 2 (it links to both).

## Live draft page IDs (parent = hub 47523)
| Page | ID | URL on go-live |
|---|---|---|
| Hub | 47523 | /uae-employment-visa/ |
| How it works | 47530 | /uae-employment-visa/how-it-works/ |
| Cost and who pays | 47525 | /uae-employment-visa/cost-and-who-pays/ |
| Visa types | 47526 | /uae-employment-visa/visa-types/ |
| Status and renewal | 47527 | /uae-employment-visa/status-and-renewal/ |
| Cancellation and transfer | 47528 | /uae-employment-visa/cancellation-and-transfer/ |

## Rail + optimisation (verified live)
All 6: word count 1,201–1,248; 0 em dashes / AI phrases / US spellings / formulaic transitions; 8–15 first-person; exact CTA; 2–3 gender-balanced anecdotes; title 46–52 chars, meta 133–146, headline 8–10 words. AIOSEO title/desc, Article + Breadcrumb + FAQ schema, canonical, og:image, max-image-preview:large, per-page focus keyphrase, featured image (media #47531–47541), all verified.
**Structure rotation:** hub=question-driven, how-it-works=cold-open, cost=contrarian, visa-types=data-first, status=question-driven, cancellation=contrarian. No two adjacent alike.

## Facts verified against official channels (Jun 2026)
- Employer bears work permit + recruitment cost — Federal Decree-Law 33/2021 (u.ae, mohre.gov.ae).
- MOHRE work permit valid 2 months to enter; 60 days to complete medical/Emirates ID/labour card/stamping; residence visa 2 years — u.ae.
- Work permit fee AED 250–3,450 by company classification A/B/C — u.ae/MOHRE.
- 12+ work permit types; 9 ISCO skill levels (L1-2 bachelor, L3-4 diploma, L5 high school) — u.ae/MOHRE.
- Grace period up to 6 months by category / ~30 days after cancellation — u.ae.

## Consolidation (redirects/aioseo-redirects-folder-03.csv) — 8 301s
work-permit-dubai + residence-visa-stamp + medical-tests -> how-it-works; work-permit-cost -> cost-and-who-pays; work-permit-types + type-of-residence-visa -> visa-types; renew-cost + medical-insurance -> status-and-renewal.
Deferred (other clusters): /abu-dhabi-work-permits/ (slot 9), /dubai-work-permit-african-nationals/ (slot 6), non-UAE work-visa posts. Keep+link (not redirect): /uae-employment-contract-red-flags.../ insider post.

## Cross-links wired (verified)
- freelance-vs-employment (47491) -> /uae-employment-visa/ ; employment hub + cost -> /uae-freelance-visa/... ; employment pages -> /uae-labour-law/...

## Note: slug-collision bug found + fixed
"how-it-works" slug exists in both Folder 2 and Folder 3. The first publish hijacked Folder 2's page; restored it (#47489 -> freelance, parent 47488) and created Folder 3's separately (#47530, parent 47523). publish.sh now matches on slug AND parent.

## Before go-live
1. Kim signs off the composited anecdotes (`[VERIFY ANECDOTE]`).
2. `PUBLISH_STATUS=publish bash publish.sh folder-03-employment-visa` + import redirects.
