# Newsletter Context

Public subscribe page:

https://inspireambitions.com/subscribe/

This page is the front door for The Hospitality Memo.

Live page summary checked on 2026-07-03:

- Title: The Hospitality Memo
- Positioning: weekly briefing for hospitality professionals across the UAE and GCC
- Promise: salaries, hiring trends, labour rights, and moves shaping the reader's next role
- Frequency: one free email a week
- Audience: hospitality professionals across the UAE and GCC
- Signup fields visible on the public page: first name, email address, consent to email, age confirmation
- Current public provider wording says the form submits details to Sendy, not Resend

Important mismatch to investigate:

Resend API access shows an automation named `The Hospitality Memo Welcome Sequence`, but the public subscribe page says the signup form submits to Sendy. Before changing live welcome-sequence content, verify whether new subscribers from the subscribe page currently enter Sendy, Resend, or a migration bridge between them.

Working rule:

Treat the subscribe page as the public source of truth for reader-facing promise and positioning. Treat Resend as the email-sequence backend only after confirming the subscription path sends people there.

Do not edit the live subscribe page, Resend templates, automations, forms, or provider settings without Kim approving the exact before and after.
