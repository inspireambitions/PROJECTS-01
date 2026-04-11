# JobStrike UAE — 5-Day Validation Sprint

**Dates:** Tuesday April 14 → Saturday April 18, 2026
**Objective:** Prove mid-career UAE expats will pay AED 49/month before we burn 11 days on a build
**Budget:** AED 1,500 (~USD 410)
**Owner:** Founder (solo)
**Decision Gate:** Saturday April 18 — Go/No-Go for May 1 launch

---

## Decision Rules (hit 2 of 3 to proceed)

| Gate | Target | Why |
|---|---|---|
| **Interviews** | ≥8 of 10 interviewees say "yes, I would pay AED 49/mo" AND describe the ghosting pain in their own words | If they can't articulate the pain unprompted, we haven't found the customer |
| **Landing page fake-door** | ≥3% click-through on "Start 14-day free trial" CTA (of 500+ visits) | Direct signal of purchase intent |
| **Ad cost-per-signup** | <AED 50 per waitlist signup | Validates CAC economics for post-launch paid acquisition |

**If 0 of 3 hit:** NO-GO. Kill the idea and recover AED 1,500 of learning.
**If 1 of 3 hit:** PIVOT. Spend Sunday April 19 rethinking positioning.
**If 2+ of 3 hit:** GO. Start build Monday April 20.

---

## Total Budget: AED 1,500

| Item | AED | Notes |
|---|---|---|
| LinkedIn ads (UAE + open-to-work targeting) | 500 | 5 days × AED 100/day |
| Facebook + Instagram ads (UAE expat lookalike) | 300 | 5 days × AED 60/day |
| Interview thank-you gifts | 300 | AED 30 × 10 interviewees |
| Domain + hosting (if not already live) | 200 | jobstrike.ae + Vercel |
| Miscellaneous (translations, Canva Pro, etc.) | 200 | Contingency |
| **Total** | **1,500** | |

---

## Pre-Sprint Prep (Weekend April 11–13, before Tuesday)

This is the weekend BEFORE the sprint. Do this or the sprint fails on Day 1.

### Saturday April 11 (today)
- [ ] Register jobstrike.ae domain (~AED 60/yr)
- [ ] Set up founder@jobstrike.ae email (Cloudflare Email Routing is free)
- [ ] Create a private Google Doc: "JobStrike Validation Sprint Log"

### Sunday April 12
- [ ] Build 1-page landing site on Vercel (free tier)
  - Hero: "UAE jobs, the moment they post. From AED 49/month."
  - Secondary line: "Real-time alerts + AI fit scoring + a founder who picks up the phone."
  - CTA #1: "Start 14-day free trial" → /trial (fake-door, collects email + returns "You're on the waitlist, we launch May 1")
  - CTA #2: "Talk to the founder (15 min)" → Calendly link
  - Privacy Policy + Terms of Service pages (boilerplate is fine)
- [ ] Set up PostHog (self-hosted or free cloud) — track landing visits + CTA clicks
- [ ] Apply to Adzuna, Jooble, CareerJet publisher APIs (see Appendix E)

### Monday April 13
- [ ] Finalize interview guide (Appendix A)
- [ ] Draft 3 ad creative variants (Appendix B)
- [ ] Create LinkedIn + Facebook ad accounts, add payment method
- [ ] Write "interview outreach DM" template (Appendix C)
- [ ] Identify 30 mid-career UAE expats on LinkedIn to approach (target: 50% response rate → 15 conversations → 10 interviews)
- [ ] Test the landing page end-to-end on mobile + desktop
- [ ] Go to bed early

---

## Day 1 — Tuesday April 14

### Morning (09:00 – 12:00)
- [ ] 09:00: Go-live check — landing page loads, analytics tracking, email capture works
- [ ] 09:30: Launch LinkedIn ad campaign (AED 100 budget for day)
  - Campaign name: "JS-VAL-D1-LinkedIn"
  - Audience: UAE residents, job title contains "manager/director/lead/senior", industry: varied
  - Creative variant A (see Appendix B)
- [ ] 10:00: Launch Facebook + Instagram ads (AED 60 budget for day)
  - Campaign name: "JS-VAL-D1-Meta"
  - Audience: UAE expats, age 28–45, interests include "career change" or "job search"
- [ ] 10:30: Send 20 LinkedIn DM outreach messages (Appendix C template)
- [ ] 11:00: Interview #1 (if booked from pre-sprint outreach) — 30 min recorded via Zoom or phone

### Afternoon (14:00 – 17:00)
- [ ] 14:00: Interview #2 (if booked)
- [ ] 15:00: Check first ad metrics (impressions, clicks, CTR, cost per click)
- [ ] 15:30: Tweak ad if CTR <0.5% (swap headline)
- [ ] 16:00: Send 15 more LinkedIn DMs to fill Day 2-3 interview slots
- [ ] 16:30: Log into PostHog — verify events firing

### Evening (20:00 – 21:00)
- [ ] Daily log entry in Google Doc:
  - Visits to landing: _
  - CTA clicks: _
  - Waitlist signups: _
  - Cost per signup: AED _
  - Interviews completed: _
  - Top insight of the day: _
- [ ] Bed by 22:00

**Target EOD:** 2 interviews done, 200+ ad impressions, 5+ waitlist signups

---

## Day 2 — Wednesday April 15

### Morning (09:00 – 12:00)
- [ ] 09:00: Review overnight ad performance
- [ ] 09:30: Scale winning ad variant (+50% budget)
- [ ] 10:00: Interview #3
- [ ] 11:00: Interview #4

### Afternoon (14:00 – 17:00)
- [ ] 14:00: Interview #5 (if booked)
- [ ] 15:00: Start Tier 2 ATS feasibility study (see Appendix D) — 5 target companies
- [ ] 16:00: Send 10 more LinkedIn DMs for Day 4-5 interview slots

### Evening (20:00 – 21:00)
- [ ] Daily log entry
- [ ] Review interview themes: what pain points keep coming up?

**Target EOD:** 5 interviews done total, 500+ ad impressions cumulative, 10+ waitlist signups

---

## Day 3 — Thursday April 16

### Morning (09:00 – 12:00)
- [ ] 09:00: Ad scaling review. Kill losers. Double winners.
- [ ] 10:00: Interview #6
- [ ] 11:00: Interview #7

### Afternoon (14:00 – 17:00)
- [ ] 14:00: Interview #8
- [ ] 15:00: Continue ATS feasibility study — 10 more companies (Appendix D)
- [ ] 16:00: Check total waitlist signups vs target

### Evening
- [ ] Daily log entry
- [ ] Mid-sprint mini-retro: are the decision gates trending toward GO or NO-GO?

**Target EOD:** 8 interviews done, 1,000+ ad impressions cumulative, 15+ waitlist signups

---

## Day 4 — Friday April 17 — Synthesis Day

Morning is for final interviews. Afternoon is for writing.

### Morning (09:00 – 12:00)
- [ ] 09:00: Interview #9
- [ ] 10:00: Interview #10
- [ ] 11:00: Final ATS feasibility check — any gaps in coverage?

### Afternoon (13:00 – 19:00) — Synthesis
- [ ] 13:00: Transcribe / extract key quotes from all 10 interviews
- [ ] 14:30: Tag quotes by theme (pain, pricing, feature asks, objections)
- [ ] 15:30: Pull full ad metrics from LinkedIn + Meta
- [ ] 16:30: Write the Decision Brief (Appendix F)
- [ ] 18:00: Sleep on it

**Target EOD:** Decision brief draft ready

---

## Day 5 — Saturday April 18 — Go/No-Go Day

### Morning (09:00 – 13:00)
- [ ] 09:00: Re-read Decision Brief with fresh eyes
- [ ] 09:30: Score each of the 3 decision gates honestly (no hedging)
- [ ] 10:00: If GO: commit. Tell the waitlist the launch date is confirmed for May 1.
- [ ] 10:00: If NO-GO or PIVOT: write what you learned. Save the money.
- [ ] 11:00: Either way — pay for the Domain + any Apollo enrichment owed
- [ ] 12:00: Publish a LinkedIn post about the validation sprint outcome (honesty builds trust)

### Afternoon
- [ ] 14:00: If GO, start Day 1 prep for build sprint (read SPEC_v2.2.md cover to cover)
- [ ] 16:00: Rest. Sunday is a proper rest day before the 11-day build sprint starts Monday.

---

## Appendix A — Interview Guide (10 questions, 30 min)

**Intro (2 min):** "Thanks for taking time. I'm building something for UAE expats on the job hunt and want your honest reactions — it's not a pitch. I'll record for my notes, is that OK?"

1. "Walk me through the last time you seriously looked for a new job in the UAE. What did a typical day of searching look like?" *(listen for: pain points, platforms used, time spent)*
2. "Which job sites or apps did you use? Which one did you check most often?" *(Bayt, LinkedIn, NaukriGulf, GulfTalent, etc.)*
3. "Once you applied to a role, how often did you hear back — and how long did it take?" *(listen for ghosting pain in their words)*
4. "When you DID get no response, what did that feel like? What did you do about it?"
5. "If I told you a tool could tell you about a new UAE job within 10–15 minutes of it being posted — before most applicants see it — what would that be worth to you?"
6. "What about a tool that scores your CV against the job and tells you why you'd be a good fit — or a bad one?"
7. "I'm thinking of charging AED 49/month for this, with a 14-day free trial. Does that feel: fair / expensive / cheap / what?" *(shut up and let them answer)*
8. "What would stop you from paying for this?" *(objections gold)*
9. "If I built this exactly as described, would you want to be one of the first 100 users? If yes, can I add your email to the waitlist right now?" *(CLOSE)*
10. "Who else in your network is job hunting in the UAE and might want to talk to me?" *(referrals)*

**Red flags during interview:**
- They can't name a specific time they were ghosted (problem isn't real for them)
- They say "nice idea" but won't give email (soft no)
- They only use LinkedIn and don't care about other sources (wrong ICP)

**Green flags:**
- They interrupt you to describe their own ghosting pain
- They volunteer "I'd pay more than that"
- They ask "when can I have it?"
- They refer you to 2+ other people

---

## Appendix B — Ad Creative (3 Variants to Test)

### Variant A — Pain-First
**Headline:** Tired of Applying to UAE Jobs and Hearing Nothing?
**Body:** 84% of UAE job applications are ghosted. JobStrike UAE sends you jobs the moment they post, scores your CV against them, and shows you when you're in the first batch recruiters actually read. From AED 49/month.
**CTA:** Start 14-day free trial

### Variant B — Speed-First
**Headline:** UAE Jobs, the Moment They Post.
**Body:** Be applicant #4, not #240. Real-time alerts from 6 UAE sources + AI fit scoring built for mid-career expats. Web-first. UAE-only. Weekly live access to a UAE HR insider. From AED 49/month.
**CTA:** Start 14-day free trial

### Variant C — Founder-Voice (organic LinkedIn post, not paid ad)
"I spent 10+ years inside UAE HR teams. Here's what nobody tells job seekers: the first 20 applicants get read. The next 200 get ghosted. If your CV shows up in hour 6 instead of hour 18, your chances triple. I'm building a tool to fix that. It goes live May 1. Comment 'interested' and I'll put you on the waitlist."

Run A and B as paid ads. Post C on founder's personal LinkedIn for organic reach.

---

## Appendix C — LinkedIn DM Outreach Template

**Subject:** Quick question (UAE job hunting research)

**Body:**
> Hi [Name],
>
> I'm building a tool for mid-career UAE expats on the job hunt (I used to work in HR here for 10+ years) and I'm doing user research this week — not a pitch.
>
> Could I grab 30 minutes with you on Zoom or phone between Tuesday and Thursday to ask about your last job search? I'm happy to buy you a coffee afterwards (Careem Pay AED 30 voucher).
>
> Totally fine if you're busy — no hard feelings.
>
> Cheers,
> [Founder name]

**Follow-up after 48h if no reply:** "Just bumping this in case it got lost — no pressure."

---

## Appendix D — Tier 2 ATS Feasibility Study (20 Employers)

Use the **top 50 hot-growth list** from `apollo-top50-hot-growth.jsonl`. For each, do this in <5 min:

1. Visit company careers page
2. Open DevTools → Network tab
3. Identify ATS hostname: `boards.greenhouse.io/*`, `jobs.lever.co/*`, `api.ashbyhq.com/*`, `*.myworkdayjobs.com/*`, `api.smartrecruiters.com/*`
4. Record in table:

| # | Company | Careers URL | ATS | Slug | Endpoint returns 200? | # roles visible |

**Target:** 10 of 20 reachable via public ATS endpoints.
**If <5 of 20:** data source strategy needs rework (bigger problem).

---

## Appendix E — Publisher API Applications (Do on Sunday April 12)

### Adzuna
- URL: developer.adzuna.com
- Fill application form (name, app name, description: "JobStrike UAE — pre-launch job alert service for mid-career UAE expats")
- Approval: usually instant for developer tier
- Expected credits: free tier sufficient for validation

### Jooble
- URL: jooble.org/api/about
- Apply as publisher
- Approval: 1–7 days manual review
- Say: "Pre-launch, projected 500 paying users by month 6, UAE-exclusive"

### CareerJet
- URL: partners.careerjet.com
- Apply as affiliate
- Approval: 1–7 days
- Needs: working website URL (jobstrike.ae landing page must be live first)

**If any reject:** you still have Adzuna + direct ATS endpoints. Don't block on them.

---

## Appendix F — Decision Brief Template (Friday April 17 afternoon)

Copy-paste this into your Google Doc on Friday.

```
JOBSTRIKE UAE — VALIDATION DECISION BRIEF
Date: 2026-04-17
Decision: [GO / NO-GO / PIVOT]

GATE 1 — Interviews
Completed: X of 10
"Would pay AED 49/mo" count: X / 10
Described pain unprompted: X / 10
Verdict: [PASS / FAIL]

GATE 2 — Landing page
Total visits: X
CTA clicks: X
CTR: X%
Target: ≥3%
Verdict: [PASS / FAIL]

GATE 3 — Paid acquisition
Total ad spend: AED X
Waitlist signups from ads: X
Cost per signup: AED X
Target: <AED 50
Verdict: [PASS / FAIL]

DECISION: [GO / NO-GO / PIVOT]
Gates hit: X of 3

TOP 3 INSIGHTS (verbatim quotes if possible):
1. ...
2. ...
3. ...

TOP 3 OBJECTIONS:
1. ...
2. ...
3. ...

TOP 3 FEATURE ASKS:
1. ...
2. ...
3. ...

PIVOT OPTIONS (only if GATE failed):
- Different ICP? (entry-level / senior / emiratis)
- Different price? (AED 29? AED 99?)
- Different channel? (WhatsApp-first instead of email-first)
- Different wedge? (salary transparency instead of job alerts)

COMMITMENT:
If GO: I commit to the 11-day build sprint starting Monday April 20.
If NO-GO: I commit to not sinking another AED into this idea without a new thesis.

Signed: [Founder]
```

---

## End of Validation Plan

This plan is execution-ready. Print it. Tape it to the wall. Do not improvise.
