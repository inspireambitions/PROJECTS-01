# JobStrike UAE — Build Spec v2.2 (LEAN MVP)

**Launch Date:** 2026-05-01 (Friday)
**Build Window:** 2026-04-20 → 2026-04-30 (11 days)
**Status:** Ready for Developer
**Source of Truth:** This document supersedes v2.0 and v2.1

---

## 1. What Changed From v2.1

| Change | Why |
|---|---|
| Build compressed 21 → 11 days | Founder decision: launch May 1, 2026 |
| Tier 1.5 moat features deferred | First-Batch, Salary X-ray, UAE Pulse, Recruiter Intel → Weeks 2-6 post-launch |
| Data sources simplified | **No scraping.** Adzuna + Jooble APIs + ATS direct endpoints only |
| LinkedIn removed as source | Not legally accessible; we link out to LinkedIn instead |
| Onboarding preserved | "Prove → ask" flow from v2.1 is non-negotiable |
| Founder Office Hours shipping Day 11 | Zoom + Calendly link only, archive comes later |

---

## 2. Tech Stack (No Surprises)

```yaml
frontend:
  framework: Next.js 14 (App Router)
  language: TypeScript
  styling: Tailwind CSS + shadcn/ui
  state: React Server Components + URL-based state
  analytics: PostHog (self-hosted)

backend:
  db: Supabase Postgres (managed)
  auth: Supabase Auth (magic link only, no OAuth)
  storage: Supabase Storage (CV files, auto-delete after 24h)
  row_level_security: enabled on every table

data_sources:
  adzuna: developer.adzuna.com (free tier)
  jooble: jooble.org/api (publisher program)
  careerjet: api.careerjet.net (publisher)
  greenhouse: boards-api.greenhouse.io/v1/boards/{slug}/jobs (public, no auth)
  lever: api.lever.co/v0/postings/{slug}?mode=json (public, no auth)
  smartrecruiters: api.smartrecruiters.com/v1/companies/{slug}/postings (public)

ai:
  provider: OpenAI
  model_fit_score: gpt-4o-mini
  fallback: manual paste for CV parsing failures

cv_parsing:
  pdf: pdf-parse
  docx: mammoth
  fallback: manual paste textarea

email:
  transactional: Resend (3k/mo free)
  sender: alerts@jobstrike.ae

payments:
  provider: Stripe
  plans:
    monthly: AED 49/mo
    annual: AED 399/yr
    trial: 14 days
  methods: card, Apple Pay, Google Pay (Stripe native)

hosting:
  frontend: Vercel
  backend: Supabase cloud (Dubai region if available)
  domain: jobstrike.ae

monitoring:
  errors: Sentry (free tier)
  uptime: Vercel status + one health endpoint
  logs: Vercel + Supabase

budget_monthly_at_500_users:
  supabase: ~$25
  vercel: $0 (hobby)
  openai: ~$30
  resend: $0
  stripe: ~2.9% of revenue
  apollo: $0 (publisher APIs free)
  total: ~$60/mo
```

---

## 3. MUST SHIP for Launch (11 Features)

1. **Landing page** with 3-field query form (title + city + experience level)
2. **Pre-fetched job feed** shown BEFORE signup (`prove → ask`, see Section 6)
3. **Magic link auth** (Supabase)
4. **CV upload** with parse + user confirmation diff screen
5. **OpenAI fit score** — banded display (Strong / Good / Stretch / Weak) with reasoning
6. **Daily email digest** via Resend, quiet hours 22:00–07:00 Gulf time
7. **Job detail page** with fit score explanation + outbound apply link
8. **Auto-log Ghosting Shield v1** — click on "Apply" auto-logs, 14-day → ghosted
9. **Stripe paid tier** with 14-day trial, AED 49/mo or AED 399/yr
10. **PDPL compliance flow** — consent on signup, one-click "delete my data"
11. **Founder Office Hours booking link** — Calendly + Zoom on landing page

---

## 4. DO NOT BUILD (Deferred to Post-Launch Week 2-6)

- First-Batch Indicator (too much logic for day-1)
- Salary X-ray (data aggregation needs 2-3 months of scrapes)
- UAE Hiring Pulse dashboard
- Recruiter Intelligence aggregates
- CV Health Check observations
- Pause flow / got-the-job flow
- WhatsApp Business API (gated on BSP approval)
- Web push notifications
- Video intro
- Map UI for neighborhood filter (use dropdown — good enough for MVP)
- Multi-source status page (one-line banner suffices)
- In-app referral flow

**If it's not in Section 3, do not build it.** Say no.

---

## 5. Database Schema (Supabase DDL)

```sql
-- Users table extends Supabase auth.users via trigger
create table public.profiles (
  id uuid references auth.users on delete cascade primary key,
  email text not null,
  full_name text,
  job_title text,
  city text,
  experience_level text check (experience_level in ('entry','mid','senior','director','c_suite')),
  visa_status text check (visa_status in ('resident','golden_visa','seeking_sponsorship','prefer_not_say')),
  linkedin_url text,
  created_at timestamptz default now(),
  updated_at timestamptz default now(),
  pdpl_consent boolean default false,
  pdpl_consent_at timestamptz
);

create table public.cvs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references public.profiles(id) on delete cascade,
  file_path text, -- will be wiped after 24h
  extracted_text text, -- kept, encrypted at rest by Supabase
  seniority_inferred text,
  employers_extracted jsonb, -- [{company, role, start, end}, ...]
  skills_extracted text[],
  status text default 'pending' check (status in ('pending','parsed','confirmed','failed')),
  parse_attempt_count int default 0,
  created_at timestamptz default now()
);

create table public.employers (
  id uuid primary key default gen_random_uuid(),
  apollo_id text unique,
  name text not null,
  domain text,
  website_url text,
  linkedin_url text,
  hq_city text,
  employees_band text,
  ats_type text check (ats_type in ('greenhouse','lever','smartrecruiters','ashby','workday','unknown')),
  ats_slug text,
  ats_verified boolean default false,
  source text default 'api' check (source in ('api','ats','employer_direct')),
  priority_tier text check (priority_tier in ('A','B','C')),
  created_at timestamptz default now()
);

create table public.jobs (
  id uuid primary key default gen_random_uuid(),
  external_id text not null, -- from source
  source text not null, -- adzuna, jooble, greenhouse, lever, etc.
  employer_id uuid references public.employers(id),
  title text not null,
  description text,
  city text,
  url text not null,
  salary_text text,
  posted_at timestamptz,
  last_seen_at timestamptz default now(),
  scraped_at timestamptz default now(),
  link_health text default 'unknown' check (link_health in ('unknown','ok','dead')),
  created_at timestamptz default now()
);
create unique index idx_jobs_source_ext on public.jobs(source, external_id);
create index idx_jobs_employer on public.jobs(employer_id);
create index idx_jobs_posted on public.jobs(posted_at desc);

create table public.user_queries (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references public.profiles(id) on delete cascade,
  job_title text,
  city text,
  experience_level text,
  active boolean default true,
  created_at timestamptz default now()
);

create table public.fit_scores (
  id uuid primary key default gen_random_uuid(),
  job_id uuid references public.jobs(id) on delete cascade,
  cv_id uuid references public.cvs(id) on delete cascade,
  band text check (band in ('strong','good','stretch','weak')),
  score int check (score between 0 and 100),
  reasoning text,
  top_matching_skills text[],
  top_missing_keywords text[],
  red_flags text[],
  computed_at timestamptz default now(),
  unique(job_id, cv_id)
);

create table public.applications (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references public.profiles(id) on delete cascade,
  job_id uuid references public.jobs(id),
  applied_at timestamptz default now(),
  status text default 'applied' check (status in ('applied','reply_received','interview','offer','rejected','ghosted')),
  status_auto_flip_at timestamptz, -- set to applied_at + 14 days
  outcome_reported_by_user boolean default false,
  created_at timestamptz default now()
);

create table public.alerts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references public.profiles(id) on delete cascade,
  job_ids uuid[] not null,
  channel text check (channel in ('email','in_app')),
  sent_at timestamptz default now(),
  opened_at timestamptz,
  clicked_at timestamptz
);

-- RLS policies
alter table public.profiles enable row level security;
create policy "users see own profile" on public.profiles for all using (auth.uid() = id);

alter table public.cvs enable row level security;
create policy "users see own cvs" on public.cvs for all using (auth.uid() = user_id);

alter table public.user_queries enable row level security;
create policy "users see own queries" on public.user_queries for all using (auth.uid() = user_id);

alter table public.applications enable row level security;
create policy "users see own applications" on public.applications for all using (auth.uid() = user_id);

alter table public.alerts enable row level security;
create policy "users see own alerts" on public.alerts for all using (auth.uid() = user_id);

-- jobs + employers + fit_scores are readable by authenticated users
alter table public.jobs enable row level security;
create policy "auth read jobs" on public.jobs for select using (auth.role() = 'authenticated');

alter table public.employers enable row level security;
create policy "auth read employers" on public.employers for select using (auth.role() = 'authenticated');

alter table public.fit_scores enable row level security;
create policy "auth read fit_scores" on public.fit_scores for select using (auth.role() = 'authenticated');
```

---

## 6. The "Prove → Ask" Onboarding Flow (Non-Negotiable)

```
LANDING
  → [3 fields: job title, city, experience] (NO signup)
  → server: call Adzuna + Jooble + Greenhouse/Lever adapters
  → return pre-fetched jobs from last 24h
  → render feed publicly (no login required)
  → user scrolls and sees 5-20 real jobs
  → each job shows "Sign up to see fit score" banner
  → click "See fit score" → magic link signup
  → after signup → optional CV upload → dashboard
```

**Critical:** the first API hit MUST return results in <2.5 seconds. Pre-cache common queries (e.g. "software engineer Dubai") during off-peak hours.

---

## 7. API Routes (Next.js App Router)

```
POST   /api/query                → public; returns jobs matching query
POST   /api/auth/magic-link      → Supabase wrapper
GET    /api/jobs                 → authenticated; paginated feed
GET    /api/jobs/:id             → job detail + fit score
POST   /api/cv/upload            → parse + confirm
POST   /api/cv/confirm           → user confirms parsed fields
GET    /api/fit-score/:job_id    → cached OpenAI response
POST   /api/apply/:job_id        → auto-log application + redirect
POST   /api/applications/:id/outcome → user marks reply/interview
POST   /api/stripe/checkout      → start trial
POST   /api/stripe/webhook       → handle subscription events
POST   /api/pdpl/delete-my-data  → wipe user
GET    /api/health               → for status banner
```

---

## 8. Environment Variables (.env.local)

```
# Supabase
NEXT_PUBLIC_SUPABASE_URL=
NEXT_PUBLIC_SUPABASE_ANON_KEY=
SUPABASE_SERVICE_ROLE_KEY=

# OpenAI
OPENAI_API_KEY=

# Adzuna
ADZUNA_APP_ID=
ADZUNA_APP_KEY=

# Jooble
JOOBLE_API_KEY=

# CareerJet
CAREERJET_AFFILIATE_ID=

# Resend
RESEND_API_KEY=

# Stripe
STRIPE_SECRET_KEY=
STRIPE_WEBHOOK_SECRET=
STRIPE_MONTHLY_PRICE_ID=
STRIPE_ANNUAL_PRICE_ID=

# Sentry
SENTRY_DSN=

# App
NEXT_PUBLIC_APP_URL=https://jobstrike.ae
```

---

## 9. Day-By-Day Build Plan (11 Days)

### Day 1 — Monday April 20: Scaffolding
- Create Next.js 14 app, TypeScript, Tailwind, shadcn/ui
- Spin up Supabase project (Dubai region)
- Apply schema from Section 5
- Implement magic link auth
- Deploy "hello world" to Vercel at jobstrike.ae
- **EOD deliverable:** user can sign up and log in via magic link

### Day 2 — Tuesday April 21: Data Sources (Publisher APIs)
- Integrate Adzuna API (basic search)
- Integrate Jooble API
- Build landing page with 3-field query form
- Wire query → API call → render results publicly
- **EOD deliverable:** visitor can type "software engineer Dubai" and see real jobs in <3 seconds

### Day 3 — Wednesday April 22: ATS Adapters
- Greenhouse adapter (poll 10 UAE companies: Careem, Talabat, Property Finder, etc.)
- Lever adapter (poll 5 UAE companies)
- Dedup logic (title + company fuzzy match)
- Link health HEAD-check before saving
- **EOD deliverable:** direct-from-employer jobs flowing into DB alongside publisher jobs

### Day 4 — Thursday April 23: Feed UI + Job Detail
- Authenticated job feed (/jobs)
- City filtering (dropdown, not map)
- Job detail page (/jobs/:id)
- "Apply" button (redirects to source + logs application)
- **EOD deliverable:** logged-in user can browse, filter, and click through to apply

### Day 5 — Friday April 24: CV Upload + Fit Score
- CV upload (pdf-parse + mammoth)
- Manual paste fallback
- User confirmation diff screen
- OpenAI fit score integration (GPT-4o-mini)
- Banded display + reasoning
- Cache fit scores per job_id
- **EOD deliverable:** user uploads CV, sees banded fit score on every job

### Day 6 — Saturday April 25: Email Alerts + PDPL
- Resend integration
- Daily digest (cron at 08:00 Gulf time)
- Quiet hours enforcement
- One-click unsubscribe
- PDPL consent UI (signup + delete-my-data flow)
- Privacy Policy + Terms of Service pages
- **EOD deliverable:** users start receiving daily digest emails

### Day 7 — Sunday April 26: Ghosting Shield + Stripe
- Auto-log applications on "Apply" click
- 14-day time-based ghost auto-flip (cron)
- "Got a reply" / "Got an interview" one-tap buttons
- Stripe checkout (14-day trial → monthly/annual)
- Stripe webhook handler (subscription.created, updated, deleted)
- **EOD deliverable:** paying user flow end-to-end

### Day 8 — Monday April 27: Dashboard Polish
- User dashboard (applications view, stats)
- Profile settings (visa status, LinkedIn URL, CV management)
- Query management (edit active alerts)
- Ghost shield stats (subtle, not traumatizing)
- **EOD deliverable:** dashboard feels like a real product

### Day 9 — Tuesday April 28: Office Hours + Status Banner
- Calendly embed for Founder Office Hours
- Zoom link in booking confirmation email
- One-line status banner on dashboard ("All systems green" / "Adzuna delayed")
- Health endpoint + Vercel cron to ping every 5 min
- **EOD deliverable:** bookings working, status visible

### Day 10 — Wednesday April 29: QA + Mobile
- Full QA pass on every screen
- Mobile-first responsiveness check (iPhone + Android Chrome)
- Lighthouse score >85 on landing page
- Sentry error monitoring wired up
- Fix any >2s API routes
- **EOD deliverable:** no known bugs, mobile polished

### Day 11 — Thursday April 30: Final Deploy + Launch Prep
- Production deploy to jobstrike.ae
- Final DNS check
- Test payment flow end-to-end with real card
- Write launch-day LinkedIn post + 3 backup posts
- Email waitlist: "We launch tomorrow"
- Load-test with 50 concurrent users
- **EOD deliverable:** soft-launch ready, go-live flag flipped

### LAUNCH — Friday May 1: Ship It
- Morning: email waitlist with live link
- Midday: LinkedIn post goes live
- Afternoon: first Office Hours session scheduled (book for May 4)
- Monitor Sentry + Supabase logs all day
- **Target:** 50 signups by EOD

---

## 10. Testing Checklist (Run Before Launch)

- [ ] Landing → query → results in <3s for 5 common queries
- [ ] Signup (magic link) works on mobile and desktop
- [ ] CV upload succeeds for: PDF, DOCX, scanned PDF, edge case
- [ ] CV manual paste fallback triggers when parse fails
- [ ] Fit score returns in <6s for uncached job
- [ ] Fit score cache hits on repeat user
- [ ] Apply button redirects to source AND logs application
- [ ] Daily digest email sends at 08:00 Gulf time
- [ ] Quiet hours prevent 22:00–07:00 emails
- [ ] Stripe checkout completes (test mode)
- [ ] Stripe webhook updates subscription status
- [ ] "Delete my data" wipes profile + cvs + applications
- [ ] All RLS policies prevent cross-user access
- [ ] No PII in logs
- [ ] Sentry catches a forced error
- [ ] Mobile Chrome + Safari render correctly
- [ ] Works in 3G throttled mode

---

## 11. Launch Day Runbook (May 1, 2026)

**06:00 Gulf:** Final health check. Verify all env vars. Confirm DNS.
**07:00:** Send waitlist email.
**09:00:** Post to LinkedIn (authentic founder voice).
**10:00:** Post to Twitter / X.
**11:00:** Share in UAE expat Facebook groups (organic).
**13:00:** Monitor Supabase + Sentry every 15 min.
**15:00:** First Office Hours session booked confirmation.
**17:00:** Daily digest test send.
**19:00:** Founder dinner. No code changes after 19:00.

**If something breaks:** fix it, redeploy, tell users. Don't hide.

---

## 12. Post-Launch Week 1-2 Priorities (May 2-15)

From v2.1 spec — ship in this order based on real user feedback:
1. First-Batch Indicator (can be approximated from Apollo job_posted_at timestamps)
2. Salary X-ray (aggregate from publisher API salary fields)
3. CV Health Check observations (gentle, dismissable)
4. Pause flow
5. UAE Hiring Pulse public dashboard
6. Recruiter Intelligence v1 (after 10k applications tracked)
7. WhatsApp Business API (if BSP approves)

Ship each on a Friday, measure for a week, then move on.

---

## 13. Build Rules

1. **Every shipped feature must have a test or a manual QA checklist entry.**
2. **No PII in logs. Ever.**
3. **Every database query goes through Supabase with RLS. No service-role in user-facing code paths.**
4. **OpenAI calls are cached by job_id + cv_id hash. Never re-bill.**
5. **If a third-party API is down, the product still works** — no single point of failure.
6. **Mobile-first.** If it doesn't work on a mid-range Android at 3G, it's not shipped.
7. **PDPL first, features second.** Never store a CV raw file for >24h.
8. **One production deploy per day.** No hotfixes after 18:00 Gulf time.

---

## End of Spec

Questions? Developer: ping the founder via Calendly booking. Founder: if you're reading this mid-build and something here is wrong, fix the spec before fixing the code.
