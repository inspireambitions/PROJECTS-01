# Brief 01 — Gulf Match Score™ (JD-matching engine)

**Priority:** 1 (build first)
**Competitive target:** Rezi Score (23-point ATS check), Novoresume Skill Gap Analyzer, Teal Job Matcher — all paid. Ours is free and Gulf-calibrated.

## Objective

A user pastes a job description (or, in phase 2, picks a live job from JobStrike) and gets a
**0–100 Gulf Match Score** for the CV they're editing, with a prioritized gap list and one-click
fixes. This is the feature that turns "another free CV builder" into "the tool that tells me if
I'll get shortlisted for THIS job."

## User story

> As a job seeker in Dubai, I paste the Emirates NBD job ad I found on LinkedIn, and within
> seconds I see "72/100 — missing: 'AML compliance', 'notice period', UAE driving license not
> stated" — and I can click each gap to fix my CV on the spot.

## UX

1. New panel/tab in the builder: **"Match to a job"** with a textarea ("Paste the job ad") and a
   prominent **Score my CV** button.
2. Result view:
   - Big score dial (0–100) with verdict label: <50 "Not shortlist-ready", 50–74 "Close — fix the gaps", 75+ "Shortlist-ready".
   - **Gap list**, grouped and ordered by weight (see scoring). Each gap row = what's missing,
     why it matters (one line), and a **Fix** action that jumps to / pre-fills the relevant CV section.
   - **GCC Compliance strip** (unique to us, always shown): visa status stated? nationality stated?
     photo present? notice period? driving license (if JD mentions driving/site work)? location line?
3. Re-score is instant after edits (client keeps last JD; recompute on demand, not per keystroke).
4. Empty/abuse handling: JD under 200 chars → "That doesn't look like a full job ad — paste the whole posting."

## Architecture (important — read carefully)

Two-stage design so scores are **deterministic and reproducible**:

- **Stage A — extraction (LLM, server-side):** `POST /api/match/extract` takes JD text, returns
  structured JSON: `{ title, seniority, hard_skills[], soft_skills[], certifications[],
  languages[], years_required, gcc_flags: { driving_required, arabic_required, visa_mentioned,
  location } }`. Use Anthropic API, model `claude-haiku-4-5-20251001`, temperature 0, JSON schema
  via tool-use so parsing never fails. Never send the user's CV to this endpoint — JD only.
- **Stage B — scoring (pure TypeScript, client or server, NO LLM):** deterministic function
  `computeGulfMatchScore(cvJson, extractedJd) → { score, gaps[], compliance[] }`.
  Same inputs must always produce the same score.

### Scoring weights (v1 — tune later against real recruiter feedback)

| Component | Weight |
|---|---|
| Hard skills coverage (exact + synonym match against skills/experience/summary text) | 40 |
| Title/seniority alignment (fuzzy match of JD title vs. CV headline & recent roles) | 15 |
| Years of experience vs. required | 10 |
| Certifications & languages coverage | 10 |
| **GCC compliance items** (visa status, nationality, notice period, location, photo, license when relevant) | 15 |
| ATS hygiene (has summary, dated roles, bullet lengths 8–30 words, quantified bullets ≥30%, no empty sections) | 10 |

Synonym matching: ship a static `skills-synonyms.json` (e.g. "AML" ↔ "anti-money laundering",
"MEP" ↔ "mechanical electrical plumbing") seeded for the 8 sector templates in brief 02. Simple
normalized-string + synonym lookup is enough for v1 — no embeddings.

### Phase 2 (after brief 04): "Score against live jobs"

Replace paste-only with a second source: search the JobStrike `jobs` table (Supabase project
`txnkaztivqvqppyeedwm`) via a read-only API route, pick a vacancy, score against it. Store the
score in `fit_scores` when the user has opted into an account. **Do not build this in v1** — but
keep `extractedJd` as the interface boundary so a JobStrike job can be mapped into the same shape.

## Guardrails

- Rate-limit `/api/match/extract` (IP-based, e.g. 20/hour) — it's an open LLM endpoint.
- Cache extraction by JD text hash (LRU or Vercel KV) so re-scores are free.
- The API must never log or store CV content.

## Acceptance criteria

- [ ] Pasting a real Bayt/LinkedIn JD returns a score in <6s cold, <1s re-score
- [ ] Same CV + same JD always → same score
- [ ] Every gap row's **Fix** action lands the user in the right CV section
- [ ] GCC compliance strip renders even at score 100
- [ ] Works with Arabic-language JDs (extraction prompt must handle AR input)
- [ ] PostHog: `match_score_run` (score, jd_lang, source), `match_gap_fixed` (gap_type)
- [ ] Rate limit + cache verified; no CV data in server logs

## Codex handoff prompt

> Read this brief and the existing CV builder codebase. Implement the Gulf Match Score exactly as
> specified: (1) an `/api/match/extract` route handler calling Anthropic claude-haiku-4-5 with
> tool-use-enforced JSON output, JD-hash caching and IP rate limiting; (2) a pure, unit-tested
> `computeGulfMatchScore` module with the weight table above and a seeded `skills-synonyms.json`;
> (3) the "Match to a job" panel with score dial, weighted gap list with Fix deep-links, and the
> GCC Compliance strip; (4) PostHog events. Follow existing state-management and styling
> conventions. Write unit tests for the scorer covering: perfect match, empty CV, Arabic JD,
> synonym hits, and the driving-license conditional.
