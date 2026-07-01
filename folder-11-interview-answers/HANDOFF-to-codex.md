# Folder 11: GCC Interview Answers — Review Gate Handoff

**Status:** Published to WordPress as DRAFTS, fully optimised. Awaiting Kim's anecdote sign-off, then publish on approval.

**Important context from the playbook:** this is the swamp-drain hub. The head term (18,100/mo for "tell me about yourself") is too hard to rank for directly — this cluster wins on **GCC-localised long-tail**, not the generic head term. The 5th spoke, "why the gulf", is genuinely new ground — no existing site content and no Western interview guide covers it, since the question only exists in Gulf-sponsored-visa interviews.

## Live draft page IDs (parent = hub 47709)
| Page | ID | URL on go-live |
|---|---|---|
| Hub | 47709 | /gcc-interview-answers/ |
| Tell me about yourself | 47710 | /gcc-interview-answers/tell-me-about-yourself/ |
| Expected salary | 47711 | /gcc-interview-answers/expected-salary/ |
| Why leave your job | 47712 | /gcc-interview-answers/why-leave-your-job/ |
| Greatest weakness | 47713 | /gcc-interview-answers/greatest-weakness/ |
| Why the Gulf | 47714 | /gcc-interview-answers/why-the-gulf/ |

## Rail + optimisation (verified live)
All 6: word count 1,235–1,423; 0 em dashes / AI phrases (fixed "specifically" x5 mid-build, fixed one malformed JSON-LD @context) / US spellings / formulaic transitions; 14–40 first-person markers (naturally high — these are worked-example pages, quoting first-person sample answers throughout); exact CTA; 2 gender-balanced anecdotes; FAQ + FAQPage schema; AIOSEO meta + focus keyphrase set; featured images (media #47715–47725) attached.

**Structure rotation:** hub=contrarian, tell-me-about-yourself=data-first, expected-salary=question-driven, why-leave-your-job=cold-open, greatest-weakness=question-driven, why-the-gulf=cold-open. No two adjacent alike.

## ⚠️ CRITICAL: this redirect CSV is a PARTIAL sweep, not complete
A full scan of the swamp found **3,021 interview-related posts** (broad regex; the true on-target count, after narrowing to the 5 specific questions this folder answers, is roughly 150–200 near-duplicate posts). The 44-row CSV at `redirects/aioseo-import-folder-11.csv` covers the clearest, most directly-matching duplicates per spoke (8 for tell-me-about-yourself, 7 for expected-salary, 10 for why-leave-your-job, 19 for greatest-weakness). It does NOT cover every variant.

**Follow-up task for a future session:** run a full additional sweep of the remaining ~100+ near-duplicate posts (more "introduce yourself" variants, more "strengths and weaknesses" combos, posts with dress-code/logistics framing like "are jeans appropriate for a job interview" that may belong to a different/future cluster, etc). Decide case by case whether each maps to one of these 5 spokes or is genuinely out of scope (general interview logistics, not GCC-specific, may belong elsewhere or just get pruned).

## Go-live (when approved)
1. `PUBLISH_STATUS=publish bash publish.sh folder-11-interview-answers`
2. `bash dedupe-canonical.sh redirects/aioseo-import-folder-11.csv` (44 canonicals — run in parallel batches per the established pattern, this is a larger batch)
3. Verify URLs and canonicals.
4. Schedule the full swamp sweep as a separate follow-up task.
