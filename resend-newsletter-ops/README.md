# Resend Newsletter Ops

Reusable local tools for Claude Code to review and improve the Resend newsletter setup.

Permanent folder:

```text
C:\Users\Kim\Documents\Newsletter\resend-newsletter-ops
```

## Setup

1. Open PowerShell in this folder.
2. Run:

```powershell
.\set-resend-key.ps1
```

3. Paste the Resend API key into the hidden prompt.
4. Run:

```powershell
python .\resend_newsletter.py check
python .\resend_newsletter.py list-automations
python .\resend_newsletter.py export-all
python .\resend_newsletter.py find gratuity "end of service" job hunting CV scam
```

## Safety Rule

Commands that read or export are safe. Commands that change Resend require both `--apply` and `--approved`.

Do not change live automations, templates, contacts, sending settings, or campaigns without Kim's explicit approval of the exact before and after copy.

## Claude Code

Open Claude Code in this folder. It will read `CLAUDE.md` and use `resend_newsletter.py` for Resend access.

## Claude Code Online

See CLAUDE_CODE_ONLINE_SETUP.md. For online use, commit this folder to a private GitHub repo, then add RESEND_API_KEY in the Claude Code online environment. 

