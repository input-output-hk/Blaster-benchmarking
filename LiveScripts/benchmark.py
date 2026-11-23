#!/usr/bin/env python3
"""Run imported Lean properties with a wall-clock limit per script.

Results marked candidate are solver models only. They do not count as verified
ledger contexts or raise the public progress curve.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import shutil
import signal
import subprocess
import time
from concurrent.futures import ThreadPoolExecutor, as_completed
from datetime import datetime, timezone
from pathlib import Path


REPO = Path(__file__).resolve().parent.parent
HASH = re.compile(r"[0-9a-f]{56}\Z")


def classify(code: int | None, output: str, timed_out: bool) -> str:
    if timed_out:
        return "timeout"
    if code == 0 and "✅ Expected Falsified" in output and "Counterexample:" in output:
        return "candidate"
    if code == 0 and ("Undetermined" in output or "Valid" in output):
        return "unknown"
    return "error"


def active_stage(output: str) -> str:
    stage = "elaboration"
    for line in output.splitlines():
        if line.startswith("[Start]: "):
            stage = line.removeprefix("[Start]: ").lower().replace(" ", "_")
        elif line.startswith("[End]: "):
            stage = "between_stages"
    return stage


def run_command(command: list[str], timeout: float, env: dict[str, str]) -> tuple[int, str, str, bool]:
    process = subprocess.Popen(
        command, cwd=REPO, env=env,
        stdout=subprocess.PIPE, stderr=subprocess.PIPE, start_new_session=True,
    )
    timed_out = False
    try:
        stdout, stderr = process.communicate(timeout=timeout)
    except subprocess.TimeoutExpired:
        timed_out = True
        os.killpg(process.pid, signal.SIGKILL)
        stdout, stderr = process.communicate()
    return (process.returncode, stdout.decode("utf-8", errors="replace"),
            stderr.decode("utf-8", errors="replace"), timed_out)


def run_case(script_hash: str, timeout: int, env: dict[str, str]) -> dict:
    started = time.monotonic()
    deadline = started + timeout
    module = f"LiveScripts.S_{script_hash}.Script"
    code, build_output, build_errors, build_timeout = run_command(
        ["lake", "build", module], timeout, env)
    if build_timeout or code != 0:
        output, errors, timed_out = build_output, build_errors, build_timeout
        status = "timeout" if build_timeout else "error"
        stage = "script_build" if build_timeout else None
    else:
        remaining = deadline - time.monotonic()
        if remaining <= 0:
            code, output, errors, timed_out = None, "", "", True
            status, stage = "timeout", "script_build"
        else:
            path = f"LiveScripts/S_{script_hash}/Properties.lean"
            code, output, errors, timed_out = run_command(
                ["lake", "env", "lean", path], remaining, env)
            status = classify(code, output + errors, timed_out)
            stage = active_stage(output) if timed_out else None
    return {
        "script_hash": script_hash, "status": status,
        "timeout_stage": stage,
        "seconds": round(time.monotonic() - started, 3),
        "exit_code": code, "stdout": output[-16000:],
        "stderr": errors[-4000:],
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cohort", default="2026-11-23")
    parser.add_argument("--script", help="Run a single script hash from the cohort")
    parser.add_argument("--limit", type=int, help="Stop after this many cases")
    parser.add_argument("--offset", type=int, default=0)
    parser.add_argument("--timeout", type=int, default=25, help="Hard wall-clock seconds per case, including optimization")
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--cluster-first", action="store_true", help="Try the smallest script in each structural family first")
    parser.add_argument("--skip-existing", action="store_true", help="Skip cases already run with this configuration")
    parser.add_argument("--z3", type=Path, help="Path to Z3 5.4 or newer")
    args = parser.parse_args()
    if (args.limit is not None and args.limit < 1) or args.timeout < 1 or args.offset < 0 or args.workers < 1:
        parser.error("limit, timeout and workers must be positive; offset cannot be negative")
    cohort = json.loads((REPO / "LiveScripts/cohorts" / f"{args.cohort}.json").read_text())
    hashes = cohort["script_hashes"]
    if args.cluster_first:
        catalog = json.loads((REPO / "LiveScripts/catalog.json").read_text())
        members = {item["script_hash"]: item for item in catalog["scripts"]}
        representatives: dict[str, dict] = {}
        for script_hash in hashes:
            item = members[script_hash]
            family = item.get("cluster_id") or script_hash
            old = representatives.get(family)
            if old is None or (item["serialised_size"], script_hash) < (old["serialised_size"], old["script_hash"]):
                representatives[family] = item
        hashes = [item["script_hash"] for item in sorted(
            representatives.values(), key=lambda item: (item["serialised_size"], item["script_hash"]))]
    if args.script:
        if not HASH.fullmatch(args.script) or args.script not in hashes:
            parser.error("--script must be a hash in the selected cohort")
        hashes = [args.script]
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
    manifest = json.loads((REPO / "lake-manifest.json").read_text())
    package_revs = {item["name"]: item["rev"] for item in manifest["packages"]
                    if item["name"] in ("Blaster", "PlutusCore", "CardanoLedgerApi")}
    config = hashlib.sha256(json.dumps({
        "packages": package_revs, "z3": version.strip(), "wall_timeout": args.timeout,
        "generator": hashlib.sha256((REPO / "LiveScripts/import_corpus.py").read_bytes()).hexdigest(),
        "runner": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
    }, sort_keys=True).encode()).hexdigest()
    (results_dir / "active-config.json").write_text(json.dumps({
        "config": config, "packages": package_revs, "z3": version.strip(),
        "wall_timeout": args.timeout, "cohort": args.cohort,
    }, indent=2, sort_keys=True) + "\n")
    if args.skip_existing:
        hashes = [h for h in hashes if latest.get(h, {}).get("config") != config]
    if not args.script:
        hashes = hashes[args.offset:][:args.limit]
    revision = subprocess.run(["git", "rev-parse", "HEAD"], cwd=REPO,
                              capture_output=True, text=True, check=True).stdout.strip()
    run_id = datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%S%fZ") + "-" + revision[:8]
    output_path = results_dir / f"{run_id}.jsonl"
    with output_path.open("w") as sink:
        with ThreadPoolExecutor(max_workers=args.workers) as pool:
            pending = {pool.submit(run_case, h, args.timeout, env): h for h in hashes}
            for index, task in enumerate(as_completed(pending), 1):
                result = task.result()
                script_hash = result["script_hash"]
                result.update({"run_id": run_id, "revision": revision, "config": config,
                               "timestamp": datetime.now(timezone.utc).isoformat()})
                sink.write(json.dumps(result, ensure_ascii=False) + "\n")
                sink.flush()
                latest[script_hash] = {
                    "status": result["status"], "seconds": result["seconds"],
                    "timeout_stage": result["timeout_stage"], "config": config, "run_id": run_id,
                    "note": "Blaster returned a CardanoLedgerApi-valid context candidate; independent replay is pending."
                    if result["status"] == "candidate" else
                    f"Last run: {result['status']}"
                    + (f" during {result['timeout_stage']}" if result["timeout_stage"] else "")
                    + f" after {result['seconds']} s.",
                }
                latest_path.write_text(json.dumps(latest, indent=2, sort_keys=True) + "\n")
                print(f"{index}/{len(hashes)} {script_hash} {result['status']}"
                      f" {result['seconds']}s {result['timeout_stage'] or ''}", flush=True)
    print(f"Results: {output_path}")


if __name__ == "__main__":
    main()
