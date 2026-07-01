# Folder 2: UAE Freelance Visa — Review Gate Handoff

**Status:** Published to WordPress as DRAFTS (not public). Built to the 51-point rail, all machine checks pass, featured images attached. Awaiting (a) Kim confirming the composited anecdotes + the `[VERIFY FIGURE]` cost/threshold numbers, (b) Folder 1 to publish first (gate order + one cross-link), then (c) Codex review and publish on Kim's approval.

## Live draft page IDs (parent hierarchy set)
| Page | ID | URL on go-live |
|---|---|---|
| Hub | 47488 | /uae-freelance-visa/ |
| How it works | 47489 | /uae-freelance-visa/how-it-works/ |
| Cost and fees | 47490 | /uae-freelance-visa/cost-and-fees/ |
| Freelance vs employment | 47491 | /uae-freelance-visa/freelance-vs-employment-visa/ |
| Is it worth it | 47492 | /uae-freelance-visa/is-it-worth-it/ |
| Eligible activities | 47493 | /uae-freelance-visa/eligible-activities/ |

## Rail compliance (lint-quality.sh)
All 6: word count 1,201–1,295; 0 em dashes; 0 AI-blacklist phrases; 0 American spellings; 0 formulaic transitions; 9–19 first-person markers; exact CTA; no "Bottom Line". Title tags 43–51 chars; meta descriptions 141–157; headlines 9–10 words. 5+ attributed data points per page; 2+ composited anecdotes per page, gender-balanced. Featured images 1200x675, keyword alt, attached (media #47494–47504).
**Structure rotation:** hub=data-first, how-it-works=question-driven, cost=cold-open, vs-employment=contrarian, is-it-worth-it=question-driven, eligible=data-first. No two adjacent alike (and hub differs from Folder 1's last page, termination=cold-open).

## Consolidation (redirects/aioseo-redirects-folder-02.csv)
- /freelance-work-in-dubai-your-guide-to-thriving-in-the-gig-economy/ -> /uae-freelance-visa/
- /uae-freelance-visa-vs-employment-visa-decision-guide/ -> /uae-freelance-visa/freelance-vs-employment-visa/
(Golden-visa and digital-nomad posts deliberately NOT folded in — different topic / tourism swamp. A future golden-visa cluster is a separate decision.)

## Figures verified against official channels (Jun 2026) — DONE
All [VERIFY FIGURE] markers removed after fact-check:
- Green Visa income: AED 360,000/yr over prior 2 years — confirmed ICP (icp.gov.ae) + u.ae.
- VAT registration threshold: AED 375,000 taxable turnover — confirmed FTA (tax.gov.ae).
- GoFreelance permit: ~AED 7,500/yr — confirmed (Dubai Development Authority / TECOM).
- Establishment card ~AED 2,000; visa+medical+EID ~AED 4,000-6,000 — confirmed in range.
- First-year total CORRECTED: now AED 12,000-22,000 in popular Dubai zones, with budget zones (RAKEZ/Shams) from ~AED 7,500 (old 12,500-22,500 lower bound was too high).
2. **Composited anecdotes** (12 total): every `[VERIFY ANECDOTE]` is in Kim's voice — confirm or swap.
3. **Cross-links pending**: when Employment Visa (slot 3) is built, cross-link the freelance-vs-employment page both ways. The vs-employment page already links to /uae-labour-law/termination-rules/ (Folder 1), so Folder 1 must publish first for that link to resolve.

## Go-live (when unblocked)
1. `PUBLISH_STATUS=publish bash publish.sh folder-02-freelance-visa`
2. Import aioseo-redirects-folder-02.csv, verify both 301s resolve.
3. Verify all 6 URLs + featured images render.
