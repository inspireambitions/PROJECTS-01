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
