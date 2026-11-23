#!/usr/bin/env python3
"""Resume the cluster triage, then run every remaining exact script hash."""

from __future__ import annotations

import argparse
import subprocess
import sys
import time
from pathlib import Path


REPO = Path(__file__).resolve().parent.parent


def benchmark_running(pid: int) -> bool:
    process = subprocess.run(["ps", "-p", str(pid), "-o", "command="],
                             capture_output=True, text=True)
    return process.returncode == 0 and "LiveScripts/benchmark.py" in process.stdout


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cohort", default="2026-11-23")
    parser.add_argument("--z3", type=Path, required=True)
    parser.add_argument("--timeout", type=int, default=25)
    parser.add_argument("--workers", type=int, default=4)
    parser.add_argument("--wait-pid", type=int,
                        help="Wait for an already-running cluster pass before resuming")
    args = parser.parse_args()
    if args.wait_pid:
        print(f"Waiting for cluster pass PID {args.wait_pid}", flush=True)
        while benchmark_running(args.wait_pid):
            time.sleep(15)
    base = [sys.executable, "LiveScripts/benchmark.py", "--cohort", args.cohort,
            "--z3", str(args.z3), "--timeout", str(args.timeout),
            "--workers", str(args.workers), "--skip-existing"]
    for name, extra in (("cluster representatives", ["--cluster-first"]),
                        ("remaining exact scripts", [])):
        print(f"Starting {name}", flush=True)
        subprocess.run(base + extra, cwd=REPO, check=True)
        print(f"Finished {name}", flush=True)


if __name__ == "__main__":
    main()
