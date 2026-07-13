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
