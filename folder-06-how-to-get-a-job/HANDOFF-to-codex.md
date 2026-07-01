# Folder 6: How to Get a Job in the UAE — Review Gate Handoff

**Status:** Published to WordPress as DRAFTS, fully optimised. Awaiting Kim's anecdote sign-off, then publish on approval.

## Live draft page IDs (parent = hub 47595)
| Page | ID | URL on go-live |
|---|---|---|
| Hub | 47595 | /how-to-get-a-job-in-the-uae/ |
| From India | 47596 | /how-to-get-a-job-in-the-uae/from-india/ |
| For freshers | 47597 | /how-to-get-a-job-in-the-uae/for-freshers/ |
| On a visit visa | 47598 | /how-to-get-a-job-in-the-uae/on-a-visit-visa/ |
| No experience | 47599 | /how-to-get-a-job-in-the-uae/no-experience/ |

## Rail + optimisation (verified live)
All 5: word count 1,343–1,434; 0 em dashes / AI phrases / US spellings / formulaic transitions; 8–12 first-person markers; exact CTA; 2 gender-balanced anecdotes; titles, meta, headlines all in band. AIOSEO title/desc, Article + Breadcrumb + FAQ schema, canonical, og:image, per-page focus keyphrase, featured image (media #47600–47608).

**Structure rotation:** hub=question-driven, from-india=cold-open, for-freshers=data-first, on-a-visit-visa=contrarian, no-experience=question-driven. No two adjacent alike.

## Consolidation (redirects/aioseo-import-folder-06.csv) — 11 301s
6 generic "find a job" posts → hub; 3 fresher posts → /for-freshers/; 2 no-experience posts → /no-experience/. Interview-prep posts intentionally left alone (belong to Slot 11 Interview Answers).

## Cross-links to other clusters
Hub + spokes link to: /uae-employment-visa/, /gcc-cv-guide/, /gcc-recruitment-guide/internships/, /how-to-get-a-job-in-the-uae/on-a-visit-visa/. All resolve to live pages.

## Go-live (when approved)
1. `PUBLISH_STATUS=publish bash publish.sh folder-06-how-to-get-a-job`
2. `bash dedupe-canonical.sh redirects/aioseo-import-folder-06.csv`
3. Verify URLs and canonicals; batch-import all CSVs via AIOSEO UI when convenient.
