# Brief 04 — Content Engine (inspireambitions.com + blog): the hub that feeds everything

**Priority:** 4 (mostly `[WP]` work — parallelizable with the code briefs).
The main site is the portfolio's only working acquisition channel today. This brief upgrades it
from "ranks and stops" to "ranks and routes".

## 4.1 Blog surgery `[WP]`

- **Permalinks:** switch from `?p=46` to `/post-name/`; WordPress auto-redirects, but verify
  301s on the top 20 indexed posts. Do this FIRST — everything else builds links on top.
- Merge decision: `blog.inspireambitions.com` vs main-site posts — pick ONE canonical home for
  articles (recommendation: main site `/blog/` for consolidated authority; if migration is too
  heavy now, keep the subdomain but interlink hard and set it in Search Console). Kim decides;
  don't leave it ambiguous.
- Every post gets: author box (Kim's credentials — E-E-A-T is her unfair advantage), a
  contextual tool CTA matched to topic (CV article → CV builder; salary article → decision tool;
  end-of-service article → gratuity calculator), newsletter block, network strip.

## 4.2 Wrapper pages → true landing pages `[WP]`

The pages that already rank (`/dubai-cv-builder/`, `/ai-job-replacement-calculator/`,
`/should-i-take-this-dubai-job/`) are the portfolio's most valuable URLs. Upgrade each:
- Above the fold: what the tool does, one screenshot/demo, one button INTO the tool
  (subdomain), trust line ("free, no card, built by a Gulf HR specialist").
- Below: the SEO meat (how it works, FAQ + schema, testimonials as they accumulate), links to
  sibling tools.
- Add missing wrappers: gratuity calculator and salary tool get main-site wrapper pages too —
  the pattern already proves it ranks.

## 4.3 Topic clusters (the editorial roadmap) `[WP — Kim writes/commissions]`

Four clusters, each anchored on a tool (the cluster exists to feed it):
1. **End of service & leaving well** → gratuity calculator (notice periods, final settlement,
   non-competes, visa cancellation timelines).
2. **CV & getting shortlisted in the Gulf** → CV builder (per-sector CV guides matching the 8
   templates, ATS myths in GCC, photo/no-photo, visa-status-on-CV).
3. **Salary & offers** → decision tool (salary guides per role — reuse the salary-bands data,
   negotiation scripts for UAE, benefits decoding: housing/education/flights).
4. **AI & your career** → risk calculator (task automation by industry, "AI-proof skills for
   [sector]", augmentation stories).
Cadence: 2 posts/cluster/month minimum. Every post links to its anchor tool + 2 siblings.

## 4.4 Distribution beyond Google `[WP + Kim]`

- Every article gets a WhatsApp-shareable summary card (plugin or simple OG discipline).
- Kim's LinkedIn: each post republished as a LinkedIn article/carousel with the tool link —
  her personal authority is the portfolio's cheapest paid-media substitute.
- The calculator's quarterly GCC AI Risk Index (calculator-battleplan/04) gets its press page
  ON the main site — press authority accrues to the hub.

## Acceptance criteria

- [ ] Pretty permalinks live; top-20 old URLs verified 301
- [ ] Canonical blog home decided and configured; Search Console reflects it
- [ ] All 3 existing wrapper pages upgraded to the landing-page pattern; gratuity + salary
      wrappers added
- [ ] Author box, matched tool CTA, newsletter block, network strip on every post (spot-check 10)
- [ ] Cluster roadmap doc created with first month's titles per cluster (Kim approves)
- [ ] PostHog on WP properties firing `content_view` (cluster) and `content_to_tool_click` (tool)

## Codex handoff prompt

> This brief is mostly WordPress work. Produce: (1) a step-by-step `[WP]` runbook for Kim/WPVibe
> covering permalink migration with 301 verification, the wrapper→landing page template (HTML
> blocks ready to paste), author box, newsletter block, and PostHog snippet for WP; (2) the
> cluster roadmap file with 8 proposed post titles per cluster mapped to anchor tools and
> internal-link targets; (3) where WPVibe MCP access permits, implement the template changes
> directly as drafts for Kim's approval — never publish live without her sign-off.
