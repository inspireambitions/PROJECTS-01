# TASK: Schedule 10 LinkedIn posts for Inspire Ambitions

You are an agent with browser control running on the account owner's machine,
where Chrome is already logged into LinkedIn as
https://www.linkedin.com/in/inspire-ambitions-3056b0320/
Do NOT ask for, store, or type any password. If LinkedIn is not logged in,
stop and tell the owner to log in first. If LinkedIn shows a CAPTCHA or
verification challenge at any point, stop and hand back to the owner.

## Goal

Queue 10 posts using LinkedIn's native post scheduler (clock icon on the
post composer). One post per day, starting tomorrow. All content is in this
repo folder (`linkedin/`). Do not edit the copy. Do not add hashtags or links.

## Step 0 — Prepare assets (once)

Three posts are PDF carousels. Download each PDF first:

1. Open https://www.canva.com/d/hGJXrlwk6eqkiMv  → Share → Download → PDF Standard → save as `post-001.pdf`
2. Open https://www.canva.com/d/FBLItPE5LNJ1NXR → Share → Download → PDF Standard → save as `post-006.pdf`
3. Open https://www.canva.com/d/k4V-su8zAtmFCds  → Share → Download → PDF Standard → save as `post-010.pdf`

(Canva must be logged in as the owner; if not, stop and ask them to log in.)

Two posts are native videos that require HeyGen renders (scripts 002 and 022).
If the owner has not provided `post-004.mp4` / `post-009.mp4`, SKIP those two
scheduling slots and apply the swap rule in the schedule below.

## Step 1 — The schedule

All times are Gulf Standard Time (UTC+4). When LinkedIn's scheduler shows a
different timezone, convert so the local wall-clock time in Dubai matches.

| # | Date | Time GST | Type | Copy source (in `linkedin/`) | Attachment |
|---|------|----------|------|------------------------------|------------|
| 001 | Sat 25 Jul 2026 | 09:00 | Document | `post-001-visa-fee-red-flag.md` → "Post copy" section | post-001.pdf, document title: "The 5-minute job offer check" |
| 002 | Sun 26 Jul | 09:00 | Text | `week-1-posts.md` → Post 002 | none |
| 003 | Mon 27 Jul | 07:45 | Text | `week-1-posts.md` → Post 003 | none |
| 004 | Tue 28 Jul | 07:45 | Video | `week-1-posts.md` → Post 004 (copy only, not the instruction line) | post-004.mp4 if provided; else swap: schedule Post 005 here |
| 005 | Wed 29 Jul | 07:45 | Text | `week-1-posts.md` → Post 005 | none |
| 006 | Thu 30 Jul | 07:45 | Document | `week-2-posts.md` → Post 006 post copy | post-006.pdf, title: "Stop saying I don't know" |
| 007 | Fri 31 Jul | 09:00 | Text | `week-2-posts.md` → Post 007 (main post only, NOT the follow-up block) | none |
| 008 | Sat 1 Aug | 09:00 | Text | `week-2-posts.md` → Post 008 | none |
| 009 | Sun 2 Aug | 09:00 | Video | `week-2-posts.md` → Post 009 | post-009.mp4 if provided; else swap: schedule Post 010 here |
| 010 | Mon 3 Aug | 07:45 | Document | `week-2-posts.md` → Post 010 post copy | post-010.pdf, title: "Stop saying you have to wait" |

SWAP RULE (missing video): shift every later post up one day, keeping each
post's original time-of-day rule (weekday 07:45, Sat/Sun/Fri 09:00). Leave no
empty days. Report the final mapping to the owner.

## Step 2 — Per-post procedure (repeat 10×)

1. Go to https://www.linkedin.com/feed/ → "Start a post".
2. Paste the exact copy from the source file. Preserve line breaks and blank
   lines — they are intentional formatting. Copy everything from the hook line
   through the final parenthetical disclaimer. Do NOT include markdown headers,
   the "Upload the HeyGen render…" instruction lines, or the follow-up blocks.
3. Document posts: click the document icon → upload the PDF → set the document
   title given in the table.
4. Video posts: click the video icon → upload the MP4 → confirm captions are
   burned in (they are part of the render; do not add LinkedIn captions).
5. Click the clock icon (bottom-right of composer) → set date and time from
   the table → Schedule.
6. Verify it appears under Scheduled posts, then continue to the next.

## Step 3 — Verify and report

1. Open the Scheduled posts view (composer → clock icon → "View all scheduled posts").
2. Confirm the count matches (10, or 8 + reported swaps).
3. Report back: a list of each scheduled post with its date/time, plus any
   slots skipped or swapped and why. Do not mark this task complete unless the
   scheduled-posts screen actually shows the posts.

## Standing notes for the owner (not for the agent to act on)

- Post 007 has a follow-up answer in `week-2-posts.md` to post as a pinned
  comment around 13:00 GST on 31 July — LinkedIn cannot schedule comments;
  set a phone reminder.
- Engagement ritual per `posting-schedule.md`: 15 min of commenting on large
  GCC hospitality accounts before each go-live; reply to every comment in the
  first hour.
