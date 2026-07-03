# Claude Code Online Setup

This folder now lives inside the authorised Claude Code online repo `inspireambitions/projects-01` at `resend-newsletter-ops/`.

Claude Code online runs in Anthropic's cloud. It does not see files, keys, or settings from Kim's laptop unless they are committed to the repo or added to the Claude Code online environment.

## 1. Put This Folder In GitHub

Create a private GitHub repo, then upload this folder's files.

Recommended repo name:

```text
resend-newsletter-ops
```

Do not upload `.env` or anything inside `exports/`.

## 2. Connect The Repo In Claude Code Online

Go to:

```text
https://claude.ai/code
```

Connect GitHub, then select `inspireambitions/projects-01`.

## 3. Create The Cloud Environment

In the Claude Code online environment settings, add:

```text
RESEND_API_KEY=re_xxxxxxxxxxxxxxxxx
RESEND_API_BASE=https://api.resend.com
```

Use the real Resend API key. Do not put quotes around the values.

Important: Claude Code online currently stores environment variables in the environment configuration. People who can edit that environment can see them. Keep access limited.

## 4. Network Access

The script must call Resend at:

```text
api.resend.com
```

Use one of these settings:

- Network access: Full
- Or Network access: Custom, add `api.resend.com`, and include the default package-manager allowlist

The script uses only Python standard library, so no package install is needed.

## 5. First Online Task Prompt

Use this prompt in Claude Code online:

```text
Read CLAUDE.md first. Confirm Resend access with `python resend_newsletter.py check`, then export the current Resend newsletter state with `python resend_newsletter.py export-all`. Find the welcome sequence email that discusses gratuity or end-of-service benefits. Do not edit live. Show me the exact email you found, the subject, the template ID, and the smallest before/after wording change to redirect job seekers who have not landed a role yet.
```

## 6. Live Edit Rule

Claude may only update or publish a Resend template after Kim approves the exact before and after copy.

Live update command pattern:

```powershell
python resend_newsletter.py update-template TEMPLATE_ID --html-file PATH_TO_BODY_HTML --text-file PATH_TO_BODY_TXT --apply --approved
```

Publish command pattern:

```powershell
python resend_newsletter.py publish-template TEMPLATE_ID --apply --approved
```

