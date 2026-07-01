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
| 11 | GCC Interview Answers | 🟡 **DRAFT, built, awaiting your approval to publish** | 47709 |
| 12 | UAE Final Settlement | ⬜ **Not started** | — |

**Total live: 67 SEO pages across 10 clusters. 149 old duplicate posts neutralised** (pointed via canonical tag at their replacement page, so nothing on the site competes with itself in search).

---

## What to do next, in order

1. **Approve Slot 11 for publish.** Say "yes" / "approved" / "publish it" and a new session will run the standard publish → verify → canonical-sweep sequence (documented below).
2. **Build Slot 12 — UAE Final Settlement.** The last folder. Per the playbook it should stay small (2–4 pages): hub `/uae-final-settlement/` + `what-youre-owed/`, `unused-leave-payout/`, `before-you-sign/`, `delayed-or-unpaid/`. It should **wrap, not rebuild**, the existing gratuity calculator tools already on the site (link to them): `/uae-gratuity-calculator/`, `/uae-end-of-service-calculator/`, `/uae-end-of-service-gratuity-calculator-2026/`, `/uae-end-of-service-gratuity-calculation-mistakes/`, `/end-of-service-gratuity-uae-what-nobody-in-hr-will-tell-you/`.
3. **Batch-import all 11 redirect CSVs** via the AIOSEO admin UI (this is a manual, human-only step — see "Known limitation" below). Not urgent since canonicals already prevent duplicate-content harm, but it completes proper 301 authority transfer.
4. **Give a final read-through** to the `[VERIFY ANECDOTE]`-flagged composited stories across Folders 2–11. You reviewed and swapped several in Folder 1 already; the rest haven't had a pass yet.
5. **Revoke the WordPress Application Password** in `.wp-creds` once everything is signed off — it currently has full Administrator API access.

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
