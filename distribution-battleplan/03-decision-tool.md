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
