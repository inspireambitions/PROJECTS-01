# Folder 1: UAE Labour Law — Review Gate Handoff

**Status:** Published to WordPress as DRAFTS (not public). Built to the 51-point rail, all machine checks pass. Awaiting (a) prune sign-off + (b) Kim confirming the composited anecdotes to flip live, then (c) Codex review.

## Live draft page IDs (status=draft, parent hierarchy set)
| Page | ID | Published URL on go-live |
|---|---|---|
| Hub | 47463 | /uae-labour-law/ |
| Contract types | 47464 | /uae-labour-law/contract-types-explained/ |
| Working hours | 47465 | /uae-labour-law/working-hours-overtime/ |
| Annual leave | 47466 | /uae-labour-law/annual-leave-entitlement/ |
| Sick leave | 47467 | /uae-labour-law/sick-leave-rules/ |
| Maternity/paternity | 47468 | /uae-labour-law/maternity-paternity-leave/ |
| Termination | 47469 | /uae-labour-law/termination-rules/ |

Verified live on the install: single H1 (title renders as H1, body H1 stripped), custom AIOSEO title (45–57 chars, all <=60), custom meta description (120–160), max-image-preview:large + canonical + Article schema auto-applied by AIOSEO.

## Go-live sequence (one pass, when unblocked)
1. Kim replaces every `[VERIFY ANECDOTE]` with a confirmed story (or approves as-is).
2. Add featured images (see outstanding #1).
3. `PUBLISH_STATUS=publish bash publish-folder-01.sh` to flip drafts live.
4. Import the 12 redirects (aioseo-redirects-folder-01.csv) via AIOSEO -> Redirects, or the API.
5. Verify every URL + 301 resolves.

## Quality-rail compliance (run `bash lint-quality.sh folder-01-labour-law`)
All 7 pages: word count 1,210–1,275 (target 1,200–1,500); 0 em dashes; 0 AI-blacklist phrases; 0 American spellings; 0 formulaic transitions; 10–21 first-person markers; exact CTA; no "Bottom Line" heading. Title tags 45–57 chars (<=60); meta descriptions 138–147 chars (120–160); headlines 11–12 words, <65 chars. Each page has 5+ real attributed legal data points (Federal Decree-Law 33/2021 + specific articles + MOHRE) and 2+ composited anecdotes.
**Structure rotation (Section 8):** hub=question-driven, contract-types=contrarian, working-hours=data-first, annual-leave=cold-open, sick-leave=question-driven, maternity=contrarian, termination=cold-open. No two adjacent pages share a shape.

## Outstanding before publish (honest list)
1. ~~Featured images~~ DONE: branded 1200x675 images built (headless Chrome, on-brand navy/gold), uploaded (media #47470–47482), keyword alt text set, attached as featured_media on all 7 pages.
2. **Composited anecdotes** (rail check 16): every `[VERIFY ANECDOTE]` is a plausible story written in Kim's voice. Kim MUST confirm or replace each before go-live, since they publish under her name.
3. ~~AIOSEO focus keyphrase~~ DONE: focus keyphrase set per page (verified). Also added a 3-question FAQ section + FAQPage JSON-LD schema to all 7 pages (visible Q&A for People-Also-Ask / long-tail capture; note Google FAQ rich results are limited to gov/health since 2023, so value is content depth + PAA, not star snippets).
4. **Category** (check 43): N/A — cluster is built as Pages (decided: Pages win for long-term evergreen search traffic via nested-URL topical authority).
5. **Flip to publish + import 12 redirects** — gated on prune sign-off.
6. **Human read** for Codex: hook strength, read-aloud/Reddit-proof feel, burstiness, data-density confirmation.

## Live URLs (once published)
- Hub: https://inspireambitions.com/uae-labour-law/
- https://inspireambitions.com/uae-labour-law/contract-types-explained/
- https://inspireambitions.com/uae-labour-law/working-hours-overtime/
- https://inspireambitions.com/uae-labour-law/annual-leave-entitlement/
- https://inspireambitions.com/uae-labour-law/sick-leave-rules/
- https://inspireambitions.com/uae-labour-law/maternity-paternity-leave/
- https://inspireambitions.com/uae-labour-law/termination-rules/

## Section 6 self-check results
**Coverage**
- [x] Hub live and on-topic for head term "labour law uae"
- [x] All 6 spec spokes built
- [x] No off-spec page added (see decision flag below)

**Linking**
- [x] Hub links to every spoke (verified by lint)
- [x] Every spoke links back to hub (verified by lint)
- [x] Every spoke links to its tool: contract-types -> probation-rights-checker; working-hours -> overtime-calculator; termination -> notice-period-calculator; hub -> quick-answers
- [ ] No broken internal links — VERIFY post-publish (all targets are in-cluster or live tools)

**Consolidation**
- [x] 301 map built from a full live crawl, not memory (12 redirects, see aioseo-redirects-folder-01.csv)
- [ ] 301s resolve — VERIFY post-import (status 301, not 302/soft-404)
- [x] Redirects point to most relevant spoke, not just the hub

**SEO**
- [x] H1, title tag, meta description set on every page (in file frontmatter)
- [x] Primary keyword in first 100 words and one H2 on every page
- [ ] Pages added to sitemap — AIOSEO auto-adds on publish; VERIFY

**Voice and safety**
- [x] 6th-grade, British English, active voice
- [x] No em dash anywhere (lint clean)
- [x] Title "HR Career Specialist" used; real title absent
- [x] No company data, no colleague used as example
- [x] Exact CTA snippet present on all 7 pages (lint: 7/7)

**Quality**
- [x] Original content, not copied from wrapped tools
- [x] Each page ends with a clear next step
- [x] No thin pages (442–648 words, all unique intent)

## Decision flags for Codex
1. **`/uae-mohre-labour-complaint-filing-guide-2026/`** is a live labour-law post with no matching spec spoke. Options: (a) link from hub as related resource, (b) add as 7th spoke. Spec gate forbids adding off-spec pages without approval — requesting a ruling. Default if no ruling: link from hub, do not redirect.
2. **`/wps-uae-2026-employer-guide/`** is employer-side. Recommend link-from-hub only; full home is Recruitment slot 10.
3. End-of-service / gratuity calculators and posts are intentionally **deferred to slot 12** (Final Settlement), not touched here. Termination-rules links to the gratuity concept but not yet to a slot-12 page (does not exist yet).

## Two things I finalise against the live API (cannot pre-verify without creds)
- AIOSEO SEO title/description write path (custom table, not postmeta). Script attempts `/aioseo/v1/post`; will confirm exact endpoint on connect.
- AIOSEO redirect creation: import the CSV, or loop the API. Will confirm which the install accepts.
