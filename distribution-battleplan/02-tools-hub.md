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
