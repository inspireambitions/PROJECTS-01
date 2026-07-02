# /subscribe/ Page Fixes — The Hospitality Memo

Editorial + design punch list for `https://inspireambitions.com/subscribe/`.
These require direct WordPress / page-builder edit access (the page source is
NOT in this repo). Ranked by impact. Written 2 July 2026.

## Copy fixes (exact, ready to paste)

### 1. Cadence badge — contradicts the rest of the page (fix first)
The top-right hero pill currently reads **"FREE SUNDAY CAREER NOTE"**, but every
other line on the page says "every other Sunday" / "twice a month" / "Bi-Weekly."
It is the second thing a visitor reads, so the contradiction registers immediately.

- **Change:** `FREE SUNDAY CAREER NOTE` → **`FREE BI-WEEKLY CAREER NOTE`**
- Also check the small eyebrow above the signup card ("FREE · EVERY OTHER SUNDAY") —
  that one is already correct; make the badge match it.

### 2. CTA button — inconsistent text, and it wraps to two lines
Top button reads "JOIN THE HOSPITALITY MEMO" (wraps awkwardly inside the button);
bottom button reads "Join Free." A diluted/repeated-differently CTA is a weaker CTA.

- **Change both buttons to the identical string:** **`Get Sunday's Memo`**
- Confirm it sits on ONE line at the current button width on mobile.

### 3. Sample Field Note — reads like the corporate-speak the page promises to avoid
The page pitches "no hype, not recycled internet tips," then the sample Field Note
shows a stiff reply script ("As we approach our next peak operational cycle, I'd
like to formally state my interest in being considered for upcoming leadership
tracks..."). That is exactly the register a real 20-year insider would tell someone
NOT to use. Rewrite in the blunter voice the rest of the page already uses.

**Replace the "Already in the Gulf?" reply-script block with:**

> **Already in the Gulf?** Corner your department head this week — not with a formal
> memo, with one line in your next one-to-one: *"I want to be in the room for the
> next promotion round. What do I need to show you before then?"* That's it.
> Specific, on the record, impossible to forget.

**And tighten the "Applying from abroad?" block to match that register** (shorter,
concrete, no "introduce your global experience as a solution to their upcoming
peak-season demand" phrasing).

### 4. Stat strip — two of the four "stats" are filler
On a page that explicitly says "we won't fake social proof," padding a stat row
undercuts the one real number next to it.

- **Keep:** `20+ years inside luxury hospitality & career HR`
- **Cut:** the `7 welcome emails` and `1 Field Note per issue` cards.
- `0 spam, agent fees, or data-selling` is a promise, not a stat — fine to keep as
  a promise line, but it doesn't belong dressed as a metric. Move or restyle.

### 5. Closing CTA line — the one abstract line on a concrete page (low priority)
- **Change:** "Be the person who notices the signal early." →
  **"Read Sunday's Memo before your next shift — not after."** (ties back to the
  hero promise "Read it before your next shift, interview, or contract decision.")

## Design / technical checks (need eyes on the live page)

### 6. Colour palette — confirm intentional vs drift  ⚠️ DECISION NEEDED
Documented site brand (see `HANDOFF.md`, used in every featured image) is
**navy `#0c1828` + gold `#c9a227`**. The subscribe page instead runs cream/tan +
dark green + a **red** CTA button. The red button in particular reads as generic
"sale/urgent" rather than an intentional brand choice.
- **Question for Kim:** is this a deliberate "Hospitality Memo" sub-brand, or drift?
- If drift: recolour the CTA to gold `#c9a227` (or navy) to match the system.

### 7. Contrast on the dark-green sample panel — possible WCAG AA fail
In "See a Memo before you join," the body copy (light green on dark green) looks
noticeably dimmer than the white headline above it. Check body text against
**WCAG AA 4.5:1**. It sits in the highest-value conversion section, so if it's
failing, it's costing reads. Lighten the body text or darken the panel until it passes.

### 8. Email input placeholder — verify not clipping
Rendered as "Your email add" in the mobile screenshot. Confirm the input isn't
truncating its own placeholder ("Your email address"); widen the field or shorten
the placeholder to "Email address" if it clips.

## What NOT to touch (already strong)
- The two-column "Two journeys" split (cream vs dark green) — equal visual weight
  for both audiences is doing real work; leave it.
- The 01/02/03 rhythm cards — clean and on-accent.
- "Reader notes will go here… We will not fake social proof." — keep exactly.
- "Behind the Memo" (named author, reply promise, specific credential) — keep.
