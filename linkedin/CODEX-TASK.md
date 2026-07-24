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

## Step 0 — Assets (already prepared)

Everything is finished and committed in `linkedin/ready-to-upload/`:
the three carousel PDFs (`post-001.pdf`, `post-006.pdf`, `post-010.pdf`) and one
paste-ready `.txt` per post. Use those files directly — no Canva access, no
downloads, no edits. `ready-to-upload/README.md` is the authoritative manifest.

Two posts are native videos that require HeyGen renders (scripts 002 and 022).
If the owner has not provided `post-004.mp4` / `post-009.mp4`, SKIP those two
scheduling slots and apply the swap rule in the schedule below.

## Step 1 — The schedule

All times are Gulf Standard Time (UTC+4). When LinkedIn's scheduler shows a
different timezone, convert so the local wall-clock time in Dubai matches.

All copy sources and attachments below live in `linkedin/ready-to-upload/`.

| # | Date | Time GST | Type | Paste (verbatim) | Attachment |
|---|------|----------|------|------------------|------------|
| 001 | Sat 25 Jul 2026 | 09:00 | Document | post-001.txt | post-001.pdf, document title: "The 5-minute job offer check" |
| 002 | Sun 26 Jul | 09:00 | Text | post-002.txt | none |
| 003 | Mon 27 Jul | 07:45 | Text | post-003.txt | none |
| 004 | Tue 28 Jul | 07:45 | Video | post-004-video-caption.txt | owner-provided post-004.mp4; if absent, apply swap rule |
| 005 | Wed 29 Jul | 07:45 | Text | post-005.txt | none |
| 006 | Thu 30 Jul | 07:45 | Document | post-006.txt | post-006.pdf, title: "Stop saying I don't know" |
| 007 | Fri 31 Jul | 09:00 | Text | post-007.txt (post-007-pinned-comment.txt is a comment for the owner later, NOT a post) | none |
| 008 | Sat 1 Aug | 09:00 | Text | post-008.txt | none |
| 009 | Sun 2 Aug | 09:00 | Video | post-009-video-caption.txt | owner-provided post-009.mp4; if absent, apply swap rule |
| 010 | Mon 3 Aug | 07:45 | Document | post-010.txt | post-010.pdf, title: "Stop saying you have to wait" |

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
