# Brief 03 — From diagnosis to action (protection plan, ecosystem bridges, email report)

**Priority:** 3. Today the result is a dead end: we generate anxiety and hand it to Google.
Every competitor either does the same (WRTMJ) or funnels it into a self-serving pitch
(TripleTen's "join our bootcamp"). We convert it into the user's next step — inside our own
ecosystem, honestly.

## 3.1 Protection plan (per-task prescriptions)

- For each task scoring ≥ 60% risk, render a prescription: the adjacent skill that neutralizes
  it, an "automate it yourself first" suggestion where applicable, and a realistic horizon.
  Generated in the same LLM analysis call (extend the response schema — no second round-trip),
  grounded by a reviewed prescription library per task category so output stays specific, not
  "learn AI skills" mush.
- Rendered as a "Your protection plan" section under the scores; included in the PDF report (3.4).

## 3.2 Augmentation score (reframe fear → advantage)

- Add a per-task second dimension: **replaces you vs. multiplies you**. Tasks where AI is a
  force-multiplier get a green "leverage" badge: "AI makes you ~3× faster here — adopters gain."
- Surface an overall **Leverage Score** next to Risk and Protection. Three dials, not two —
  and the only calculator on the market with an optimistic, actionable axis. Goes on the share
  card (brief 02) once shipped.

## 3.3 Ecosystem bridges (the unfair advantage — nobody else owns both sides)

1. **Task → CV handoff (highest value).** The user already typed their real daily tasks — that's
   CV raw material we collected. Results CTA: *"Turn these tasks into achievement bullets on a
   future-proof CV — free."* Pass tasks + role + country to the CV builder via a signed handoff
   payload (URL fragment or short-lived server token — user-initiated, no accounts), landing in
   the builder with experience bullets pre-drafted. Coordinate the receiving side with
   `cv-battleplan` (add to its backlog as a small brief-01-adjacent task).
2. **Safer roles hiring now.** For high-risk results (score ≥ 60), query the JobStrike `jobs`
   table (Supabase `txnkaztivqvqppyeedwm`, read-only API route) for 3 live lower-risk vacancies
   matching the user's country/sector: *"Roles hiring in the UAE with lower AI risk."*
   Risk-tag jobs at batch time using the occupation risk data from brief 01's `occupations.json`.
   No consumer tool on earth does this today.
3. **Compare two jobs.** "Comparing an offer?" mode: run two roles side by side (risk deltas per
   axis), cross-linking the existing "Should I Take This Dubai Job?" tool. Cheap — it's the same
   engine run twice with a comparison layout.
- CTA placement discipline: bridges render AFTER the full result, contextual to score band
  (high risk → CV + safer roles; low risk → leverage framing + CV polish). Never interrupt the
  reveal moment.

## 3.4 Email report (the only capture point, optional, never gating)

- After results render fully: *"Email me my full report (PDF)"* — the on-screen result is never
  gated. PDF = scores + per-task analysis + protection plan + benchmark, nicely typeset (reuse
  the CV builder's PDF pipeline patterns).
- Email → Resend audience `calculator-leads` (props: score band, occupation, country). Welcome
  email carries the report + one CV-builder line. Same honest-copy standards as the CV builder's
  gate; one-time localStorage flag so repeat analyses auto-offer "email this one too?" without
  re-asking for the address.

## Acceptance criteria

- [ ] Protection plan renders for every task ≥ 60% risk; grounded in the prescription library;
      no generic "learn AI" filler (spot-check 20 varied inputs)
- [ ] Leverage Score computed and displayed as the third dial; present on new share cards
- [ ] CV handoff delivers tasks/role/country into the CV builder with drafted bullets; works on
      mobile; no account required either side
- [ ] Safer-roles module shows 3 live JobStrike vacancies for high-risk GCC users; hides
      gracefully for countries with no inventory; jobs risk-tagged at batch time
- [ ] Compare-two-jobs mode works and links the Dubai job decision tool
- [ ] PDF report emails via Resend with correct props; on-screen results never gated; second
      analysis re-offers without re-asking for the address
- [ ] PostHog: `cv_handoff_clicked`, `safer_role_clicked`, `job_compare_run`,
      `report_email_captured` — all with score_band props

## Codex handoff prompt

> Implement per this brief: (1) protection-plan prescriptions generated within the existing
> analysis call via extended response schema, grounded by a reviewed per-category prescription
> library; (2) the per-task augmentation dimension and overall Leverage Score as a third dial;
> (3) the three ecosystem bridges — signed task→CV handoff payload into the CV builder,
> safer-roles module reading risk-tagged live jobs from the JobStrike Supabase via a read-only
> route, and compare-two-jobs mode; (4) the optional post-result PDF email report via Resend to
> the calculator-leads audience. Score-band-contextual CTA placement after the result reveal.
> No payments, no accounts, on-screen results never gated. Wire all PostHog events.
