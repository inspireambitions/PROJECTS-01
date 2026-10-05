# Brief 07 — "Anyone can build it": Talk Mode, plain language and real-user proof

**Target repo:** `inspireambitions/cv-builder-for-blog.inspireambitions.com`
(audited at `main` @ `1bc5a49`, 15 Aug 2026). Live product: cv.inspireambitions.com.
**Priority:** Phases A and B ship first (days). Phases C to F follow. Phase G is the gate
that decides whether this brief is done.
**Governing standards:** brief 06 (design tokens, mobile budgets, accessibility) applies to
every screen here. Where this brief and brief 03 (language packs) disagree about the
builder UI, this brief wins.

---

## 1. Kim's goals (what "done" must prove)

| # | Goal | How this brief proves it |
|---|---|---|
| G1 | Better than Enhancv | Section 6 comparison is true at launch, feature by feature |
| G2 | The most user-friendly CV builder | Phase G real-user test passes; funnel completion beats today's baseline |
| G3 | Usable by people with little schooling or little English | Phase G participants are exactly this group, on their own phones, in their own language, with no help |
| G4 | Stays free, mobile-first and premium | `npm run check:free` stays green; brief 06 budgets stay green; JPEG stays ungated |

This brief is **not done** when the code merges. It is done when Phase G passes.

## 2. What the audit found (evidence for every change below)

Walked through `main` on a 360 px Android viewport, in English and Urdu, on 5 Oct 2026.

1. **Language switch is mostly cosmetic.** Choosing اردو flips layout to RTL, but the Work
   History step stays entirely English. Only "Back" was translated. The logo renders as
   "Ambitions Inspire". The back arrow points the wrong way in RTL.
   (`lib/i18n.ts`: `hi`, `ur`, `tl` overrides cover a small share of keys; step components
   hardcode English.)
2. **Hardest task comes first.** Step 2 is "Professional Summary: write a compelling
   overview" before any job is entered. Starters say "leverage my expertise in [Key Skills]
   to [Value Proposition]". (`components/steps/StepSummary.tsx`, order in `lib/constants.ts`.)
3. **Examples target senior office staff.** "Senior Project Manager", "AECOM", "A $2B
   logistics provider operating across 14 countries", "BSc Computer Science, University of
   Manchester". (`StepExperience.tsx`, `StepEducation.tsx`.) Meanwhile
   `lib/role-suggestions.ts` already covers kitchen steward, housekeeping, security, driver,
   cleaning and 13 more families.
4. **Toast covers the main button.** `components/shared/SaveToast.tsx` is `fixed bottom-4
   end-4`; on mobile it sits on top of "Save and continue" after every step.
5. **Empty CV is called "ready".** Skipping work history, education and skills still shows
   "Your work is saved. Your CV is ready to review." (`StepScore.tsx` heading is static.)
6. **Jargon and vendor names in the UI.** "ATS", "Tailor", "JPEG", "NOC", "URL fragment, not
   server logs", "Grok drafts the targeted version, Sonnet reviews it, and the evidence gate
   blocks unsupported claims" (`components/tailoring/TailorWorkspace.tsx`), "PREMIUM BETA"
   on a free product, a header button whose label is the word "Moon"
   (`components/shared/ThemeToggle.tsx`).
7. **Long, with exits on every step.** 10 screens to download; most 2 to 4 phone screens
   tall; the full site footer with 9 outbound links renders on every builder step
   (`components/CVBuilder.tsx`).
8. **Dates are free text** ("Jan 2020 to Present"), no month/year picker, no "I still work
   here".
9. **Homepage hides the product.** `app/page.tsx` shows grey skeleton bars labelled
   "Fictional sample CV" instead of a real, finished CV.

## 3. Non-negotiables

- **Fully free.** No payment code (`npm run check:free` must pass). JPEG export stays
  instant with no email. PDF and Word keep the one-time email unlock already built in
  `DownloadModal.tsx` unless Kim approves the Phase F option.
- **Nothing is removed for confident users.** Today's form becomes **"Full form"**. Talk
  Mode becomes the recommended default. Both write to the same `CVState`, so users can
  switch at any time without losing data.
- **AI never invents facts.** Every AI rewrite is checked with the existing evidence logic
  (`lib/evidence.ts`): no new employers, numbers, dates, certificates or claims that the
  user did not provide. If AI is down, every flow still works using the sentence library
  and the deterministic summary in Phase C.
- **Saved drafts survive.** Changing step order must migrate existing drafts in
  `localStorage` (`inspireambitions-cv-state` and the drafts list in `lib/state.ts`)
  without losing data or landing users on the wrong step.
- **British English, no em dashes,** in all user-facing copy.
- **No AI vendor or model names** anywhere a job seeker can see them.

---

## Phase A — Fix what blocks people today (ship in days)

| # | Change | Files |
|---|---|---|
| A1 | Toast never overlaps the action bar. On mobile, drop the toast (the "Saved on this device" line already exists) or place it above the bar. | `components/shared/SaveToast.tsx`, `components/CVBuilder.tsx` |
| A2 | Theme button shows a sun/moon **icon** with an `aria-label`, never the words "Moon"/"Sun". Hide it inside the builder on mobile. | `components/shared/ThemeToggle.tsx` |
| A3 | Inside the builder (`step > 0`), replace the full footer with one quiet line: "More free career tools". | `components/CVBuilder.tsx` |
| A4 | Honest review screen. Heading depends on completeness from `lib/score.ts`: if name, a contact method or at least one job is missing, show "Almost there: N things missing" with a tap-to-fix button per item that calls `goToStep`. Only say "Your CV is ready" when the minimum is met. | `components/steps/StepScore.tsx`, `lib/score.ts` |
| A5 | Brand never mirrors: wrap the logo in `dir="ltr"`. Direction-aware arrows (flip in RTL). | `components/CVBuilder.tsx`, `components/BuilderShell.tsx`, `app/page.tsx` |
| A6 | Homepage shows a **real** finished sample CV (pre-rendered static WebP of a sector template with `lib/sample-data.ts`), not grey bars. Must stay inside brief 06's LCP budget. | `app/page.tsx` |

## Phase B — Plain language everywhere

**B1. Glossary (apply across all UI, all languages):**

| Today | Replace with |
|---|---|
| JPEG | Picture (good for WhatsApp) |
| PDF | PDF (best for sending to companies) |
| Word / .docx | Word (if a company wants to edit it) |
| ATS / ATS-safe | "easy for company computers to read", or remove |
| Tailor / Tailor to a Job | Match my CV to a job advert |
| Upload & Tailor to a Job | I already have a CV |
| NOC | Letter from your sponsor allowing you to change job (NOC) |
| Professional Summary | About you (2 to 3 lines) |
| Resume link / URL fragment / encrypted | Continue on another phone |
| PREMIUM BETA | (delete) |
| Grok / Sonnet / evidence gate | (delete) |

**B2. Copy rules (enforced by a new check, see B5):**
- Every question or instruction: at most 12 words, reading grade 6 or below in English.
- One idea per sentence. No idioms.
- Every option that needs explaining gets a one-line plain explanation under it.

**B3. Examples follow the job.** When a role family is known (typed title matched by
`lib/role-suggestions.ts`, or chosen in Talk Mode), every placeholder in Experience,
Education and Skills switches to that family (Housekeeping: "Room Attendant", "5-star hotel,
Dubai", "Housekeeping procedures"). Neutral defaults otherwise. Remove AECOM, "$2B logistics
provider", "University of Manchester", "First Class Honours" from defaults.

**B4. Real dates.** Experience uses month and year dropdowns plus an "I still work here"
switch. Store structured fields (`startMonth`, `startYear`, `endMonth`, `endYear`,
`current`) and keep deriving the existing `dates` string ("Jan 2020 to Present") so
templates, PDF and Word export keep working unchanged. Migrate old free-text values where
parseable; leave them as-is otherwise.

**B5. New CI check `scripts/check-plain-language.mjs`** (add to `npm run ci`):
- fails on any banned term from the B1 table in user-facing strings (allow-list for legal
  pages and `/vs/*` comparison pages, which may name ATS),
- fails on any AI vendor or model name in `components/` or `app/` UI strings,
- fails if any Talk Mode question exceeds 12 words or Flesch-Kincaid grade 6 (English).

**B6. Tailoring box** in `TailorWorkspace.tsx`: rename to "Match my CV to a job advert",
plain description ("Paste a job advert. We suggest changes using only what is already in
your CV. You choose what to keep."), collapsed by default, shown **after** the download
section, not before it.

---

## Phase C — Talk Mode (the new default path)

**Principle:** ask simple questions; never make anyone write a CV. Talk Mode collects facts
with taps. The app writes the English CV. The user approves.

### C1. Entry
Homepage and step 0 offer three choices, in this order:
1. **Answer simple questions** (recommended badge) → Talk Mode
2. **I already have a CV** → existing upload flow (`/api/ai-improve-file`)
3. **Fill in the full form** → today's builder ("Full form")

### C2. Screen rules (every Talk Mode screen)
- One question per screen, at most 12 words, with an icon.
- Answer by tapping big buttons (minimum 48 px tall), typing, or speaking (Phase E).
- A **read-aloud** button on every question (Phase E).
- **Skip** on every optional question. Back never loses answers.
- Honest progress: "Question 4 of about 14", recalculated as answers change.
- No footer, no outbound links, no theme toggle. Language switch stays in the header.
- Live mini-preview of the CV available from a "See my CV" button, never forced.

### C3. Question flow

| # | Question (English source copy) | Answer type | Writes to |
|---|---|---|---|
| 1 | Which language do you want to use? | Big buttons in native script: English, العربية, हिन्दी, اردو, Tagalog | `locale` |
| 2 | What work do you do? | Icon tiles from `role-suggestions.ts` families + "Other" | role family |
| 3 | What is your job title? | Suggestions for that family + free text | `experience[n].role`, `personal.title` default |
| 4 | Where do you work? | Company name, or "I prefer not to say" (then a plain description chosen from family options, e.g. "International hotel") | `company`, `companyDesc` |
| 5 | Which city and country? | Chips for GCC cities and countries + free text | `location` |
| 6 | When did you start? Do you still work there? | Month/year dropdowns, Yes/No | structured dates (B4) |
| 7 | What do you do every day? | Tap sentences from the family library (expand to 8 to 12 per family), plus "Say it in my words" (type or speak) | `description` |
| 8 | What are you proud of? | Chips per family (e.g. "Trained new staff", "Good guest reviews", "Promoted", "Employee of the month") + free text or voice | `description` achievements |
| 9 | Did you have another job before this? | Yes loops to 2; No continues | `experience[]` |
| 10 | What is your highest level of school? | Chips: No formal school, Primary, Secondary, High school, Diploma or certificate, University, Other; then optional details | `education[]` |
| 11 | Which skills do you have? | Chips suggested for the family, multi-select, + add your own | `skills[]` |
| 12 | Which languages do you speak? | Chips + level buttons with icons (Basic, Good, Very good, Native) mapped to existing levels | `languages[]` |
| 13 | Gulf details (each skippable, each with a one-line explanation) | Visa status, "When can you start?" (Now / 1 week / 1 month / 2 months or more), driving licence, NOC | existing `personal` Gulf fields |
| 14 | How can companies contact you? | Name, phone with country code (default from `lib/geo.ts`), email optional with "I do not use email" | `personal` |
| 15 | Add a photo? | Camera or gallery via existing `PhotoEditor` | `photo` |
| 16 | "We wrote this about you" | Generated summary: Keep / Change / Read aloud | `summary` |
| 17 | Choose a design | 3 recommended designs from `lib/template-recommendation.ts` + "See all designs" | `template` |
| 18 | Done | Honest checklist (A4) or celebration, then download buttons in plain words (B1) and "Send to my WhatsApp" (Phase F) | export |

Contact details come near the end on purpose: people start with what they know best (their
work) and build momentum.

### C4. AI endpoints (server-side only)
- `POST /api/talk/bullets` — input: `{ familyKey, jobTitle, inputLang, text }`; output: 2 to 5
  English CV bullets (and Arabic when `cvLanguage` is Arabic). JSON enforced through tool
  use, temperature 0, existing `lib/anthropic.ts` client and model config. Every bullet runs
  through `lib/evidence.ts`; any bullet adding a number, employer, certificate or claim not
  in `text` is dropped. User approves each bullet: **Keep / Change / Remove**.
- `POST /api/talk/summary` — input: structured answers only; output: 2 to 3 sentence summary,
  same evidence rules.
- Both: IP rate limit, input-hash cache, no CV content in logs, plain-language error
  ("We could not write this right now. Your answers are saved. Tap the sentences instead.").
- **Deterministic fallback summary** (no AI needed), built in code from answers:
  "{Job title} with {years} years of experience in {sector} in {countries}. Skilled in
  {top 3 skills}. Speaks {languages}." Used when AI is unavailable or rate limited.

### C5. Step order for the Full form
Move Summary after Skills in `lib/constants.ts` and `STEP_COMPONENTS`, default it to the
generated summary, and replace the bracketed starters with plain ones. Include a
draft-migration that maps old `state.step` indices to the new order.

---

## Phase D — Full translation or hide it

- Every string in the builder, Talk Mode, Download dialog and review screen goes through
  `lib/i18n.ts` keys. No hardcoded English in `components/steps/*`, `components/modals/*`,
  `components/tailoring/*` or new Talk Mode components.
- CI check: fail on untranslated string literals in those folders, and fail if any key is
  missing from `ar`, `hi`, `ur` or `tl`.
- Machine translation is acceptable as a first pass, clearly marked. A language is listed
  in the public switcher only after a native-speaker review by Kim's network. Until then it
  is reachable only with `?lang=xx`.
- RTL (`ar`, `ur`): logical CSS properties only, direction-aware icons, brand stays LTR
  (A5), numbers, phone numbers and emails wrapped so they never reorder.
- UI language and CV language stay separate settings (existing `cvLanguage`). The CV itself
  is produced in English or Arabic.

## Phase E — Read aloud and voice answers

- **Read aloud (v1):** `speechSynthesis` reads the current question and options in the UI
  language. Feature-detect per language; hide the button when the device has no voice for
  that language. Never auto-play.
- **Voice answers (v1):** browser `SpeechRecognition` / `webkitSpeechRecognition` with the
  right locale (`ur-PK`, `hi-IN`, `fil-PH`, `ar-AE`, `en-GB`), feature-detected; the mic
  button is hidden where unsupported. The transcript appears as editable text before it is
  sent to `/api/talk/bullets`. Privacy line next to the mic: "Your phone's speech service
  turns your voice into text."
- **Voice v2 (needs Kim's decision, do not build without it):** server-side transcription
  for browsers without speech recognition (notably iOS in some languages). This adds a new
  paid speech-to-text vendor and API key. Ship v1 first and measure `talk_voice_used`
  before deciding.

## Phase F — WhatsApp-first

- **Send to my WhatsApp:** after export on mobile, use the Web Share API with the file
  (`navigator.share({ files: [cvFile] })`) so the PDF or picture opens in WhatsApp's share
  sheet. Fallback where file sharing is unsupported: download plus a `wa.me` link with a
  short message.
- **Continue on another phone:** share the existing resume link
  (`lib/resume-link.ts`) through the share sheet instead of "copy encrypted link".
- **Option for Kim (built behind a flag, off by default):** unlock PDF and Word with a
  WhatsApp number instead of email, for users who tap "I do not use email". Requires Kim to
  approve (a) consent wording under UAE PDPL and (b) where numbers are stored, because the
  current Resend list only holds emails. Flag: `NEXT_PUBLIC_UNLOCK_WITH_WHATSAPP`.

---

## Phase G — Prove it with real people (the done gate)

**Moderated test, before public launch of Talk Mode**
- 5 participants from Kim's network: a housekeeper, a driver, a security guard and two
  kitchen staff. At least two must use a language other than English.
- Their own phones, their own data or Wi-Fi, their chosen language. Observer stays silent
  unless the participant is stuck for 2 minutes.
- Record per person: finished yes/no, time to download, every point stuck for more than 30
  seconds, every word they did not understand.

**Pass bar**
- 5 of 5 finish a CV they say they would send to an employer.
- Median time from start to download: 10 minutes or less.
- No observer help needed by anyone.
- Every stuck point and unknown word is fixed, then re-tested with at least 2 new
  participants.

**Live measurement (PostHog, org "Job Strike")**
- New events: `talk_mode_started`, `talk_question_answered` (question id),
  `talk_question_skipped`, `talk_voice_used` (lang), `read_aloud_used` (lang),
  `talk_bullets_accepted` / `talk_bullets_changed`, `talk_mode_completed`, plus the
  existing `cv_exported`.
- Record the current start-to-download completion rate for the existing form **before**
  launch as the baseline. Success: Talk Mode completion beats the baseline within 30 days of
  launch, and drop-off on every question is visible so the worst question can be fixed
  first. Kim sets the numeric target once the baseline is known.

## 4. Automated acceptance tests (add to `tests/`)

- [ ] At 360 px, the save indicator never intersects the primary action button (bounding
      boxes) on any step.
- [ ] Empty or near-empty CV never shows "ready"; each missing item links to its step.
- [ ] With `ur`, `hi`, `tl` and `ar`, every Talk Mode and builder screen has zero untranslated
      English keys; the logo text is identical in every locale.
- [ ] No banned glossary terms or AI vendor names in rendered UI (crawl every step).
- [ ] Talk Mode completes end to end with the Anthropic API **mocked as down** (fallback
      summary, sentence library only) and produces a valid PDF, Word file and picture.
- [ ] `/api/talk/bullets` drops any bullet containing a number, employer or certificate not
      present in the input (fixtures for each).
- [ ] Old saved drafts load into the correct step after the step-order change.
- [ ] Switching from Talk Mode to Full form and back loses no data.
- [ ] Every interactive element in Talk Mode is at least 48 px tall.
- [ ] `npm run ci` green, including `check:free`, performance budget and Lighthouse.

## 5. Build order

1. Phase A (all), B1, B3, B4, B6 — ship as one release.
2. B5 check, C5 step order and migration.
3. Talk Mode C1 to C4, English first, behind flag `NEXT_PUBLIC_TALK_MODE`.
4. Phase D translations, then native review.
5. Phase E v1, Phase F.
6. Phase G moderated test, fixes, re-test. Then turn Talk Mode on as the default.

## 6. Comparison that must be true at launch

| | InspireAmbitions (after this brief) | Enhancv (July 2026) |
|---|---|---|
| Price | Free forever, no trial | 7-day free plan with branding, then $39/month (or $69 per 3 months, $99 per 6 months) |
| Word export | Yes, free | No Word export (PDF and TXT only) |
| Branding on CV | None | On the free plan |
| Section limits | None | 12 items per section on the free plan |
| Match to a job advert | Yes, free | Yes (job-description tailoring) |
| CV checker | Yes, free (existing score) | Yes (27-check resume checker) |
| Builds a CV with no writing (Talk Mode) | Yes | Not listed in the review; verify |
| Builder in Arabic, Hindi, Urdu, Tagalog | Yes, fully translated | Not listed in the review; verify |
| Speak your answers / read questions aloud | Yes, where the phone supports it | Not listed in the review; verify |
| Gulf fields (visa, notice, NOC, licence) | Yes | Not listed in the review; verify |
| Send to WhatsApp | Yes | Not listed in the review; verify |

Rows marked "verify" must be checked on enhancv.com before they appear on any public
comparison page (brief 05 rule: competitor claims are factual, dated and sourced).

Source for Enhancv: owlapply.com/en/blog/enhancv-review (observed July 2026). Re-check before
publishing any public comparison page.

## Codex handoff prompt

> Work in `inspireambitions/cv-builder-for-blog.inspireambitions.com`. Read
> `cv-battleplan/07-anyone-can-build-it.md` and `cv-battleplan/06-premium-design-performance.md`
> first. Implement in the build order in section 5. Start with Phase A plus B1, B3, B4 and B6
> as one PR, with the matching tests from section 4. Then add the plain-language CI check
> (B5) and the Summary step move with a draft migration (C5). Build Talk Mode (C1 to C4)
> behind `NEXT_PUBLIC_TALK_MODE`, reusing `CVState`, `lib/role-suggestions.ts`,
> `lib/evidence.ts`, `lib/template-recommendation.ts`, `PhotoEditor` and the existing export
> pipeline, with the deterministic fallback summary so it works when AI is down. Then
> complete translations (D), read-aloud and browser voice input (E v1), and WhatsApp sharing
> (F). Build the WhatsApp unlock option only behind its flag, off by default. Do not build
> server-side speech-to-text. Never show AI vendor names to users, never add payment code,
> never gate JPEG. Keep the existing form available as "Full form". Stop and report after
> each phase with screenshots at 360 px in English and Urdu. Do not mark the brief complete:
> Kim runs the Phase G test, and completion depends on it passing.
