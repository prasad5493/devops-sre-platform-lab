#!/usr/bin/env bash
set -euo pipefail

echo "===== BASIC SERVER INFORMATION ====="
hostnamectl || true
uptime || true

echo ""
echo "===== DISK USAGE ====="
df -h || true

echo ""
echo "===== MEMORY USAGE ====="
free -h || true

echo ""
echo "===== TOP PROCESSES BY MEMORY ====="
ps aux --sort=-%mem | head -10 || true

echo ""
echo "===== NGINX STATUS ====="
if command -v systemctl >/dev/null 2>&1; then
  systemctl status nginx --no-pager || true
fi

echo ""
echo "===== RECENT SYSTEM LOGS ====="
if command -v journalctl >/dev/null 2>&1; then
  journalctl -n 50 --no-pager || true
fi

echo ""
echo "===== HTTP HEALTH CHECK ====="
if command -v curl >/dev/null 2>&1; then
  curl -I --max-time 5 http://localhost/health || true
else
  echo "curl is not installed."
fi
