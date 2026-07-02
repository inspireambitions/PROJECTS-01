# Inspire Ambitions SEO Build — Session Handoff

## ⚠️ READ THIS FIRST: this work requires a specific type of Claude session

This project only works from a session that has **direct shell/filesystem access to this Windows machine** — specifically a **Claude Code CLI session (or Claude Desktop with local tool access) running with this folder as its working directory**.

**It does NOT work from:**
- A cloud-hosted session scoped to a GitHub repo (e.g. one connected to `inspireambitions/PROJECTS-01`). That environment has no access to this Windows machine, no Bash tool pointed at this folder, and no WordPress connection. No amount of pasting instructions bridges that gap — it's a hard environment boundary, not a knowledge gap.
- Any session without a Bash/PowerShell tool that can run commands like `curl` against `inspireambitions.com` using the credentials in `.wp-creds`.

**How this actually works today:** there is no WordPress MCP tool or plugin involved. Every WordPress action so far — creating pages, setting SEO fields, uploading images, checking live URLs — was done with plain `curl` calls to the WP REST API from a Bash tool, using the Application Password stored in a local `.wp-creds` file. That file lives only on this machine and is **not** in any git repository (confirmed: this folder is not a git repo at all). Keep it that way — do not commit it or paste its contents into a cloud/GitHub-connected session.

**To continue this work correctly:** open a new Claude Code (or equivalent local-tool) session on this same Windows machine, with the local Inspire Ambitions project folder, and say "continue the Inspire Ambitions build" or point it at this file. It will have Bash access, will be able to read `.wp-creds`, and can run `publish.sh`, `lint-quality.sh`, and `dedupe-canonical.sh` directly, exactly as before.

**If you genuinely want a cloud/GitHub-based session to take over instead**, that is possible but is a separate, deliberate migration task, not something this file can do on its own: the actual folder contents (HTML files, scripts, redirect CSVs) would need to be pushed to a repo that session can reach, and the WordPress credential would need to move into that platform's proper secrets mechanism — never pasted into chat or committed as a plaintext file. Ask me to scope that migration explicitly if you want it; I would not recommend it purely for convenience, since the current local-only setup is the safer default.

---

## 🔴 Active issue found 2 July: 404 traffic spike

GA4 flagged "Page not found – Inspire Ambitions" as the single most-viewed page on the site for 30 June (32 views, +88% day-over-day) and 1 July continued showing individual dead URLs. Cross-checked against `inventory/content-urls.txt` (the crawled site inventory) and every existing `redirects/*.csv`: at least 8 real, previously-live URLs are now 404ing and were **not** covered by Folder 11's partial redirect sweep (the ~44-URL mapping was explicitly flagged as incomplete against a 3,000+ URL swamp — this is exactly that gap surfacing as live traffic loss).

**➡️ IMPORT THIS ONE FILE: `redirects/MERGED-all-redirects.csv`** (built 2 July). AIOSEO
*overwrites* the whole redirect table on import — it does not merge — so importing the 12
CSVs one by one would leave only the last file's rules. The merged file consolidates all 12
(11 folder CSVs + the 404 fix) into a single deduplicated import: **202 unique rows**, 2
source-URL collisions auto-resolved (later file wins), 0 redirect chains, all rows well-formed.
Before importing: **export the site's existing redirects first as a backup**, and if any of
those are real/unrelated to this project, append them into the merged file so the import
doesn't wipe them. The individual `aioseo-import-folder-*.csv` files are kept for reference.

The 404-fix subset alone is still in **`redirects/aioseo-import-404-fix-2026-07-02.csv`** (not
yet imported — same AIOSEO admin-UI limitation as every other redirect CSV in this repo):

| Old URL | New target | Confidence |
|---|---|---|
| `/how-early-should-you-arrive-for-a-job-interview/` | `/gcc-interview-answers/` (hub) | No dedicated spoke covers this; hub is closest |
| `/how-to-decline-an-interview-after-accepting-another-job/` | `/gcc-interview-answers/` (hub) | Same |
| `/what-to-eat-before-job-interview-smart-fuel-to-perform-with-confidence/` | `/gcc-interview-answers/` (hub) | Same |
| `/what-to-wear-to-a-hotel-job-interview/` | `/gcc-interview-answers/` (hub) | Same |
| `/do-you-ask-about-benefits-in-a-job-interview/` | `/gcc-interview-answers/expected-salary/` | Direct topical match (compensation) |
| `/how-to-provide-references-for-a-job-interview/` | `/gcc-interview-answers/` (hub) | No dedicated spoke |
| `/hospitality-career-path/` | `/gcc-recruitment-guide/internships/hospitality/` | Confirmed live target — same one used repeatedly in `aioseo-import-folder-04.csv` |
| `/rta-theory-test-questions-and-answers-pdf/` | `/` (homepage) | Unrelated topic (UAE driving theory test) — no matching content exists anywhere in the 10 live folders. User chose homepage over leaving it 404. |

**This is very likely not the full list** — only checked the specific paths visible in the GA4 screenshots provided. The underlying problem (interview-question swamp only ~1.5% mapped) is unresolved; treat this CSV as a patch, not a fix. A proper fix means finishing the full crawl-and-map of the 3,000+ near-duplicate posts referenced in `folder-11-interview-answers/HANDOFF-to-codex.md`.

**Still blocked on:** actually importing this (and all other) redirect CSVs requires the WordPress admin UI (AIOSEO → Redirects → Import/Export). No session in this chain has had that access yet.

---

## Where things stand

**10 of 12 playbook folders are LIVE on inspireambitions.com.** Folder 11 is built and sitting in WordPress as drafts, awaiting approval to publish. Folder 12 has not been started — it is the last one in the original playbook.

| Slot | Folder | Status | Hub page ID |
|---|---|---|---|
| 1 | UAE Labour Law | ✅ LIVE | 47463 |
| 2 | UAE Freelance Visa | ✅ LIVE | 47488 |
| 3 | UAE Employment Visa | ✅ LIVE | 47523 |
| 4 | Internships | ✅ LIVE | 47546 (under pillar 47545) |
| 5 | GCC CV Guide | ✅ LIVE | 47570 |
| 6 | How to Get a Job in the UAE | ✅ LIVE | 47595 |
| 7 | UAE Salary Guide | ✅ LIVE | 47612 |
| 8 | Working in Saudi Arabia | ✅ LIVE | 47633 |
| 9 | Abu Dhabi Careers | ✅ LIVE | 47652 |
| 10 | GCC Recruitment | ✅ LIVE | 47545 (pillar, expanded from Slot 4 placeholder) |
| 11 | GCC Interview Answers | 🟡 **DRAFT — quality fixes applied 2 July (anecdote count + gender balance), lint clean, ready to publish** | 47709 |
| 12 | UAE Final Settlement | ⬜ **Not started** | — |

**Total live: 67 SEO pages across 10 clusters. 149 old duplicate posts neutralised** (pointed via canonical tag at their replacement page, so nothing on the site competes with itself in search).

---

## What to do next, in order

1. **Approve Slot 11 for publish.** Say "yes" / "approved" / "publish it" and a new session will run the standard publish → verify → canonical-sweep sequence (documented below).
2. **Build Slot 12 — UAE Final Settlement.** The last folder. Per the playbook it should stay small (2–4 pages): hub `/uae-final-settlement/` + `what-youre-owed/`, `unused-leave-payout/`, `before-you-sign/`, `delayed-or-unpaid/`. It should **wrap, not rebuild**, the existing gratuity calculator tools already on the site (link to them): `/uae-gratuity-calculator/`, `/uae-end-of-service-calculator/`, `/uae-end-of-service-gratuity-calculator-2026/`, `/uae-end-of-service-gratuity-calculation-mistakes/`, `/end-of-service-gratuity-uae-what-nobody-in-hr-will-tell-you/`.
3. **Batch-import all 11 redirect CSVs** via the AIOSEO admin UI (this is a manual, human-only step — see "Known limitation" below). Not urgent since canonicals already prevent duplicate-content harm, but it completes proper 301 authority transfer.
4. **Give a final read-through** to the composited stories across Folders 2–11. You reviewed and swapped several in Folder 1 already; the rest haven't had a pass yet.
   - **⚠️ Folder 11 verification is still OWED — and the inline reminders are now gone.** The `[VERIFY ANECDOTE]` markers were **removed from all six Folder 11 pages on 2 July** because they were inline *visible* text (`<em>[VERIFY ANECDOTE]</em>`) that would have published as literal garbage to readers. Removing them made the pages publish-clean, but it also deleted the visual flag. **Every anecdote in Folder 11 is still a composited/plausible story that Kim has NOT yet confirmed rings true — do that read-through BEFORE publishing, not after.** The stories are in `folder-11-interview-answers/0*.html` (2 per file, in `<p>` tags beginning "I once…" / "A candidate once…").
   - Folder 11 anecdote audit (2 July): hub trimmed 3→2; hub / `01-tell-me-about-yourself` / `02-expected-salary` rebalanced to genuinely gender-mixed (had been all-female); `02` gained a real second anecdote (it had only 1). Also repaired: the newsletter-CTA 👉 emoji had been corrupted to mojibake (`ð`) on three pages during an intermediate edit — restored to the exact required CTA. All six files now pass `lint-quality.sh` clean.
5. **Apply the `/subscribe/` page fixes** — see `subscribe-page-fixes.md` (new, 2 July). Copy + design punch list for the Hospitality Memo signup page. Needs WordPress/page-builder access; page source is not in this repo. One item (colour palette) needs a Kim decision.
6. **Revoke the WordPress Application Password** in `.wp-creds` once everything is signed off — it currently has full Administrator API access.

---

## One honest flag

Folder 11's redirect CSV is a **partial sweep**, not complete. The interview-question swamp turned out to have roughly 3,000+ near-duplicate posts across the site (far more than any other folder) — I mapped the ~44 clearest matches, but a full cleanup of the remainder is real follow-up work, documented in `folder-11-interview-answers/HANDOFF-to-codex.md`.

---

## Tooling reference (all paths relative to the project root)

- **`.wp-creds`** — WordPress credentials (WP_BASE, WP_USER, WP_APP_PASSWORD). Revoke after the full build ships.
- **`publish.sh <folder-dir>`** — generic publisher. Set `PUBLISH_STATUS=draft` or `=publish` as an env var. Reads `00-*.html` as the hub and `01-*.html`, `02-*.html`... as spokes, sets WordPress parent/child hierarchy, pushes content, sets AIOSEO title/description. **Matches existing pages by slug AND parent** (not slug alone — a slug like "how-it-works" repeats across folders, and matching by slug alone once silently overwrote the wrong folder's page; this is fixed).
- **`lint-quality.sh <folder-dir>`** — mechanical quality-rail check: word count (1,200–1,500 target), em dashes, AI-cliché blacklist, US spellings, formulaic transitions, first-person marker count, exact CTA presence, no "Bottom Line" heading. Strips HTML comment frontmatter and `<script>` blocks before counting.
- **`dedupe-canonical.sh <redirect-csv>`** — reads an AIOSEO-format CSV and sets `canonicalUrl` on each listed old post via the API, pointing it at its replacement page. This is the **primary duplicate-content fix**, since true 301 redirects can't be created via API on this install. Run this *after* publishing (the target page must be live). Each touched post also needs a "cache-bust" (`POST /wp-json/wp/v2/posts/{id}` with `status=publish`) because Rocket.net caches the old HTML otherwise — then spot-check a sample of the canonicals live before considering the sweep done.
- **`images/build-images-NN.sh`** — one script per folder, generates 1200×675 branded featured images via headless Chrome screenshots of a local HTML/SVG template. Brand: navy `#0c1828`, gold `#c9a227`, compass/radar motif, Impact condensed wordmark, Georgia italic gold tagline — matches the site's existing social share image exactly.
- **`redirects/aioseo-import-folder-NN.csv`** — one CSV per folder in AIOSEO's exact import format (`Source URL,Target URL,Redirect Type,Ignore Slash,Ignore Case,Regex`). None has been imported yet — see the known limitation below.

## Known limitation: AIOSEO redirects cannot be created via API

Tested extensively on this install. `POST /aioseo/v1/redirects` returns `success:false` for every payload shape tried, including AIOSEO's own internal object structure. The CSV import endpoint (`POST /aioseo/v1/redirects/import-csv`) accepts uploads but silently parses 0 rows regardless of format. **The only working path is the WordPress admin UI**: log in → All in One SEO → Redirects → Import/Export → upload each CSV from the `redirects/` folder. This needs to be done by a human (or by a session with browser/computer-use tooling), not via the REST API.

## Build pattern (repeat for Slot 12 and any future folder)

1. Crawl-check for existing near-duplicate posts on the topic (`grep` against `inventory/content-urls.txt`).
2. Fact-check any hard claims (visa costs, legal article numbers, programme names) against official sources — u.ae, MOHRE, HRSD, ICP, FTA. Never invent statistics.
3. Write hub + spokes as raw HTML files with a leading HTML-comment frontmatter block (slug, structure, headline, title_tag, meta_description, primary_keyword, absorbs_301, anecdotes, faq, links) — the publish script reads this frontmatter.
4. `bash lint-quality.sh <dir>` and fix failures.
5. `bash images/build-images-NN.sh`, then `PUBLISH_STATUS=draft bash publish.sh <dir>`.
6. Upload + attach featured images, set focus keyphrases (currently a manual follow-up curl loop each time, not yet folded into `publish.sh`).
7. Verify: draft status, correct parent, FAQ schema present, keyphrase set, image attached.
8. Write the folder's `redirects/aioseo-import-folder-NN.csv` and `folder-NN-*/HANDOFF-to-codex.md`.
9. **Stop and report — wait for explicit approval before publishing.**
10. On approval: flip to `PUBLISH_STATUS=publish`, verify every URL returns HTTP 200, run `dedupe-canonical.sh`, cache-bust the touched posts, verify canonicals live with a spot-check.

## Content quality bar (every page, no exceptions)

British English, 6th-grade reading level, active voice, zero em dashes, zero AI-cliché phrases (see blacklist in `lint-quality.sh`), 1,200–1,500 words, 8+ first-person markers, structure rotation so no two adjacent spokes share a shape (cold-open / data-first / question-driven / contrarian), exactly 2 gender-balanced composited anecdotes per page flagged `[VERIFY ANECDOTE]`, a 3-question FAQ section with FAQPage JSON-LD schema, and this exact CTA and nothing else: "👉 Enjoying this content? Stay updated with more insightful articles and tips by subscribing to our newsletter. Subscribe Now 👉 and never miss an update!"

Full detail on the quality checklist lives in the `inspire-ambitions-quality-rail` memory file.

---

*Last updated: end of the session that shipped Slots 1–10 live and built Slot 11 to drafts.*
