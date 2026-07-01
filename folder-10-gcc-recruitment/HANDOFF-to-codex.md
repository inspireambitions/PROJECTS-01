# Folder 10: GCC Recruitment — Review Gate Handoff

**Status:** Published to WordPress as DRAFTS, fully optimised. Awaiting Kim's anecdote sign-off, then publish on approval.

**Important distinction from Slots 1-9:** this is the playbook's explicit **authority spine / internal-link pillar, NOT a traffic play**. Head term "recruitment in uae" is only 50/mo, difficulty 37. The cluster's value is consolidating Kim's employer-side thought leadership and providing cross-cluster link power across the whole site, not search volume.

## Live draft page IDs (parent = pillar 47545, which is the Slot 4 placeholder, NOW EXPANDED)
| Page | ID | URL on go-live |
|---|---|---|
| Pillar (expanded) | 47545 | /gcc-recruitment-guide/ |
| UAE | 47676 | /gcc-recruitment-guide/uae/ |
| Saudi Arabia | 47677 | /gcc-recruitment-guide/saudi-arabia/ |
| Qatar | 47678 | /gcc-recruitment-guide/qatar/ |
| Job descriptions | 47679 | /gcc-recruitment-guide/job-descriptions/ |
| Screening CVs | 47680 | /gcc-recruitment-guide/screening-cvs/ |
| Interview stages | 47681 | /gcc-recruitment-guide/interview-stages/ |
| Work visas | 47682 | /gcc-recruitment-guide/work-visas/ |
| Labour law | 47683 | /gcc-recruitment-guide/labour-law/ |
| Nationalisation quotas | 47684 | /gcc-recruitment-guide/nationalisation-quotas/ |
| Salary benchmarking | 47685 | /gcc-recruitment-guide/salary-benchmarking/ |

**Note:** /gcc-recruitment-guide/internships/ (Slot 4, already live) remains a child of this pillar — unaffected by this update, still resolves correctly.

## Rail + optimisation (verified live)
All 11: word count 1,220–1,389; 0 em dashes / AI phrases (fixed 2x "landscape", 1x "specifically" mid-build) / US spellings / formulaic transitions; 7-10 first-person markers; exact CTA; 2 gender-balanced anecdotes; FAQ + FAQPage schema; AIOSEO meta + focus keyphrase set; featured images (media #47686–47705) attached.

**Structure rotation:** pillar=data-first, uae=cold-open, saudi-arabia=question-driven, qatar=contrarian, job-descriptions=data-first, screening-cvs=cold-open, interview-stages=question-driven, work-visas=contrarian, labour-law=data-first, nationalisation-quotas=question-driven, salary-benchmarking=cold-open. No two adjacent alike.

## Strategy executed per playbook
- Employer-side content throughout, distinct from the candidate-side clusters (Slots 1-9).
- **Wrap, don't rebuild**, the named tools and insider posts: linked (not redirected/duplicated) — /gcc-job-description-generator/, /hospitality-recruitment-gcc/, /uae-hotel-hr-hiring-criteria/, /how-hiring-managers-review-cvs-dubai/, /star-method-uae-hiring-managers/, /emiratisation-2026-hiring-guide/, /how-hiring-has-changed-2001-to-2026/ — all linked from the pillar page, none redirected.
- Cross-links to candidate clusters (UAE Employment Visa, UAE Labour Law, UAE Salary Guide, GCC CV Guide, Working in Saudi Arabia) without restating their content, exactly as the playbook specifies for work-visas and labour-law spokes.
- Country spokes (UAE/Saudi/Qatar) + function spokes (job-descriptions/screening-cvs/interview-stages/work-visas/labour-law/nationalisation-quotas/salary-benchmarking) per the playbook's master roadmap list. Country spokes for the remaining GCC countries (Bahrain, Kuwait, Oman) deferred — playbook says "as capacity allows" after traffic clusters are signed off.

## Consolidation (redirects/aioseo-import-folder-10.csv) — 13 301s
Recruitment company/agency-fee posts (2) → /uae/; Qatarisation + Qatar salary comparison (2) → /qatar/; job-description posts (6) → /job-descriptions/; CV eye-tracking (1) → /screening-cvs/; recruiter-interview-prep posts (2) → /interview-stages/.

**Deliberately NOT redirected (kept live, linked instead):** the 7 tool/insider posts named above — these are the playbook's "wrap and link, do not rebuild" assets.

## Go-live (when approved)
1. `PUBLISH_STATUS=publish bash publish.sh folder-10-gcc-recruitment` (will UPDATE pillar #47545 to publish — it's already live from Slot 4, so this just refreshes content — and publish the 10 new spokes)
2. `bash dedupe-canonical.sh redirects/aioseo-import-folder-10.csv` (13 canonicals)
3. Verify URLs and canonicals; confirm /gcc-recruitment-guide/internships/ still resolves correctly as a sibling.
