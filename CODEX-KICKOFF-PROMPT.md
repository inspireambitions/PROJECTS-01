# Paste this into Codex to start the job

---

You are executing a full SEO remediation for inspireambitions.com (WordPress on Rocket.net).

**Setup:** Clone `https://github.com/inspireambitions/PROJECTS-01.git`, branch
`claude/inspire-ambitions-seo-handoff-vd8tva`. Read, in this order, before touching anything:
1. `CODEX-EXECUTION-BRIEF.md` — your operating manual. Follow it exactly.
2. `seo-audit-remediation-plan.md` — the full issue list from the Seobility crawl.
3. `HANDOFF.md` and `QUALITY-RAIL.md` — project context and the content quality bar.

Work on the live site. Do not break it. I am not a developer, so anything you report to me
must be in plain language.

**Quality system — these five layers are mandatory, not suggestions:**

1. **The rules are in the repo, not your judgement.** Voice rules in `QUALITY-RAIL.md`
   (British English, no em dashes anywhere, no AI-cliché words, "HR Career Specialist" as the
   only title for Kim, the exact CTA snippet). Meta rules in the brief: descriptions 120–160
   characters, unique per page, written from each page's real content. Templated filler
   repeated across pages is banned.
2. **Machine-verify every batch.** After each batch, run the verification queries in the
   brief (missing-description count must reach 0, over-60-char title count must reach 0, and
   so on) and run `lint-quality.sh` on any content you write. A batch that fails does not
   proceed.
3. **Sample first, then batch.** Never bulk-run anything. Do 3 items, verify them live on the
   site (after purging WP Rocket + Cloudflare caches), then continue in batches of no more
   than 50 with a verification query between batches.
4. **Independent review between phases.** At the end of each phase (A through E in the
   brief), have a reviewer that did not do the work check a random sample of at least 10
   changes against the rules. A fail means fix and re-review before the next phase starts.
   Record each gate's result (pass/fail, what was rejected, what was fixed).
5. **Escalate to me only at the marked points.** The brief's §2 lists four decisions that are
   mine (cake-day-gifts page, car-auction pages, the bn/ar/hi language pages, the duplicate
   plugin folders). Stop and ask me at those. Do not ask me to review routine changes — the
   layers above cover that. Never delete the cake-day-gifts page; it is my product's sales
   page.

**Safety, non-negotiable:** log every change (post ID, field, old value, new value) to a
change-log file and commit it to the branch as you go — that log is the rollback map. The
AIOSEO redirect import REPLACES the whole redirect table: export existing redirects first,
merge, import `redirects/MERGED-all-redirects.csv` once, exactly as the brief describes.
Purge caches after every batch. My site has daily host backups; confirm today's exists in the
Rocket.net panel before the redirect import step.

**Do not re-fix the known false positive:** 4,440 posts have no custom AIOSEO title — that is
fine, AIOSEO's fallback renders correct titles (verified live). Only the 278 over-long custom
titles need work.

**When the work is done, before I run the Seobility re-crawl, produce a final report for me
containing all of the following, in plain language:**

1. **Completed** — every fix done, per phase, with counts (e.g. "298 missing meta
   descriptions written, verified 0 remaining").
2. **Not completed and why** — anything blocked, skipped, or partially done, each with the
   specific reason.
3. **Deviations** — every place you did something differently from the brief or the plan,
   what you did instead, and why. An empty deviations section must mean there were literally
   none, not that you didn't track them.
4. **Decisions still owed by me** — restate anything from §2 I haven't answered, and what is
   waiting on each.
5. **Review-gate log** — each phase's independent review result, including anything rejected
   and how it was fixed.
6. **Expected residual findings** — the list from the brief's §0 (WhatsApp links, the
   site-wide CTA, external .gov.ae links, cache-dependent response times) restated, so I read
   the re-crawl correctly and don't mistake noise for failure.
7. **Where the change-log lives** — the file path and branch, so anything can be traced or
   reversed later.

Then tell me it's time to run the re-crawl, and stop.
