# Brief 02 — Sector template system + true RTL mode

**Priority:** 2
**Competitive target:** Tadween and CV Gulf (who currently out-execute us on Arabic/bilingual), and the "one template" perception gap vs. Enhancv/Kickresume.

## Objective

Go from one GCC template to a **template system**: 8 sector-tuned templates on a shared engine,
plus a genuine RTL editing/export mode — not "Arabic-friendly spacing" but a mirrored, Arabic-first
layout. This makes the region-native claim defensible against the two players who actually contest it.

## The 8 sector templates

Each = same data model, different layout emphasis + seeded section order + sector synonym pack
(feeds brief 01's scorer). Every template supports photo on/off and EN/AR/bilingual.

| Template | Sector | Layout emphasis |
|---|---|---|
| Site | Construction / Engineering | Certifications & licenses block up top (driving license, safety cards), project list with values ("AED 40M tower, 14-month delivery") |
| Service | Hospitality / F&B | Photo prominent, languages bar, brand names of previous employers highlighted |
| Care | Healthcare | License/DataFlow/DHA-MOH-HAAD status block first, clinical skills matrix |
| Ledger | Banking / Finance | Conservative single column, compliance certs (AML/CFA), quantified achievements enforced |
| Crew | Aviation | Photo + measurements/grooming-standards block (regional airline norms), languages, service metrics |
| Stack | IT / Tech | Skills matrix first, projects with stack tags, ATS-plain option |
| Move | Logistics / Retail | License classes, systems (SAP/WMS), shift availability field |
| Corner | Executive / Management | Two-page, board-style summary, P&L ownership highlights |

Also keep the current GCC template as **"Classic GCC"** (default, backward compatible).

## Engine requirements

1. **One schema, many skins.** Templates are React layout components over the existing CV JSON —
   no per-template data forks. Adding template #9 must be a new layout file + config entry only.
2. **Template config** (`templates/*.config.ts`): section order, which optional GCC fields are
   surfaced by default (visa, nationality, notice period, license), photo default, accent palette,
   sector synonym pack id.
3. **Live switch:** changing template never loses data; unsupported optional fields hide, not delete.
4. **Export parity — three formats, one gate:**
   - **JPEG:** works for all 8 templates, instant, anonymous, no email, no watermark (unchanged headline claim).
   - **PDF and Word (DOCX):** also free and watermark-free for all 8 templates, but behind the
     one-time email gate specced in brief 05 Part D. PDF via the DOM print pipeline; DOCX via a
     lazy-loaded generator (e.g. the `docx` npm package) mapping the CV JSON to a clean
     single-column document — recruiters edit Word files, so DOCX must be genuinely editable
     (real headings/lists, no images-of-text). Both pipelines code-split per brief 06's budgets.
   - Note Enhancv ships **no Word export at all** and others paywall it — free DOCX is a
     comparison-table win; make sure brief 05's `/vs/*` data reflects it.

## True RTL mode

1. `dir="rtl"` at the document root of both the editor preview and exports when CV language = AR.
2. **CSS logical properties only** in all template CSS (`padding-inline-start`, `text-align: start`,
   `border-inline-end`…). Audit existing styles and convert — this is the bulk of the work.
3. Arabic typography: bundle an Arabic-capable font pair (e.g. IBM Plex Sans Arabic for headings,
   Noto Naskh Arabic for body — self-hosted, subset). Latin fallback for mixed content. Line-height
   +10–15% vs. Latin settings.
4. **Bidi safety:** phone numbers, emails, dates, and Latin company names inside Arabic text must
   render correctly (`unicode-bidi: isolate` / `<bdi>` on those value spans).
5. Arabic section-heading dictionary comes from brief 03's i18n layer — build against it, don't hardcode.
6. **Bilingual export (v1.5, flag it):** one CV, two pages — AR first then EN — from the same data.
   CV Gulf's whole pitch; ours is one click. If time-boxed out, ship behind a feature flag.

## Acceptance criteria

- [ ] 8 templates + Classic GCC, all photo on/off, all exporting JPEG (ungated) + PDF + DOCX
      (email-gated) free with no watermark; DOCX opens clean and editable in MS Word and Google Docs
- [ ] Template switch round-trip (A→B→A) preserves every field
- [ ] Full RTL: layout mirrors, no left-anchored artifacts, bidi-safe contact lines
- [ ] Arabic CV printed/exported renders identical to preview
- [ ] New-template test: adding a dummy 10th template touches only layout + config files
- [ ] PostHog: `template_selected` (template, sector), `cv_exported` gains `template`, `direction`, `format` props

## Codex handoff prompt

> Read the existing template/export code first. Refactor to a config-driven template engine (one
> CV JSON schema, per-template layout component + config for section order, GCC field defaults,
> palette, synonym pack). Convert all template CSS to logical properties. Implement the 8 sector
> templates per the table, RTL mode per the spec (root dir, self-hosted Arabic fonts, bdi-isolated
> contact values), and free PDF + editable DOCX export (lazy-loaded pipelines) alongside the
> existing ungated JPEG path — PDF/DOCX sit behind brief 05's email gate. Do not break the current
> GCC template for existing users. Deliver a visual QA page rendering all templates × {EN, AR} ×
> {photo, no-photo} for manual review.
