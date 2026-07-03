# Projects 01

Claude Code authorised workspace for Inspire Ambitions projects.

## Newsletter Access

The Resend newsletter helper lives in:

```text
resend-newsletter-ops/
```

For the Hospitality Memo welcome-sequence task, Claude Code should read:

1. `resend-newsletter-ops/CLAUDE.md`
2. `resend-newsletter-ops/NEWSLETTER_CONTEXT.md`
3. `resend-newsletter-ops/resend_newsletter.py`

Then it should run only read/export commands until Kim approves exact wording for any live change.

Required environment variables in Claude Code online:

```text
RESEND_API_KEY
RESEND_API_BASE=https://api.resend.com
```
