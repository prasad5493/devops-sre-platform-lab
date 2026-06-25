#!/usr/bin/env python3
"""Simple website health check script.

Usage:
    python3 scripts/health_check.py https://example.com
"""

from __future__ import annotations

import argparse
import sys
import time
from urllib.error import HTTPError, URLError
from urllib.request import Request, urlopen


def check_url(url: str, timeout: int) -> int:
    """Check a URL and return a shell-friendly exit code."""
    request = Request(url, headers={"User-Agent": "devops-sre-platform-lab/1.0"})
    start = time.perf_counter()

    try:
        with urlopen(request, timeout=timeout) as response:
            elapsed_ms = round((time.perf_counter() - start) * 1000, 2)
            status_code = response.status
            print(f"URL: {url}")
            print(f"Status code: {status_code}")
            print(f"Response time: {elapsed_ms} ms")

            if 200 <= status_code < 400:
                print("Result: healthy")
                return 0

            print("Result: unhealthy")
            return 2

    except HTTPError as error:
        print(f"Result: unhealthy - HTTP error {error.code}")
        return 2
    except URLError as error:
        print(f"Result: unhealthy - connection error: {error.reason}")
        return 2
    except TimeoutError:
        print("Result: unhealthy - request timed out")
        return 2


def main() -> int:
    parser = argparse.ArgumentParser(description="Check if a website is healthy.")
    parser.add_argument("url", help="Website URL to check, for example https://example.com")
    parser.add_argument("--timeout", type=int, default=5, help="Timeout in seconds")
    args = parser.parse_args()

    return check_url(args.url, args.timeout)


if __name__ == "__main__":
    sys.exit(main())
