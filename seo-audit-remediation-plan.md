# inspireambitions.com — SEO Audit Remediation Plan

Source: Seobility full-export crawl, 07/03/26, 1,000 pages crawled / 7,049 detected.
Baseline scores (verified from the rendered PDF page, not text extraction — see note below):
**Overall 60% · Tech & Meta 63% · Structure 46% (weakest) · Content 72%.**

> Fact-check note: this PDF's tables do not extract reliably as plain text — numbers and
> labels get reordered. Every figure in this plan was either (a) read from a rendered page
> image, or (b) taken from a full prose sentence in the report's "Important todos" narrative
> section (e.g. "78 pages have a duplicate meta description"), never from a bare number in a
> grid. Where I wasn't sure, I said so instead of guessing.

Ownership key: **[REPO]** = doable now, in this git repo. **[WP]** = needs WordPress edit
access (dispatch or Kim). **[DECISION]** = needs Kim's call before anyone touches it.
**[EXTERNAL]** = outside anyone's WordPress access (e.g. a third-party site).

---

## Phase 0 — Decisions needed before any fixing starts [DECISION]

Two things get worse, not better, if "fixed" without a decision first:

1. **`/tools/cake-day-gifts/` (+ `/bn/` `/ar/` copies)** — a birthday-reminder app landing
   page on a UAE hospitality careers domain. Options: remove entirely, `noindex` it, or move
   it to its own subdomain/domain so it stops diluting this site's topical relevance and
   stops tripping the "duplicate content" / "competing keywords" checks tied to it.
2. **`/car-auction-sharjah/` ↔ `/car-auction-sharjah-2/`** — same pattern, a second
   off-topic orphan pair, currently stuck in a redirect loop. Same three options.

Also decide: **do the `/bn/`, `/ar/`, `/hi/` translations get properly translated, or
retired?** Right now several are literal untranslated duplicates of the English pages
(flagged as full duplicate content), they're slower to load (dominating the "slow response
time" list at 1.4–2.1s), and sit deepest in the site structure (dominating the "192 pages
3+ clicks from homepage" list). Fixing them properly (real translation) is a large content
job; retiring them (redirect to the English version) is a fast technical fix. Both are valid
— but the plan below can't proceed on this front until you pick one.

---

## Phase 1 — Structure fixes (the weakest scoring area, 46%) [WP]

1. **Fix the www / non-www redirect inconsistency.** Flagged "Very important." One-time
   server/CMS-level 301 rule.
2. **Break the 2 redirect loops** (`car-auction-sharjah` pair — folds into the Phase 0
   decision above).
3. **Fix the 1 canonical link error** — `/travel-tools/` has more than one canonical tag on
   the page. Reduce to one.
4. **Fix the 210 internal redirects** — internal links pointing at URLs that then 301
   elsewhere, instead of linking straight to the destination. The report gives the exact
   pairs (e.g. `/salary-guide/` → `/salary-guides/`, `/contact/` → `/contact-me/`,
   `/newsletter/` → homepage, `/jd-generator/` → `/gcc-job-description-generator/`,
   `/coaching/` → `/career-coaching/`). Repoint each source link directly to its final
   target.
5. **Fix the 20 hreflang (alternate link) errors** — mostly `/bn/` and `/ar/` pages missing
   a self-referencing hreflang tag, or with a duplicate hreflang target. Depends on the
   Phase 0 translation decision — if a language is retired, its hreflang tags come out
   entirely instead of being fixed.
6. **Resolve keyword cannibalization (13 competing-page groups).** Concrete list from the
   report:
   - Homepage vs `/career-hub/` vs `/career-coaching/` vs `/hospitality-career-path/` — all
     competing for "hospitality career."
   - `/tools/` vs `/career-tools/` — competing for "tools."
   - **The legacy job-interview cluster — corrected after Opus review (see below).** Only
     **`/common-job-interview-questions-answers/`** (+ its `/hi/` `/bn/` `/ar/` copies) is a
     genuine topical match for Folder 11 (GCC Interview Answers) — it's a general Q&A
     roundup that Folder 11's Gulf-specific answers were built to supersede, and each Folder
     11 spoke already carries an explicit `absorbs_301` list of exactly this kind of generic
     duplicate. **[REPO]** I'll extend the redirect mapping to fold this one page (+
     variants) into the Folder 11 hub.
   - **The rest of the cluster — `/uae-job-interview-guide/`, `/what-to-wear-to-a-job-
     interview-guide/`, `/how-to-follow-up-after-a-job-interview-guide/`,
     `/after-the-interview-offers-and-decisions/`, `/job-interview-nerves-confidence-guide/`,
     `/industry-specific-interview-guides/` — do NOT belong redirected into Folder 11.**
     Folder 11 covers 5 specific interview *answers*; this cluster covers interview
     *process/logistics*, a genuinely separate topic. Confirmed two ways: (1) the offer/
     negotiation content already has its own home — Folder 11's own expected-salary spoke
     links offer-negotiation out to `/uae-salary-guide/negotiating-your-offer/`, a different
     cluster entirely; (2) `folder-11-interview-answers/HANDOFF-to-codex.md` already flags
     this exact ambiguity and tells the next session to judge "whether each maps to one of
     these 5 spokes or is genuinely out of scope." Their real problem per the report is
     duplicate/thin content across their own `/hi/` `/bn/` `/ar/` copies — that's the Phase 0
     translation decision, not a Folder 11 redirect. Building a proper "interview process"
     cluster later is legitimate future work, outside tonight's scope and outside the
     original 12-slot playbook.
7. **Fix the 98 identical-anchor-text problems.** Two real patterns here, not one:
   - A "related posts" widget appears to use the **publish date** as link text (e.g. "jun
     26, 2026" linking to 6 unrelated salary pages at once). That's a template/theme fix,
     not a content fix — swap the widget's link text from date to page title. **[WP]**
   - Some anchor text is reused across genuinely different pages (e.g. "book a discovery
     call" linking to both `/book-a-discovery-call/` and `/career-coaching/`). Needs
     per-instance review of which link should keep that anchor text.
8. **Reduce the 192-page click-depth problem** — mostly `/bn/` pages 7+ clicks from the
   homepage. Add them to relevant navigation/hub pages, or resolve via the Phase 0
   translation decision.

---

## Phase 2 — Content fixes (72%, but real gaps remain)

1. **[REPO, needs Kim's read] Extend and complete the interview-swamp redirect mapping.**
   The 404-fix CSV already in this repo handles 8 URLs; this report surfaces the much larger
   legacy cluster in Phase 1.6 above. I can draft the redirect rows once the mapping
   decisions are made.
2. **[WP] Fix 14 duplicate-content pages.** Beyond the cake-day-gifts and Phase-0 language
   duplicates, this includes `/bn/gcc-job-description-generator/`,
   `/bn/hospitality-career-path/`, `/bn/promotion-readiness-assessment-test/`,
   `/bn/ai-powered-cv-builder/` all being exact duplicates of their `/ar/` counterparts.
3. **[WP] Split `/glossary/`** — 10,906 words with 203 duplicate paragraphs within itself
   (its `/bn/` and `/ar/` copies are worse: 12,000+ words, 290 and 174 duplicate paragraphs
   respectively). Break into topic-specific glossary sections or link out to fuller articles
   instead of repeating full definitions inline.
4. **[WP] Expand the 6 other "very much text" pages** (4,000–4,500 words each: "what to
   research," "what questions to ask," "how to ask about application status," "how to close
   an interview," "questions you get asked") — check whether they need splitting into
   focused sub-pages the way Folder 11 already did for interview topics, to stop them
   competing with Folder 11's own spokes.
5. **[WP] Expand the 55 "too few paragraphs" pages** where thin content is a genuine problem
   (not landing pages/calculators, which are fine thin) — specifically the legacy
   job-interview cluster already flagged in Phase 1.6, `/career-hub/`, `/career-coaching/`,
   `/salary-guides/`, `/contact-me/`.
6. **[WP] Fix 2 typos**: "dependant" → "dependent" on `/neom-careers-salary-2026/` and
   `/hr-manager-salary-dubai-hospitality/`.
7. **[WP] Add body text to pages with none**: `/should-i-take-this-dubai-job/`, `/tools/`,
   `/living-in-the-uae/` (plus `/bn/` `/ar/` copies of the first).
8. **[DECISION then WP] Fix or replace 10 dead MOHRE.gov.ae government links** cited from
   `/glossary/` as legal sources. These are external, so nobody here can "fix" the .gov.ae
   side — replace with current working URLs to the same regulations, or cite the specific
   Federal Decree-Law by number without a dead hyperlink.
9. **[WP] Fix the malformed LinkedIn URL** (`https/https://...`) linked from 3 `/about-kim/`
   language variants — likely a copy-paste error in a shared bio block.

---

## Phase 3 — Tech & Meta fixes (63%)

1. **[WP] Rewrite 165 problematic page titles + 69 duplicate titles.** The duplicate-title
   list is dominated by `/hi/` `/bn/` `/ar/` copies sharing their English title verbatim —
   this resolves largely as a side effect of the Phase 0 translation decision, plus a
   handful of genuine same-language duplicates to write uniquely.
2. **[WP] Rewrite 165 problematic + 78 duplicate meta descriptions.** Report gives 20 exact
   "too long" examples with pixel-width overages (e.g. `/uae-career-guide/` at 1,052/1,000
   px) — these are quick trims, not rewrites from scratch.
3. **[WP] Fix 67 H1 problems + 201 heading-structure problems.** Includes real "too many H1"
   issues on `/about-kim/`, `/dubai-cv-builder/`, `/interview-prep/`, `/job-search-hacks/`,
   `/contact-me/`, `/travel-tools/` and their language variants, plus heading-hierarchy gaps
   (H1→H3 skips) on pages like `/dubai-cv-builder/` and `/how-to-get-promoted-in-a-dubai-hotel/`.
4. **[WP] Add alt attributes to images on 68 pages** — report lists them explicitly,
   dominated by the calculator/tool pages (gratuity, CV builder, JD generator, salary
   benchmarking, etc.) and several insider posts.
5. **[WP] Fix 108 strong/bold tag problems** — mostly "many tags" (over-emphasis) on pages
   like `/career-coaching/`, `/glossary/`, `/restaurant-jobs-in-dubai/`; a smaller "too
   long"/"duplicate" subset needs the actual bolded phrase shortened or de-duplicated.
6. **[WP, infra] Improve response times.** 428 pages "medium" (0.5–1s), 118 "poor/slow" —
   dominated by `/ar/` and `/hi/` pages, some 200–340% slower than the site average. This is
   almost certainly a caching/CDN configuration issue on Rocket.net, not a per-page problem
   — fix at the server level first, then re-measure before touching individual pages.
7. **[WP] Compress 2 oversized HTML pages** — `/ar/glossary/` (510 kB) and `/bn/glossary/`
   (607 kB) — resolves naturally once Phase 2.3 (splitting the glossary) is done.
8. **[WP] Fix 22 pages with conflicting language markup.**
9. **[WP] Investigate the 8 confirmed 404s** from this report — none overlap with the 8 I
   already mapped earlier this session. New ones: `/hotel-night-auditor-salary-dubai/`,
   `/job-interview-tips-guide/`, `/courses/career-confidence-blueprint/`,
   `/travel/tips/packing/`, `/travel/tips/safety/`, `/travel/tips/budget/`, plus `/bn/` and
   `/ar/` copies of the hotel-night-auditor page. **[REPO]** I can draft redirect targets
   for these the same way, once I know (or can research) what replaced each one.

---

## Phase 4 — Verification (re-crawl)

This is **your step, not mine** — I have no Seobility access.

1. Once Phases 0–3 are actually live on the site (not just planned), trigger a new Seobility
   crawl from your account.
2. Compare against this baseline using Seobility's own "Change" column (which will populate
   after the 2nd crawl) — that's the built-in before/after view, more reliable than me
   trying to re-derive it.
3. Send me the new export (same way as this one) and I'll do the same fact-checked read:
   render the actual score page, verify category-by-category, and confirm exactly which
   line items from this plan cleared versus which didn't — no assuming success from a
   headline percentage alone.

---

## What I'd actually recommend starting with

Given Structure is the worst-scoring category (46%) and several Structure issues
(cannibalization, the legacy interview cluster, the two off-topic orphan pages) are things
this session already has real context on: **Phase 0 decisions first**, then **Phase 1.6/1.4**
(cannibalization + internal redirect cleanup), since those also feed directly into finishing
the interview-swamp cleanup that's already half-done. Tech & Meta's title/meta-description
work (Phase 3.1–3.2) is high-volume but mechanical — good work to hand to whoever has
WordPress access in parallel, since it doesn't require content judgement calls.
