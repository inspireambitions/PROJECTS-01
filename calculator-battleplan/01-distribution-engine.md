# Brief 01 — Distribution engine (programmatic SEO + credibility infrastructure)

**Priority:** 1. WillRobotsTakeMyJob's only real moat is ~700 occupation pages owning every
"will robots take my job [title]" SERP. Our engine is better; our site is one page. This brief
builds the roads.

## 1.1 Programmatic occupation × region pages

- **Routes:** `/jobs/[occupation]` and `/jobs/[occupation]/[region]`
  (e.g. `/jobs/hr-manager`, `/jobs/hr-manager/uae`, `/jobs/accountant/dubai`).
- **Launch set:** 60 occupations × 6 GCC regions + global = ~420 pages, statically generated.
  Occupation list: the roles with real search volume AND relevance to the InspireAmbitions
  audience (start from the CV builder's 8 sectors — construction, hospitality, healthcare,
  banking, aviation, IT, logistics, executive — plus office/admin roles, which have the highest
  AI-risk search intent).
- **Each page contains (pre-rendered, unique, not thin):**
  - The typical task profile for that role (8–12 tasks from a curated data file — this is our
    task engine's content advantage; WRTMJ shows a bare probability),
  - a pre-computed sample Risk/Protection/Displacement result with per-task bars,
  - region context paragraph (adoption pace, regulatory notes — 2–3 sentences per region,
    written once per region and blended per occupation),
  - the live calculator form pre-seeded with those tasks ("these aren't your tasks? edit them"),
  - internal links: 5 related occupations, the region hub, the CV builder
    ("future-proof your CV — free").
- **Content quality gate:** every page must pass a "would a human bookmark this?" bar — no
  boilerplate paragraphs repeated across all 420 pages with only the title swapped (that's a
  Google spam-update casualty pattern). Occupation task profiles and risk commentary come from
  a reviewed data file (`occupations.json`), not free-running LLM output at build time.

## 1.2 Structured data & technical SEO

- JSON-LD on every page: `FAQPage` (the FAQ content already exists on-page but has no schema),
  `WebApplication` for the tool, `BreadcrumbList` on occupation pages.
- XML sitemap, per-page canonical, per-page OG images (occupation + sample score baked in —
  reuse brief 02's OG image generator).
- Internal-link architecture: home → sector hubs → occupation pages → region variants.

## 1.3 Methodology page (`/methodology`)

The load-bearing credibility asset — required before any press/Index work:
- How task scores are derived (technical capability × economic incentive × regulatory friction —
  the three factors already described on the homepage, expanded with the WEF/Goldman/McKinsey/
  Oxford citations as real links, not name-drops).
- How the Displacement Year is computed and **why it's a range** — show "~2031 (2029–2034)"
  format here and everywhere scores render.
- Honest limitations section (what task-level analysis can't know). Honesty is the brand;
  it also pre-empts the Frey & Osborne-style academic takedown.
- If the Yahoo Finance coverage is confirmed as ours: an "As featured in" strip here + homepage.

## 1.4 Embeddable widget

- `/embed` route: compact calculator (title + tasks + score) in an iframe-safe layout,
  `powered by InspireAmbitions` backlink. One-line embed snippet on a `/widget` marketing page
  pitched at career coaches, universities, and news sites. This is how Omni Calculator built its
  network — backlinks compound like the SEO pages do.
- Keep the existing permissive frame headers for this route only; the main app should set
  sensible `frame-ancestors` instead of the current `ALLOWALL`.

## Acceptance criteria

- [ ] ~420 pages statically generated from `occupations.json` + `regions.json`; build fails on
      missing/duplicate slugs; no page renders with an empty task profile
- [ ] Form on occupation pages arrives pre-seeded with that page's tasks and is fully editable
- [ ] FAQPage/WebApplication/BreadcrumbList JSON-LD validates (Rich Results test)
- [ ] Sitemap lists all pages; Search Console verified; Lighthouse SEO ≥ 95 on samples
- [ ] `/methodology` live, every citation an actual link, ranges shown wherever a year renders
- [ ] Embed renders in a third-party test page; main app no longer serves `ALLOWALL`
- [ ] PostHog `seo_page_view` firing with occupation/region props (GA dual-run until brief 04)

## Codex handoff prompt

> Read the existing calculator codebase and this brief. Build the programmatic SEO layer:
> statically generated /jobs/[occupation] and /jobs/[occupation]/[region] pages driven by
> reviewed occupations.json + regions.json data files (60 occupations, GCC regions per spec),
> each with unique task profiles, pre-computed sample results, pre-seeded editable calculator
> form, and internal links; JSON-LD (FAQPage, WebApplication, BreadcrumbList), sitemap,
> canonicals; a /methodology page with linked citations and range-formatted Displacement Years
> applied product-wide; and an iframe-safe /embed route with backlink while tightening
> frame-ancestors on the main app. Seed occupations.json for the 60 launch roles with 8–12
> tasks each, clearly marked for Kim's HR review before launch.
