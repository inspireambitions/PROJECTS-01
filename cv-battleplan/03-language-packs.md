# Brief 03 — Language packs (EN / AR / HI / UR / TL)

**Priority:** 3 (cheap, fast, nearly uncontested)
**Competitive target:** Nobody. Rezi covers Hindi; no builder covers Arabic + Hindi + Urdu +
Tagalog together — yet that's the actual language map of the Gulf workforce (majority South Asian
and Filipino, not Arabic-first).

## Objective

Make the builder *usable* by a Filipino hospitality worker or a Pakistani site engineer in their
own language, while the CV itself stays in the language recruiters expect (usually English, or
Arabic via brief 02). UI language ≠ CV language — keep the two axes independent.

## Scope

1. **i18n foundation** (if none exists): `next-intl` or equivalent; locale files
   `locales/{en,ar,hi,ur,tl}.json`. Two independent settings:
   - `uiLang` — builder chrome, labels, help text, buttons.
   - `cvLang` — section headings + date formatting in the exported document (v1: `en`, `ar`;
     add `hi`/`ur`/`tl` headings later only if users ask — Gulf recruiters read EN/AR).
2. **What gets translated (UI):** all builder chrome, all field labels and placeholder examples,
   the Gulf Match Score verdicts and gap explanations (brief 01), export dialogs, the GCC
   compliance strip. Placeholder examples must be *localized, not just translated* — a Tagalog
   hospitality placeholder should read like a Filipina F&B supervisor's real bullet, not a
   translated American one.
3. **RTL coupling:** `uiLang = ar` or `ur` flips the builder chrome RTL (brief 02's logical-CSS
   work makes this nearly free). Urdu needs the same bidi care as Arabic; use a Nastaliq-capable
   font stack for UI text where feasible, fall back to Naskh.
4. **AI rewrite localization:** the existing AI rewrite feature accepts input in any of the five
   languages and outputs polished **English** CV content by default (with an "output in Arabic"
   toggle). That's the killer use: type your experience in Urdu, get recruiter-grade English bullets.
   This is one system-prompt change plus a language hint — do it in this brief.
5. **Language switcher:** flag-free (use language names in their own script: العربية, हिन्दी,
   اردو, Tagalog, English), persisted in localStorage, auto-suggested from `navigator.language`
   on first visit via a dismissible one-line banner — never a blocking modal.

## Translation quality rule

Machine-translate first pass is acceptable to ship, but every string file gets a native-speaker
review pass (Kim's network) before the language is listed publicly. Until reviewed, a language
ships behind `?lang=` URL param only. Do not launch marketing for a language on MT-only strings.

## Acceptance criteria

- [ ] Full builder flow (start → fill → match → export) completable with `uiLang` = each of the 5
- [ ] `uiLang=ar`/`ur` renders builder chrome RTL with no layout breakage
- [ ] `cvLang` toggle changes exported section headings/dates only — never user content
- [ ] AI rewrite: Urdu/Hindi/Tagalog input → English output verified with real sample text
- [ ] No hardcoded English strings left in components (lint rule or grep check in CI)
- [ ] PostHog: `ui_lang_set`, `cv_lang_set`, `rewrite_run` gains `input_lang`/`output_lang` props

## Codex handoff prompt

> Introduce i18n to the CV builder per this brief: next-intl (or the repo's existing i18n lib if
> one exists) with en/ar/hi/ur/tl locale files; separate uiLang (builder chrome) from cvLang
> (exported headings, en+ar only in v1); RTL chrome for ar/ur reusing the logical-properties CSS
> from brief 02; localized placeholder examples per language; AI-rewrite language hint (any input
> language → English output, Arabic-output toggle); script-native language switcher with
> localStorage persistence and navigator.language suggestion banner. Extract every hardcoded
> string; add a CI check that fails on untranslated literals in components. Seed non-English
> files with clearly-marked machine translations for native review.
