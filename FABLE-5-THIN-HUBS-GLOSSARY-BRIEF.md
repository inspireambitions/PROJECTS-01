# Fable 5 Brief: Thin Hubs, Empty Pages, and Glossary Split

You are helping with the Inspire Ambitions SEO remediation for inspireambitions.com.
This is a content production and restructuring brief. Codex is continuing the technical remediation in parallel.

## Read First

Before writing anything, read these files in this order:

1. `CODEX-EXECUTION-BRIEF.md`
2. `seo-audit-remediation-plan.md`
3. `HANDOFF.md`
4. `QUALITY-RAIL.md`
5. `change-logs/seo-remediation-2026-07-04.md`

Use the repo and live site as the source of truth. Do not rely on memory or assumptions.

## Decisions Already Made

- Keep `/tools/cake-day-gifts/` live. Do not delete it. Do not redirect it.
- Leave `/bn/`, `/ar/`, and `/hi/` language pages untouched for now.
- Do not edit language copies as part of this brief.
- Do not delete plugins. Codex owns that task.
- Do not import redirects. Codex owns that task.
- Do not change AIOSEO global settings.

## Global Content Rules

Follow `QUALITY-RAIL.md` exactly.

Non-negotiable rules:

- British English.
- No em dashes anywhere.
- No AI-cliche blacklist words from `QUALITY-RAIL.md`.
- Kim is only described as `HR Career Specialist`.
- No employer data.
- No identifiable colleagues.
- Short paragraphs.
- Active voice.
- Clear, human writing at about 6th-grade readability.
- Any statistic, legal claim, or government rule must use a real source. Do not invent data.
- Use the exact newsletter CTA required by `QUALITY-RAIL.md` where an article-style page needs a CTA.

Hub and tool pages are not full articles. They still need useful, original text, but they are exempt from the 1,200-word article minimum when their purpose is navigation or tool use.

## Scope

Your scope has three parts.

### Part 1: Empty or Near-Empty Pages

Investigate and produce ready-to-apply content for:

1. `/should-i-take-this-dubai-job/`
2. `/tools/`
3. `/living-in-the-uae/`

For each page:

- Inspect the live page first.
- Identify the real page purpose.
- Decide whether it should remain a tool/index page or become a content page.
- Write only enough copy to fix the thin or empty-page problem without bloating the page.
- Preserve any working tool, embed, calculator, form, or existing user flow.
- Add useful internal links to closely related Inspire Ambitions pages.
- Provide an SEO title under 60 characters.
- Provide a unique meta description of 120 to 160 characters.
- Provide a clean H1 if the current H1 is vague.

Expected length:

- Tool page support copy: about 350 to 600 words.
- Index page copy: about 500 to 800 words.
- True article page: 1,200 to 1,500 words only if the page is genuinely an article.

Special notes:

- `/should-i-take-this-dubai-job/` appears to have a working tool, but Seobility still flagged it. The likely fix is better visible intro and support text around the tool.
- `/tools/` may overlap with `/career-tools/`. Investigate the source and recommend one canonical direction before writing. Do not redirect it yourself.
- `/living-in-the-uae/` appears thin and generic with an embedded PDF. Decide whether it needs useful page copy around the PDF, a better index format, or a redirect recommendation.

### Part 2: Thin Hubs

Investigate and produce expansion copy for real thin hubs, especially:

- `/career-hub/`
- `/career-coaching/`
- `/salary-guides/`
- Legacy interview logistics hub pages, including:
  - `/how-to-prepare-for-a-job-interview-guide/`
  - `/common-job-interview-questions-answers/`
  - `/what-to-wear-to-a-job-interview-guide/`
  - `/how-to-follow-up-after-a-job-interview-guide/`
  - `/after-the-interview-offers-and-decisions/`
  - `/job-interview-nerves-confidence-guide/`
  - `/industry-specific-interview-guides/`
  - `/uae-job-interview-guide/`

Do not collapse these into Folder 11. Folder 11 is about interview answers. These pages are about interview process, logistics, preparation, and confidence.

For each thin hub:

- Confirm whether it is genuinely thin from the live page.
- Preserve the page purpose.
- Add concise, useful intro and section copy.
- Improve internal links and link labels.
- Avoid generic filler.
- Use original angles based on Gulf careers, HR operations, hospitality, and practical job search advice.
- Make the hub scannable and useful on mobile.
- Provide an SEO title under 60 characters.
- Provide a unique 120 to 160 character meta description.

Expected length:

- 500 to 900 words per hub or index page.
- More only if the page is acting as a full article.

### Part 3: Glossary Split

Investigate `/glossary/` and produce a practical split package.

Known issue:

- `/glossary/` is about 10,906 words.
- It has 203 duplicate paragraphs within itself.
- `/bn/glossary/` and `/ar/glossary/` are out of scope for now because language pages are held.
- The glossary has 10 dead MOHRE citation links that need live source verification.

Preferred approach:

1. Keep `/glossary/` as the main glossary index.
2. Convert it into a clean A to Z index with short, unique section intros.
3. Split oversized or repeated clusters into focused glossary child pages only where needed.
4. Do not create hundreds of tiny pages.
5. Do not remove useful terms without mapping where they went.
6. Fix dead government citations only after verifying replacement URLs in a real browser.

Government source candidates to test:

- The existing MOHRE PDF URLs in the glossary.
- The candidate MOHRE asset URL noted in `seo-audit-remediation-plan.md`.
- Stable `u.ae` employment law and labour regulation pages.

Deliver a glossary package containing:

- Current glossary problem summary.
- Proposed new glossary architecture.
- List of child pages to create, if any.
- For each proposed child page:
  - URL slug
  - H1
  - SEO title under 60 characters
  - Meta description 120 to 160 characters
  - Terms covered
  - Internal links to add
  - External official source links to use
- Revised `/glossary/` index copy.
- Redirect or canonical recommendations, if any.
- Change-log rows for every proposed change.

## Required Output

Return a content package, not vague advice.

Use this exact structure:

1. `Summary`
2. `URL Inventory`
3. `Empty Page Fixes`
4. `Thin Hub Expansions`
5. `Glossary Split Package`
6. `SEO Fields`
7. `Internal Links`
8. `External Sources Verified`
9. `Change Log Rows`
10. `Risks and Decisions Needed`
11. `Ready for Codex Application`

For every page, include:

- URL
- Current issue
- Recommended action
- Replacement or added body HTML
- SEO title
- Meta description
- H1 change if needed
- Internal links to add
- Verification notes

## Verification

Before marking the package ready:

- Check all new copy for em dashes.
- Check blacklisted AI phrases from `QUALITY-RAIL.md`.
- Check British English.
- Check that every meta description is 120 to 160 characters.
- Check that every SEO title is under 60 characters.
- Check that no content calls Kim anything except `HR Career Specialist`.
- Check all cited external sources in a real browser.

Do not claim a source is verified unless it loaded successfully.

## Stop Conditions

Stop and ask Kim or Codex before:

- Editing language pages.
- Deleting, redirecting, or noindexing `/tools/cake-day-gifts/`.
- Creating a large number of new glossary pages.
- Replacing `/tools/` with a redirect.
- Making live WordPress edits outside this scope.
