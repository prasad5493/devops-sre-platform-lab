# Incident Response Runbook

This runbook explains what to do when the web service is unhealthy.

## 1. Confirm the problem

Check the website:

```bash
python3 scripts/health_check.py http://SERVER_URL/health
```

Check if users are affected:

- Is the website down for everyone?
- Is it slow or fully unavailable?
- Did the issue start after a recent change?

## 2. Check the server

Run:

```bash
bash scripts/linux_troubleshooting.sh
```

Look for:

- High CPU
- High memory usage
- Full disk
- Nginx stopped
- Error logs

## 3. Restore service

Possible actions:

```bash
sudo systemctl restart nginx
sudo systemctl status nginx
curl -I http://localhost/health
```

If the latest deployment caused the issue, roll back to the previous known good version.

## 4. Communicate

Give clear updates:

- What is affected?
- When did it start?
- What are we doing now?
- When will the next update be?

## 5. Write RCA after recovery

Use `root-cause-analysis-template.md`.
