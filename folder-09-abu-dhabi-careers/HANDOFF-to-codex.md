# Folder 9: Abu Dhabi Careers — Review Gate Handoff

**Status:** Published to WordPress as DRAFTS, fully optimised. Awaiting Kim's anecdote sign-off, then publish on approval.

## Live draft page IDs (parent = hub 47652)
| Page | ID | URL on go-live |
|---|---|---|
| Sub-hub | 47652 | /abu-dhabi-careers/ |
| Finding a job | 47653 | /abu-dhabi-careers/finding-a-job/ |
| Work permits & visas | 47654 | /abu-dhabi-careers/work-permits-and-visas/ |
| Salaries | 47655 | /abu-dhabi-careers/salaries/ |
| Government vs private | 47656 | /abu-dhabi-careers/government-vs-private/ |
| Sectors | 47657 | /abu-dhabi-careers/sectors/ |
| Relocating here | 47658 | /abu-dhabi-careers/relocating-here/ |

## Rail + optimisation (verified live)
All 7: word count 1,217–1,451; 0 em dashes / AI phrases / US spellings / formulaic transitions; 8–13 first-person markers; exact CTA; 2 gender-balanced anecdotes; FAQ + FAQPage schema; AIOSEO meta + focus keyphrase set; featured images (media #47659-47671) attached.

**Structure rotation:** hub=cold-open, finding-a-job=question-driven, work-permits=data-first, salaries=data-first, government-vs-private=contrarian, sectors=question-driven, relocating-here=cold-open. No two adjacent alike.

## Playbook strategy executed
Built the **net-new "government-vs-private" angle** the playbook flagged as uncontested. That page positions the major state-linked employer pool (sovereign wealth funds, ADNOC, ministries) and the ADGM as serious destinations alongside private sector, instead of treating private as the default. This is the cluster's strongest differentiator from generic Abu Dhabi careers content.

## Consolidation (redirects/aioseo-import-folder-09.csv) — 11 301s
Generic jobs in AD + living-and-working → hub; how-to-get-a-job → /finding-a-job/; work-permits → /work-permits-and-visas/; healthcare careers + facilities + teaching + technology (4 sources) → /sectors/; nursery posts (3 sources) → /relocating-here/.

**Deferred (kept live):** Tourism/luxury posts (Mamsha al Saadiyat luxury district), travel posts (budget airlines) — tourism intent, off-topic. Also kept canonical-ed to Folder 7: /cost-of-living-in-abu-dhabi/ and /abu-dhabi-vs-dubai-cost-of-living-2026/ (already point at salary band-hides page, no double-handling).

## Go-live (when approved)
1. `PUBLISH_STATUS=publish bash publish.sh folder-09-abu-dhabi-careers`
2. `bash dedupe-canonical.sh redirects/aioseo-import-folder-09.csv` (11 canonicals)
3. Verify URLs and canonicals.
