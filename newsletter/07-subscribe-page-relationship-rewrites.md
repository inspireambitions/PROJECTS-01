# Subscribe page relationship rewrites — before/after drafts

Status: APPLIED LIVE 2026-07-03 with Kim's approval (all five edits, plus
rebrand: badge "THE HOSPITALITY MEMO / The Hospitality Career Network" and
hero eyebrow updated; meta title change pending WPVibe approval panel).
Key discovery during application: Snippet 86's handler already accepts
`name` (Resend firstName) and `interests` (memo_interests property + event
payload), so NO snippet edit was needed — the form change was pure page
HTML/CSS. This also confirmed the provider path: the subscribe forms are
rebound by Snippet 86 JS to `ia_resend_subscribe`, which writes to Resend
and fires hospitality_memo.subscribed. Resend IS the live backend; the
Sendy-style hidden fields (list/subform) are vestigial.
Caveats: (1) the journey radio is not enforced by the snippet's JS
validation (HTML `required` is neutralised by novalidate), so it is
effectively optional — enforcing it would need a small snippet JS change;
(2) Kim should run one real test signup to confirm the contact lands in
Resend with first name + memo_interests and the welcome run triggers.
Goal: shift the page from credibility to connection, per Kim's stated aim
(relationship, loyal fans, pain points readers actually carry).

Finding: the live page contains em dashes throughout, which breaks the
project's own no-em-dash rule for public copy. These rewrites remove them
in every section they touch. A full-page sweep of remaining em dashes can
be a separate approved pass.

## Edit 1 — Signup card (hero form)

BEFORE:
> Start this Sunday.
> Join free and get the next Memo — plus a 7-email welcome series that
> gets you oriented fast, wherever you're reading from.
> [email field] [Join The Hospitality Memo]
> No agent fees. No job-selling. Just honest career help.
> Every other Sunday. Practical. No spam. Unsubscribe anytime.

AFTER:
> Your first email arrives in minutes.
> Join free. The 7-email welcome series starts now, and the next Memo
> lands this Sunday.
> [first name field: "Your first name"]
> [email field: "Your email address"]
> Where are you on the journey? (required, one tap)
> ( ) I'm already in the Gulf   ( ) I'm planning my move from home
> [Join The Hospitality Memo]
> No agent fees. No job-selling. Just honest career help.
> Then reply to your first email with the one career question on your
> mind. Kim reads and answers every reply.
> Every other Sunday. Practical. No spam. Unsubscribe anytime.

Technical dependency: adds two fields; touches Snippet 86 (Resend
bridge). First name maps to Resend's native first-name field; journey
answer becomes a contact property/tag for future branching. Back up the
snippet before editing; run a full live signup test after (desktop and
mobile, contact created in Resend, welcome run starts). Mirror the same
fields on the bottom form.

## Edit 2 — "Already in the Gulf" lane

BEFORE:
> Move up — on purpose.
> For you if you're in a hotel, restaurant, resort or events team in the
> UAE or wider GCC and you want your next move to be a decision, not an
> accident.
> - Position yourself so internal transfers and public promotions find
>   you first
> - Walk into salary and review conversations prepared, not hopeful
> - Stay visible to the people who decide who moves up
> - Read the labour-law and contract changes that actually affect you

AFTER:
> Working hard and still invisible?
> For you if you are in a hotel, restaurant, resort or events team in the
> UAE or wider GCC, doing good work that nobody above your manager seems
> to notice.
> - Promotions are decided in rooms you are not in. Learn how those
>   decisions really get made
> - Stop guessing what you are worth. Walk into salary talks knowing your
>   number and your rights
> - Be the name that comes up when a spot opens, before it is ever
>   advertised
> - Know the contract and labour-law changes that affect your pay before
>   they affect you

## Edit 3 — "Planning your move" lane (light touch)

BEFORE:
> Land the right job — not a scam.
> For you if you're back home — in Manila, Lagos, Nairobi, Delhi,
> Kampala, Kathmandu — and you want a real Gulf hospitality career, built
> the right way.

AFTER:
> Land the right job, not a scam.
> For you if you are back home in Manila, Lagos, Nairobi, Delhi, Kampala
> or Kathmandu, tired of applying into silence and unsure who to trust.

Bullets in this lane stay unchanged.

## Edit 4 — "Behind the Memo" bio

BEFORE:
> Written by Kim Kiyingi — an HR career specialist with 20+ years across
> luxury hospitality, career development, training, coaching and people
> operations. No agents, no gatekeepers — just the real frameworks hiring
> teams use in the Gulf, delivered to your inbox twice a month.

(Note: live text still says "twice a month" here; this rewrite completes
that cadence fix.)

AFTER:
> I'm Kim Kiyingi. I have spent more than 20 years on the hiring side of
> luxury hospitality and people operations. I have sat in the rooms where
> promotions get decided and where a CV gets six seconds. I got tired of
> watching good people stay invisible for fixable reasons, so I write the
> Memo. No agents, no gatekeepers, just how hiring really works in the
> Gulf, every other Sunday.

Recommendation alongside: replace the "K" letter avatar with a real
photo of Kim (asset needed from Kim).

## Edit 5 — Sample Field Note

BEFORE:
> Already in the Gulf? Before your next shift starts, drop a precise,
> professional note to your department head: "As we approach our next
> peak operational cycle, I'd like to formally state my interest in being
> considered for upcoming leadership tracks or internal openings through
> the proper channels." It keeps you top-of-mind, on the record, and
> ahead of outside applicants.
>
> Applying from abroad? Stop fighting the algorithm on crowded job
> portals. Identify the specific global chains expanding their regional
> footprint right now, target their internal talent-acquisition teams
> directly, and introduce your global experience as a solution to their
> upcoming peak-season demand — not just another application.

AFTER:
> Already in the Gulf? Before your next shift, say one thing to your
> department head: "Before the busy season starts, I want you to know I
> am interested in the team leader spot when it opens. What would I need
> to show you?" Ten seconds. You are now on the record, ahead of any
> outside applicant.
>
> Applying from abroad? Stop fighting the crowd on the big job portals.
> Pick two or three chains opening properties in the Gulf right now, go
> to their own careers pages, and apply direct. Then follow up, by name.
> One direct, specific application beats twenty portal clicks.

## Suggested application order once approved

1. Edits 2–5: plain content edits on page 428, low risk, apply via
   surgical content edits and verify live.
2. Edit 1: copy plus form mechanics. Back up Snippet 86 first, apply,
   then run the full capture test (both forms, desktop and mobile,
   Resend contact created with name and journey tag, welcome run
   triggers).
