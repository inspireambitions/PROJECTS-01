# Brief 02 — The share loop (result cards, WhatsApp-first, benchmarks, Arabic)

**Priority:** 2. Risk-calculator tools grow on "I got 73% 😱" screenshots. No competitor —
including WillRobotsTakeMyJob — has a real share loop. Whoever builds one first converts every
result into an acquisition channel.

## 2.1 Shareable result cards

- After analysis, generate a **branded result card**: role, Risk dial, Protection dial,
  Displacement range ("~2031 (2029–2034)"), top risky + top safe task, and the tagline
  *"AI replaces tasks, not jobs — calculator.inspireambitions.com"*.
- **Share URL:** `/r/[id]` — a server-stored anonymous result snapshot (score data only, no
  identity; ~90-day TTL). The page renders the card + "Get YOUR score" CTA + the calculator.
  This page is the viral landing surface — treat it with landing-page care.
- **Per-result OG image** via dynamic OG generation (`@vercel/og` / ImageResponse) so the card
  renders rich in WhatsApp, LinkedIn, X, iMessage previews. This is the actual growth mechanic —
  most shares are link pastes, not downloads.
- Buttons: **WhatsApp first** (this audience's real channel), then LinkedIn, X, copy-link, and
  download-as-image (mobile long-press friendly).

## 2.2 Benchmark line

- On the result: *"You're safer than 68% of Marketing Managers in the UAE."*
- Computed from anonymized aggregates (new `result_stats` storage — score, occupation slug,
  country, timestamp; NOTHING else). Cold-start: until an occupation×country cell has n ≥ 30,
  fall back to occupation-global or suppress the line — never fake it.
- **Prerequisite:** the privacy copy change from the master plan ships in the same deploy.
- The benchmark line goes ON the share card once available — it's the most screenshot-able
  sentence in the product.

## 2.3 Arabic results (blue ocean)

- There is no Arabic AI-job-risk calculator anywhere. Ship an `ar` locale for the result +
  share surfaces first (highest share value), then the form.
- Requirements piggyback on the CV builder work: logical-properties CSS, RTL root, self-hosted
  Arabic font subset, bidi-safe number rendering (scores/years stay Latin digits inside RTL
  text unless full Eastern Arabic numerals are chosen — pick one, apply consistently).
- Share card generator must render the Arabic variant (RTL layout mirrored, correct font in the
  OG image renderer — test this explicitly; @vercel/og needs the font loaded manually).

## 2.4 The example-result section becomes live social proof

- Replace the static "Marketing Manager, Dubai" example with a rotating set of real anonymized
  recent results ("Analysed 3 minutes ago: Accountant, Riyadh — 61% risk") once aggregates
  exist. Fallback to the static example when volume is low. Social proof + freshness signal in
  one move.

## Acceptance criteria

- [ ] Result card generates for every analysis; `/r/[id]` renders card + CTA; snapshots are
      anonymous and expire (~90 days)
- [ ] OG image correct in WhatsApp + LinkedIn preview debuggers for EN and AR cards
- [ ] WhatsApp share is the first/primary button on mobile; download-as-image works on iOS Safari
- [ ] Benchmark line appears only at n ≥ 30 with the correct comparison cohort; suppressed
      cleanly below threshold; privacy copy updated in the same release
- [ ] Full result flow works in Arabic RTL with no layout breakage; numerals policy consistent
- [ ] PostHog: `result_shared` (channel, locale), `share_landing_view`, `share_landing_converted`

## Codex handoff prompt

> Implement the share loop per this brief: branded result cards with dynamic OG images
> (@vercel/og, EN + RTL Arabic variants with manually loaded font subsets), anonymous /r/[id]
> result snapshots with TTL, WhatsApp-first share row with copy-link and image download,
> benchmark line from a new anonymized result_stats aggregate (n ≥ 30 threshold with
> occupation-global fallback and clean suppression), the updated privacy copy, and the rotating
> live-example module with static fallback. Reuse the design tokens and performance budgets from
> cv-battleplan/06. Test OG rendering in WhatsApp/LinkedIn debuggers for both locales.
