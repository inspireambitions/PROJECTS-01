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

## 2.2b STAR Interview Question Generator (confirmed on the hub, previously unplanned)

Serves BOTH sides: hiring teams (employer-leads, like the JD generator) and candidates prepping
for interviews (job-seeker side). Distribution formula:
- `[CODE]` Programmatic `/interview-questions/[role]` pages from the shared `occupations.json` —
  "interview questions for restaurant manager in Dubai" queries are high-intent and weakly
  contested; include the GCC-context questions and the "questions to avoid" angle (that's the
  differentiator no generic generator has).
- Capture: "email me this question set (PDF)" → audience by declared side (employer-leads /
  the candidate list). Circulate: candidates → CV builder ("get the interview first") + decision
  tool; employers → JD generator.

## 2.2c Career Path Tool (⚠️ unverified — confirm with Kim before building)

Kim reports a career-path tool exists; it does NOT appear in search on any property and was not
findable during the audit — meaning whatever it is, Google can't see it either. Step 0 for
Codex: **get the URL/implementation from Kim**, then apply the standard formula:
- If it's an interactive tool: first-class page (or app) with its own indexable URL, then
  programmatic `/career-path/[role]` pages ("career path for a hotel receptionist in the UAE" —
  the blog already has ranking career-path *articles* to interlink), a shareable "my 12-month
  roadmap" card, capture ("email me my roadmap"), and circulate CTAs (roadmap step 1 is almost
  always "upgrade the CV" → CV builder; risk-check the target role → AI Risk Calculator).
- If it's currently a framework/quiz inside the coaching pages: productize it as the micro-tool
  factory's next build — it's the natural anchor for the blog's existing "Career Planning &
  Roadmaps" category and for Kim's 5Es Career Capital framework (a branded, ownable methodology
  no competitor can copy).

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
- [ ] STAR generator live with /interview-questions/[role] pages; capture routes by declared side
- [ ] Career path tool located (URL confirmed with Kim), made indexable, and shipped with the
      standard formula (own pages, share card, capture, circulate) or explicitly scheduled as a
      new build
- [ ] Every tool result screen has ≥ 2 contextual circulate CTAs + the network strip
- [ ] PostHog: `tool_used` (tool, scenario), `tool_shared`, `tool_email_captured` (list)

## Codex handoff prompt

> Audit the existing tools-hub codebase first (confirm framework/hosting — it was not found in
> the Vercel team; if it lives elsewhere, plan a migration to a Next.js app on Vercel as step 0
> and flag DNS cutover for Kim). Then implement per this brief: the gratuity calculator rebuilt
> to cv-battleplan/06 standards with scenario-programmatic pages, share cards, PDF-email capture
> into Resend tools-leads; the JD generator with role pages from calculator-battleplan's
> occupations.json and employer-leads capture; the STAR interview-question generator with
> /interview-questions/[role] pages and side-routed capture; the career path tool — get its URL
> and current implementation from Kim FIRST (it was unfindable in search), then make it
> indexable and apply the standard formula, or scope it as a new micro-tool if it is not yet
> interactive; the salary and notice-period micro-tools by the same formula; and the hub
> directory page with ItemList schema. All gratuity/labor-law logic in
> a reviewed rules file marked for Kim's verification before launch — legal accuracy is the moat.
