# Brief 04 — The JobStrike Bridge (the moat)

**Priority:** 5 (build last — most plumbing, biggest payoff)
**Competitive target:** Teal's tracker ($13/wk, US job boards only) and VisualCV's link analytics
($24/mo). Neither has a single Gulf job in their data. We have a live scraped UAE feed.

## Why this is the moat

Supabase project `jobstrike-uae` (`txnkaztivqvqppyeedwm`, ap-south-1) already holds:
`jobs` (live listings, 645 scrape runs), `applications`, `fit_scores`, `candidate_profiles`,
`companies`, `alerts`, `subscriptions` — all RLS-enabled. Every competitor would need to build a
Gulf job-scraping operation to copy this. The CV builder becomes the front door of JobStrike:
**build CV → score against real vacancies → track applications → get alerts.** One loop, two
products, zero equivalent anywhere.

## Scope (three features, one optional account)

### 4.1 Optional accounts (Supabase Auth) — the gate for this brief only

- Email OTP / magic link (no passwords), Google optional. **The builder and export stay
  100% usable without an account** — auth is offered only when the user taps a save/track/alert
  feature. Copy: "Save your CV & track applications — free."
- On signup: current CV JSON syncs to a new `cvs` table; localStorage remains source of truth
  for anonymous users. Multiple named CV versions per user (VisualCV-style tailoring).
- New tables (with RLS mirroring existing conventions): `cvs`, `cv_share_links`, `cv_link_views`.
  Reuse `candidate_profiles` for profile data rather than duplicating.

### 4.2 Application tracker on live jobs

- **"Jobs for you" tab:** query `jobs` filtered by the sector/title of the active CV; each card
  shows the Gulf Match Score (brief 01's scorer against the stored extraction — populate/reuse
  `fit_scores`). One tap: "Track this application" → row in `applications` with status pipeline
  `saved → applied → interviewing → offer → rejected`.
- Manual add for jobs found elsewhere (paste URL/title) so the tracker isn't limited to scraped inventory.
- Kanban-lite board (mobile-first: swimlane list, not desktop kanban), per-application notes,
  applied-with-which-CV-version link.
- **Alerts:** reuse the `alerts` table — "email me new jobs matching this CV over 70" (daily
  digest via Resend, which Kim already uses for the newsletter).

### 4.3 Trackable CV share links

- "Share as link" → `cv.inspireambitions.com/v/{slug}` renders a read-only web CV (same template
  engine from brief 02) + PDF download.
- Log views to `cv_link_views` (timestamp, coarse geo from Vercel header, referrer; **no
  fingerprinting** — say so in the UI, it's on-brand honesty).
- Owner dashboard: "Your CV was viewed 3 times this week — twice from Dubai." Notification email
  on first view per day (Resend).
- Links revocable; `noindex` on view pages; slug ≥ 96 bits of entropy.

## Architecture notes

- CV builder talks to Supabase via `@supabase/ssr` with the **publishable key + RLS** — no
  service-role key in the CV builder deployment. Cross-check existing RLS policies on
  `applications`/`fit_scores` before writing (they were designed for the JobStrike app; extend,
  don't fork).
- Scoring reuses `computeGulfMatchScore` from brief 01 — extract it to a shared package if the
  repos are separate, or duplicate the pure module with a sync test. JD extraction for scraped
  jobs runs batch-side in JobStrike (one extraction per job, stored), NOT per-user.
- Keep JobStrike branding light in v1: the tab is "Jobs for you", powered-by-JobStrike footnote.
  Full cross-product identity is a later marketing decision, not a build decision.

## Acceptance criteria

- [ ] Anonymous flow completely untouched (build + export with zero auth prompts)
- [ ] Signup → CV synced, versions save/load/rename, RLS verified (user A cannot read user B's rows — test it)
- [ ] Jobs tab shows live `jobs` rows with per-job scores; track → `applications` row; status pipeline works
- [ ] Daily alert email sends via Resend for score-≥threshold matches
- [ ] Share link renders all templates from brief 02 (EN + AR), logs views, revocation kills the URL
- [ ] `noindex` verified on `/v/*`; no service-role key shipped to the CV builder
- [ ] PostHog: `account_created`, `application_tracked` (status), `share_link_created`, `share_link_viewed`, `job_alert_set`

## Codex handoff prompt

> Read this brief plus the existing schemas in Supabase project txnkaztivqvqppyeedwm before
> writing any migration. Implement: optional Supabase email-OTP auth (never blocking the free
> builder); `cvs`, `cv_share_links`, `cv_link_views` tables with RLS matching existing
> conventions; the "Jobs for you" tab querying `jobs` with stored batch JD extractions scored by
> the shared computeGulfMatchScore module and persisted to `fit_scores`; a mobile-first
> application tracker writing to `applications` with the 5-status pipeline and manual job add;
> daily Resend alert digests from `alerts`; and trackable, revocable, noindexed share links with
> a view-analytics dashboard. Write RLS tests proving cross-user isolation. Use the publishable
> key only in the CV builder app.
