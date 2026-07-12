# CODEX BUILD INSTRUCTIONS — Distribution Battle Plan (consolidated)

> Single-file handoff: master plan + 5 briefs in build order (01 → 05). Covers every
> InspireAmbitions property EXCEPT jobstrike.ae (deferred). cv-battleplan/ and
> calculator-battleplan/ contain those tools' own distribution builds — do not duplicate.
> Shared quality bar: cv-battleplan/06. Items marked [WP] are WordPress tasks for
> Kim/WPVibe, not code tasks.

---

# Distribution Battle Plan — Master Document ("The Traffic Network")

**Scope:** every InspireAmbitions property EXCEPT jobstrike.ae (explicitly deferred by Kim).
**Date:** July 2026
**Relationship to other plans:** `cv-battleplan/` and `calculator-battleplan/` already contain
deep distribution builds for those two tools. This plan covers everything else PLUS the network
layer that connects all properties. `cv-battleplan/06` remains the shared design/performance bar.

---

## 1. The strategy: from portfolio of dead ends to a traffic network

**Audit finding:** eight properties, one working acquisition channel (main-site SEO), zero
connective tissue. Each tool currently ends a visit; nothing hands the visitor to the next tool
or captures an email. Two CV builders compete with each other. The blog handicaps itself with
`?p=` URLs. The tools hub sits on gold (gratuity calculator) with no SEO surface.

**The model — every property must do all three jobs:**
1. **ACQUIRE** — own at least one search/social entry point it can win (its "lottery ticket").
2. **CONVERT** — capture email at one honest, optional point (all lists in Resend).
3. **CIRCULATE** — hand the visitor to the logical next tool via contextual CTAs + the shared
   network strip. No page anywhere may have zero onward internal links.

**Traffic math this unlocks:** the main site already ranks; the tools already exist. Cross-linking
alone multiplies effective distribution (one ranking page now feeds 6 properties). Programmatic
pages (gratuity, occupations, salary) create hundreds of lottery tickets in queries with huge UAE
volume and weak competition. Share cards turn WhatsApp — the region's real network — into a
channel no analytics-blind competitor is using.

## 2. The briefs (build order)

| # | Brief | Property | Core play | Effort |
|---|---|---|---|---|
| 1 | `01-network-shell.md` | ALL | Shared cross-link strip, resume.→cv. consolidation, unified PostHog, SEO hygiene | ~1 wk |
| 2 | `02-tools-hub.md` | tools.inspireambitions.com | Gratuity calculator SEO empire + micro-tool factory | ~2 wks |
| 3 | `03-decision-tool.md` | "Should I Take This Dubai Job?" | Shareable verdict + salary-question SEO pages | ~1 wk |
| 4 | `04-content-engine.md` | inspireambitions.com + blog | Permalink fix, topic clusters, wrapper→landing upgrades | ~1 wk + ongoing |
| 5 | `05-newsletter-flywheel.md` | Hospitality Memo (Resend) | Inlets everywhere, tool-of-the-week loop, referral | ~1 wk |

CV builder and calculator distribution: already fully specced in their own plans — do not
duplicate; brief 01's network strip and analytics apply to them too.

## 3. Ground rules (inherited + new)

- Fully free everywhere; email capture only at the points each brief names; capture copy always
  honest, always skippable.
- **WordPress vs code split:** main site + blog are WordPress — those tasks are marked
  `[WP]` (Kim or WPVibe executes). Everything else is Next.js/Vercel — marked `[CODE]` (Codex).
- Every new page ships with: canonical URL, JSON-LD where applicable, OG image, the network
  strip, at least 3 contextual internal links, and PostHog events.
- Subdomain policy (decided): keep existing subdomains (moving now would burn indexed equity)
  but interlink aggressively and maintain one shared sitemap index page on the main site
  linking every property's sitemap.

## 4. Network KPIs (PostHog, unified in brief 01)

| Metric | 90-day target |
|---|---|
| Cross-property navigation events (`network_strip_clicked`) | ≥ 8% of sessions |
| Sessions landing on programmatic pages (gratuity/occupation/salary) | 10,000+/mo |
| Email captures across all inlets | 3,000+ combined |
| Share-card events across tools | ≥ 10% of tool completions |
| Properties with zero-dead-end audit passing | 8/8 |

## 5. Definition of done

Every brief's acceptance boxes checked, plus the network audit: crawl every property; any page
with no onward internal link, no capture point in its flow, or missing the network strip fails.

---

# Brief 01 — The Network Shell (connect everything, kill the duplicate, unify analytics)

**Priority:** 1 — cheapest, highest leverage. Turns one working SEO channel into distribution
for the whole portfolio.

## 1.1 Shared cross-link strip `[CODE + WP]`

- A compact, consistent component rendered on **every** property (header link or footer band):
  *"Free GCC career tools: CV Builder · AI Job Risk Calculator · Gratuity Calculator ·
  Job Decision Tool · Guides"* — plain HTML links (crawlable, no JS-only nav), current property
  de-emphasized, UTM-free but PostHog-tracked (`network_strip_clicked` with from/to props).
- Implementation: a tiny shared package or copied component for the Next.js apps
  (cv, calculator, tools if Next.js); a footer widget/menu for WordPress properties `[WP]`.
- **Contextual CTAs beat the strip** — the strip is the floor, not the ceiling. Each brief
  defines its tool-specific "next step" CTAs; the strip guarantees no page is ever a dead end
  even where contextual CTAs don't fit.

## 1.2 Kill the duplicate builder `[CODE]`

- **Decision (final): cv.inspireambitions.com is the one CV builder.**
  resume.inspireambitions.com is deprecated:
  1. Inventory its indexed URLs (`site:resume.inspireambitions.com`, Search Console).
  2. 301 every URL to the closest equivalent on cv. (templates page → cv.'s templates section;
     unknown paths → cv. homepage).
  3. Keep redirects permanently (domain mapping stays on Vercel); remove the app.
  4. Update every internal link and any main-site wrapper page pointing at resume.*.
- Anything unique on resume.* (a template, copy that ranks) migrates INTO cv. first.

## 1.3 Unified analytics `[CODE + WP]`

- PostHog (org "Job Strike") on **all** properties with a shared property: `product` =
  cv-builder | calculator | tools-hub | decision-tool | main-site | blog.
- Cross-domain session stitching where PostHog supports it; GA properties dual-run 30 days
  then retire (except any GA the WP site needs for legacy reasons — Kim's call `[WP]`).
- One dashboard: entries by property → cross-navigation flows → capture events. This makes the
  "traffic network" measurable for the first time.

## 1.4 SEO hygiene sweep `[CODE + WP]`

- Every property: verified in Search Console, sitemap submitted, robots sane, canonical
  correct, one `<h1>`, OG image present.
- Main site gets `/network` (or footer block) linking every property — a crawlable hub page
  passing authority outward (the "sitemap index" of the portfolio).
- Blog permalink fix is specced in brief 04 (it's `[WP]` work but listed here as a dependency:
  do it before building blog internal links).

## Acceptance criteria

- [ ] Network strip live on cv, calculator, tools hub, main site, blog; links crawlable; events fire
- [ ] resume.* fully 301'd; Search Console shows redirects processed; zero internal links to it remain
- [ ] PostHog reporting sessions from all properties with correct `product` prop; cross-nav flow visible
- [ ] All properties verified in Search Console with submitted sitemaps
- [ ] Zero-dead-end crawl passes: no page without onward internal links

## Codex handoff prompt

> Implement per this brief across the Next.js properties: the shared network-strip component
> (crawlable links, PostHog network_strip_clicked events, current-property de-emphasis) added to
> cv-builder, calculator, and tools-hub apps; full 301 mapping from resume.inspireambitions.com
> URLs to cv.inspireambitions.com equivalents with the old app retired; PostHog snippets with the
> shared `product` property on all code properties. Produce a checklist file of the `[WP]` items
> (WordPress strip widget, GA decision, permalink dependency) for Kim to execute manually or via
> WPVibe. Finish with a crawler script that fails on any page lacking onward internal links.

---

# Brief 02 — Tools Hub (tools.inspireambitions.com): the gratuity SEO empire + micro-tool factory

**Priority:** 2 — this property sits on the single biggest untapped search opportunity in the
portfolio and currently has one indexed page.

## 2.1 The crown jewel: UAE Gratuity Calculator

"Gratuity calculator UAE" and its long tail (per contract type, per emirate, per scenario) are
huge, evergreen, transactional-intent queries currently won by Bayt, Zoho, and content farms —
none of which have Kim's HR authority or a modern tool.

- **The tool `[CODE]`:** rebuild/polish the gratuity calculator to brief-06 standards: mobile-
  first, instant results, clear breakdown of the calculation (basic salary × years × 21/30-day
  rule), limited vs. unlimited contract handling, resignation vs. termination scenarios, 2026
  labor-law rules with a "last verified" date and source links (MOHRE). Accuracy + citations =
  the moat; every competitor's calculator is a black box.
- **Programmatic pages `[CODE]`:** `/gratuity/[scenario]` — e.g. "gratuity for 5 years
  unlimited contract", "gratuity if you resign before 1 year", per-emirate and free-zone
  variants (DIFC/ADGM have different schemes — flag for Kim's verification). ~40–60 pages, each
  with the calculator pre-configured, worked example, FAQ + `FAQPage` schema.
- **Share card `[CODE]`:** "My end-of-service: AED 34,500" branded card, WhatsApp-first —
  gratuity results get discussed in worker communities; make the screenshot official.
- **Capture:** optional "email me this breakdown (PDF)" → Resend `tools-leads`.
- **Circulate:** result screen CTAs — leaving a job? → Decision Tool; updating your CV for the
  next one? → CV Builder.

## 2.2 The JD Generator: the employer-side door

The only tool in the portfolio that attracts EMPLOYERS/HR — strategically valuable (future
JobStrike customers) even with modest volume.
- `[CODE]` Polish to standard; programmatic `/job-description/[role]` pages (reuse the 60-role
  `occupations.json` from calculator-battleplan/01 — one data file, two products).
- Capture: "email me this JD (Word)" → Resend `employer-leads` (a NEW, separately valuable list).
- Circulate: "hiring? candidates use our CV builder" + soft JobStrike mention when Kim green-lights.

## 2.3 The micro-tool factory (the "lottery ticket" machine)

Formula proven by the gratuity play: **high-volume UAE query + simple calculator + share card +
programmatic long-tail pages.** Build next, in order:
1. **Salary calculator / take-home** ("salary calculator UAE" — huge volume; UAE has no income
   tax, so the tool reframes to cost-of-living vs. savings potential — more useful, more shareable).
2. **Notice-period checker** (resignation rules by contract type — pairs with gratuity).
3. **Job-seeker visa cost calculator** (rides the visa-content wave; links to JobStrike later).
Each ships only with: the calculator + 10–20 programmatic pages + share card + capture + circulate
CTAs. No orphan tools — that's how the current dead-end portfolio happened.

## 2.4 Hub page `[CODE]`

tools.inspireambitions.com homepage becomes a proper directory: every tool with one-line value
prop, grouped (For job seekers / For employers), each linking onward. `ItemList` schema.

## Acceptance criteria

- [ ] Gratuity calculator meets brief-06 budgets; calculation verified by Kim against MOHRE
      rules; "last verified" date + sources rendered
- [ ] 40+ gratuity scenario pages live with pre-configured calculator, worked example, FAQ schema
- [ ] Gratuity + salary share cards render (WhatsApp OG-image test passes)
- [ ] JD generator live with role pages from the shared occupations.json; employer-leads capture works
- [ ] Every tool result screen has ≥ 2 contextual circulate CTAs + the network strip
- [ ] PostHog: `tool_used` (tool, scenario), `tool_shared`, `tool_email_captured` (list)

## Codex handoff prompt

> Audit the existing tools-hub codebase first (confirm framework/hosting — it was not found in
> the Vercel team; if it lives elsewhere, plan a migration to a Next.js app on Vercel as step 0
> and flag DNS cutover for Kim). Then implement per this brief: the gratuity calculator rebuilt
> to cv-battleplan/06 standards with scenario-programmatic pages, share cards, PDF-email capture
> into Resend tools-leads; the JD generator with role pages from calculator-battleplan's
> occupations.json and employer-leads capture; the salary and notice-period micro-tools by the
> same formula; and the hub directory page with ItemList schema. All gratuity/labor-law logic in
> a reviewed rules file marked for Kim's verification before launch — legal accuracy is the moat.

---

# Brief 03 — "Should I Take This Dubai Job?" Decision Tool: from quiz to viral verdict

**Priority:** 3. Already ranks (the wrapper page holds a top spot for its own query) — but the
tool produces a private answer and stops. Decisions are the most shareable, most discussed moment
in a job search ("should I take it? 🤔" is literally what people ask their groups on WhatsApp).

## 3.1 Locate & standardize `[CODE/WP — investigate first]`

- The tool currently lives on the WordPress page `/should-i-take-this-dubai-job/`. Step 0:
  determine how it's implemented (embedded app vs. WP plugin). If it's not already a deployable
  app, rebuild it as a small Next.js app at **decide.inspireambitions.com** (network policy:
  each tool a first-class property), keeping the WP page as an SEO wrapper that embeds/links it —
  the wrapper's existing ranking is an asset, don't break it.

## 3.2 The verdict card (the share loop)

- Output today is presumably a private recommendation. Give it a **shareable verdict card**:
  "Offer Score: 71/100 — Take it, but negotiate housing" with the 3 strongest factors, WhatsApp-
  first share row, anonymous `/v/[id]` snapshot landing page ("Get your own verdict") — the
  exact mechanics of calculator-battleplan/02, reused.
- **Poll hook:** after sharing, "ask your people" mode — recipients tap Take it / Don't — the
  sharer gets a tally. Cheap to build, engineered for group chats, and every vote is a new visitor.

## 3.3 The salary-question SEO layer (the lottery tickets)

The queries this tool can own are endless and high-intent:
- `/is-[salary]-enough-in-dubai` — "is 8000 AED enough in Dubai", "is 15k a good salary in
  Dubai" (massive, evergreen query family currently answered by Reddit threads and expat forums).
  ~30 salary-band pages, each with cost-of-living breakdown by lifestyle (single/sharing/family),
  a verdict, and the decision tool pre-seeded with that salary.
- `/offer-check/[role]` — "good salary for accountant in Dubai" family, reusing occupations.json
  salary bands (Kim reviews the bands — her HR data beats any competitor's guesswork).
- Every page: FAQ schema, worked example, capture ("email me the full breakdown"), circulate
  CTAs (negotiating? → guides; taking it? → CV builder for the visa paperwork bundle; not sure
  about the career itself? → AI Risk Calculator).

## 3.4 Tie into the suite

- Decision tool inputs (offer salary, role, current situation) make its CTAs the most
  contextual in the portfolio: low offer score → "keep looking" → CV Builder + (later) JobStrike;
  high score → "take it with confidence" → gratuity calculator ("know your end-of-service from
  day one") + newsletter.

## Acceptance criteria

- [ ] Tool runs as a first-class app meeting brief-06 budgets; WP wrapper page preserved and
      still ranking (301s only if URLs must change, with Kim's sign-off)
- [ ] Verdict card + /v/[id] landing + WhatsApp share + poll mode live; OG images correct
- [ ] 30+ salary-band pages and role offer-check pages live, pre-seeded, with FAQ schema;
      salary bands reviewed by Kim
- [ ] Score-contextual circulate CTAs on every verdict; capture point live → Resend
- [ ] PostHog: `verdict_generated` (score_band), `verdict_shared`, `poll_vote`, `salary_page_view`

## Codex handoff prompt

> First investigate how the existing "Should I Take This Dubai Job?" tool is implemented and
> report before building. Then per this brief: stand it up as a Next.js app (decide subdomain)
> without breaking the ranking WordPress wrapper; implement the verdict share card with
> anonymous snapshot landing and the ask-your-people poll mode (reuse calculator-battleplan/02
> mechanics); build the /is-[salary]-enough-in-dubai and /offer-check/[role] programmatic layers
> from a salary-bands data file marked for Kim's review; wire score-contextual circulate CTAs,
> the email capture, the network strip, and all PostHog events.

---

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

---

# Brief 05 — Newsletter Flywheel (Hospitality Memo → the InspireAmbitions list engine)

**Priority:** 5 (needs briefs 1–4's inlets live to matter, but cheap — mostly Resend config +
one component).

## 5.1 One engine, segmented lists

By the time briefs 1–4 ship, five Resend audiences exist: Hospitality Memo (existing),
`cv-builder-leads`, `calculator-leads`, `tools-leads`, `employer-leads` (+ decision-tool
captures). Rules:
- **Never merge them silently.** Each signed up for something specific; honor it. One shared
  footer identity ("from InspireAmbitions — built by a Gulf HR specialist") + easy cross-opt-in:
  every email footer offers the weekly memo with one tap.
- The **weekly memo** becomes the portfolio's drumbeat: one insight from Kim + **one featured
  tool with a real use case** ("Reader question: 4 years on unlimited contract, resigning — here's
  the gratuity math" → calculator link). Every tool gets featured monthly — the circulate loop,
  in email form.
- Welcome sequences per list (reuse `resend-newsletter-ops/` patterns in this repo): deliver the
  promised asset, then one email introducing the two most adjacent tools. No daily bombardment —
  weekly max, consistent with the honest-brand rules.

## 5.2 Inlets everywhere `[CODE + WP]`

- A single reusable subscribe component (same design tokens): blog posts (mid + end), tool
  result screens (secondary to the tool's own capture), main-site footer, the /network hub page.
  Copy varies by surface but always names the value: "One practical Gulf career insight a week.
  From a real HR specialist. Unsubscribe in one tap."
- Double opt-in per UAE PDPL norms for pure-newsletter signups (tool-capture flows already
  specced their own consent handling — don't double-ask).

## 5.3 The referral loop

- Simple, no-prize referral: every memo footer — "Forward this to someone job-hunting in the
  Gulf. They can get their own copy here." + a `?ref=memo` link so PostHog attributes forwards.
  Skip incentivized referral mechanics for now (prize-driven referral attracts dead emails;
  the list's value is intent, not size).

## 5.4 Measurement

- Resend webhooks → a small events endpoint → PostHog: `email_delivered/opened/clicked`
  (per list, per campaign) so email joins the same funnel dashboard as everything else.
- North-star: **email → tool → share/next-tool** loops per campaign, not open rates.

## Acceptance criteria

- [ ] Subscribe component live on blog, main site, /network, and ≥ 2 tool result screens
- [ ] Weekly memo template includes the featured-tool block; first 4 features scheduled with Kim
- [ ] Welcome sequences configured per audience; cross-opt-in footer in all templates
- [ ] Double opt-in verified for newsletter-only signups; unsubscribe honored across audiences
- [ ] Resend webhook → PostHog pipeline live; email events visible in the network dashboard
- [ ] Referral footer live with ref attribution

## Codex handoff prompt

> Implement per this brief: the reusable subscribe component (design tokens from
> cv-battleplan/06) deployed across the code properties plus a paste-ready WP block; Resend
> audience structure with per-list welcome sequences following the patterns in
> resend-newsletter-ops/ (READ its CLAUDE.md first — live changes to the existing Hospitality
> Memo sequence require Kim's explicit wording approval); the weekly memo template with
> featured-tool block and referral footer; and the Resend-webhook→PostHog events endpoint.
> Do not send anything to the existing list without Kim's sign-off.

