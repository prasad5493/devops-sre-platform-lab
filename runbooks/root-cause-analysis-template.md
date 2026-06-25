# Root Cause Analysis Template

## Incident title

Example: Website unavailable due to stopped Nginx service

## Date and time

Start time:
End time:
Duration:

## Impact

Who was affected?
What service was affected?
How serious was it?

## Root cause

What was the real reason for the issue?

Example:

Nginx stopped after a bad configuration change.

## Detection

How was the issue found?

Example:

The health check failed and the CloudWatch alarm triggered.

## Resolution

What fixed the issue?

Example:

We rolled back the config and restarted Nginx.

## What went well

- Health check detected the issue quickly.
- Runbook helped with troubleshooting.

## What can be improved

- Add config validation before deployment.
- Add automated rollback.

## Action items

| Action | Owner | Due date | Status |
|---|---|---|---|
| Add Nginx config test in CI | DevOps | TBD | Open |
| Improve alert message | DevOps | TBD | Open |
