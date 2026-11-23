#!/usr/bin/env python3
"""Run imported Lean properties with a wall-clock limit per script.

Results marked candidate are solver models only. They do not count as verified
ledger contexts or raise the public progress curve.
"""

from __future__ import annotations

import argparse
import json
import os
import re
import shutil
import signal
import subprocess
import time
from datetime import datetime, timezone
from pathlib import Path


REPO = Path(__file__).resolve().parent.parent
HASH = re.compile(r"[0-9a-f]{56}\Z")


def classify(code: int | None, output: str, timed_out: bool) -> str:
    if timed_out:
        return "timeout"
    if code == 0 and "✅ Expected Falsified" in output and "Counterexample:" in output:
        return "candidate"
    if code == 0 and "⚠️ Undetermined" in output:
        return "unknown"
    return "error"


def run_case(script_hash: str, timeout: int, env: dict[str, str]) -> dict:
    path = f"LiveScripts/S_{script_hash}/Properties.lean"
    started = time.monotonic()
    process = subprocess.Popen(
        ["lake", "env", "lean", path], cwd=REPO, env=env,
        stdout=subprocess.PIPE, stderr=subprocess.PIPE, start_new_session=True,
    )
    timed_out = False
    try:
        stdout, stderr = process.communicate(timeout=timeout)
    except subprocess.TimeoutExpired:
        timed_out = True
        os.killpg(process.pid, signal.SIGKILL)
        stdout, stderr = process.communicate()
    output = stdout.decode("utf-8", errors="replace")
    errors = stderr.decode("utf-8", errors="replace")
    status = classify(process.returncode, output + errors, timed_out)
    return {
        "script_hash": script_hash, "status": status,
        "seconds": round(time.monotonic() - started, 3),
        "exit_code": process.returncode, "stdout": output[-16000:],
        "stderr": errors[-4000:],
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cohort", default="2026-11-23")
    parser.add_argument("--script", help="Run a single script hash from the cohort")
    parser.add_argument("--limit", type=int, help="Stop after this many cases")
    parser.add_argument("--offset", type=int, default=0)
    parser.add_argument("--timeout", type=int, default=90, help="Wall-clock seconds per case")
    parser.add_argument("--z3", type=Path, help="Path to Z3 5.4 or newer")
    args = parser.parse_args()
    if args.limit is not None and args.limit < 1 or args.timeout < 1 or args.offset < 0:
        parser.error("limit and timeout must be positive; offset cannot be negative")
    cohort = json.loads((REPO / "LiveScripts/cohorts" / f"{args.cohort}.json").read_text())
    hashes = cohort["script_hashes"]
    if args.script:
        if not HASH.fullmatch(args.script) or args.script not in hashes:
            parser.error("--script must be a hash in the selected cohort")
        hashes = [args.script]
    else:
        hashes = hashes[args.offset:][:args.limit]
    env = os.environ.copy()
    if args.z3:
        z3 = args.z3.resolve()
        if not z3.is_file():
            parser.error(f"Z3 executable not found: {z3}")
        env["PATH"] = str(z3.parent) + os.pathsep + env["PATH"]
    else:
        z3_path = shutil.which("z3")
        if not z3_path:
            parser.error("z3 is required; pass --z3 /path/to/z3")
    version = subprocess.run(["z3", "-version"], env=env, capture_output=True, text=True, check=True).stdout
    match = re.search(r"version (\d+)\.(\d+)", version)
    if not match or tuple(map(int, match.groups())) < (5, 4):
        parser.error(f"Z3 5.4 or newer is required; found {version.strip()}")
    results_dir = REPO / "LiveScripts/results"
    results_dir.mkdir(exist_ok=True)
    latest_path = results_dir / "latest.json"
    latest = json.loads(latest_path.read_text()) if latest_path.exists() else {}
    revision = subprocess.run(["git", "rev-parse", "HEAD"], cwd=REPO,
                              capture_output=True, text=True, check=True).stdout.strip()
    run_id = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%SZ") + "-" + revision[:8]
    output_path = results_dir / f"{run_id}.jsonl"
    with output_path.open("w") as sink:
        for index, script_hash in enumerate(hashes, 1):
            result = run_case(script_hash, args.timeout, env)
            result.update({"run_id": run_id, "revision": revision,
                           "timestamp": datetime.now(timezone.utc).isoformat()})
            sink.write(json.dumps(result, ensure_ascii=False) + "\n")
            sink.flush()
            latest[script_hash] = {
                "status": result["status"], "seconds": result["seconds"],
                "run_id": run_id,
                "note": "Blaster returned a structural-context candidate; ledger validation is pending."
                if result["status"] == "candidate" else
                f"Last run: {result['status']} after {result['seconds']} s.",
            }
            latest_path.write_text(json.dumps(latest, indent=2, sort_keys=True) + "\n")
            print(f"{index}/{len(hashes)} {script_hash} {result['status']} {result['seconds']}s", flush=True)
    print(f"Results: {output_path}")


if __name__ == "__main__":
    main()
