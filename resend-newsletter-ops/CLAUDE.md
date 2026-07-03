# Claude Code Instructions: Resend Newsletter

This folder gives Claude Code access to Kim's Resend newsletter through the Resend REST API.

## Non-negotiable Rules

- Do not print, store in chat, or commit `RESEND_API_KEY`.
- Do not publish, send, schedule, import contacts, activate campaigns, or change live account settings without Kim's explicit approval.
- Before any live edit, show Kim the exact before and after copy.
- For public copy, use British English, short sentences, active voice, and no em dashes.
- In public content, refer to Kim as `HR Career Specialist`, not by any actual job title.
- Do not include employer data or identifiable colleague examples.


## Newsletter Front Door

The public subscribe page is:

https://inspireambitions.com/subscribe/

Read `NEWSLETTER_CONTEXT.md` before editing Resend content. The subscribe page currently says subscriber details go to Sendy, while Resend contains `The Hospitality Memo Welcome Sequence`. Verify that provider path before assuming Resend is what the public form triggers.

## Normal Workflow

1. Confirm API access:

```powershell
python .\resend_newsletter.py check
```

2. Export current Resend state:

```powershell
python .\resend_newsletter.py export-all
```

3. Find the relevant welcome email or template:

```powershell
python .\resend_newsletter.py find gratuity "end of service" job hunting CV scam
```

4. Read the exported `body.html`, `body.txt`, and `template.json`.
5. Draft the smallest useful edit.
6. Show Kim exact before and after.
7. Only after Kim approves, update the template:

```powershell
python .\resend_newsletter.py update-template TEMPLATE_ID --html-file PATH_TO_BODY_HTML --text-file PATH_TO_BODY_TXT --apply --approved
```

8. If the template needs publishing and Kim approved the final version:

```powershell
python .\resend_newsletter.py publish-template TEMPLATE_ID --apply --approved
```

## Current Welcome Sequence Fix

Goal: find the email that leads with gratuity or end-of-service, likely part of the welcome sequence, and add a short redirect near the top for job seekers who have not landed a role yet.

Draft direction:

`This one's for after you've landed the role. If you're still job hunting, start here instead: [link to the CV-fix email or the scam-warning email].`

Do not use that line blindly. Match the actual email tone once the template body is visible, and pick the best internal link from the exported sequence.

