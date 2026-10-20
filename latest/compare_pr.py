#!/usr/bin/env python3
"""Compare one PR's Blaster CSVs with the committed weekly snapshot.

Usage: compare_pr.py RESULTS_DIR WEEKLY_SNAPSHOT OUTPUT_FILE
Only goals with the same suite, theorem name, and recorded statement are paired.
"""

import json
import os
import sys
from pathlib import Path

from merge_results import discover, load_manifest, snapshot


TACTICS = ("blaster", "blaster (only-optimize: 1)")


def comparison(current: dict, weekly: dict, tactics=TACTICS) -> str:
    if weekly.get("schema_version") != 1 or current.get("schema_version") != 1:
        raise ValueError("Unsupported benchmark snapshot schema")

    pr_number = os.environ.get("PR_NUMBER", "?")
    pr_sha = os.environ.get("PR_HEAD_SHA", "?")
    run_id = os.environ.get("GITHUB_RUN_ID", "")
    repo = os.environ.get("GITHUB_REPOSITORY", "input-output-hk/Lean-blaster")
    run_url = f"https://github.com/{repo}/actions/runs/{run_id}"
    weekly_run = weekly.get("run", {}).get("url", "")
    baseline_commit = os.environ.get("BASELINE_COMMIT", "")
    lines = [
        f"## Benchmark for PR #{pr_number} (`{pr_sha[:12]}`)",
        "",
        f"Compared with the [latest committed weekly run]({weekly_run})"
        + (f" ([snapshot](https://github.com/{repo}/blob/{baseline_commit}/benchmark/snapshot.json))" if baseline_commit else "")
        + f". [This run and raw results]({run_url}).",
        "",
        "Only goals with matching suite, theorem name, and recorded statement are compared. "
        "A `+` means the PR solves a goal the weekly run missed; a `−` means a regression.",
    ]

    for tactic in tactics:
        candidate_version = current.get("versions", {}).get(tactic, {})
        weekly_version = weekly.get("versions", {}).get(tactic, {})
        if candidate_version.get("build_status") not in ("OK", "CACHED"):
            raise ValueError(f"{tactic} did not build: {candidate_version.get('build_status', 'missing manifest')}")
        expected_sha = os.environ.get("PR_HEAD_SHA", "")
        if expected_sha and candidate_version.get("resolved_commit") != expected_sha[:9]:
            raise ValueError(f"{tactic} result is not from the requested PR head {expected_sha}")

        tc = candidate_version.get("toolchain", "?").replace("leanprover/lean4:", "")
        old_tc = weekly_version.get("toolchain", "?").replace("leanprover/lean4:", "")
        lines += ["", f"### `{tactic}`", "",
                  f"PR: `{tc}` at `{candidate_version.get('resolved_commit', '?')}`; "
                  f"weekly: `{old_tc}` at `{weekly_version.get('resolved_commit', '?')}`.", "",
                  "| Suite | Matched goals | Weekly solved | PR solved | Gains | Losses | PR timeouts |",
                  "|---|---:|---:|---:|---:|---:|---:|"]

        totals = {"matched": 0, "old": 0, "new": 0, "gains": 0, "losses": 0, "timeouts": 0}
        details = []
        omitted = 0
        old_suites = weekly.get("suites", {})
        new_suites = current.get("suites", {})
        missing_suites = [suite for suite in old_suites
                          if old_suites[suite].get(tactic) and not new_suites.get(suite, {}).get(tactic)]
        if missing_suites:
            raise ValueError(f"Missing {tactic} suites: {', '.join(sorted(missing_suites))}")
        for suite in sorted(old_suites.keys() | new_suites.keys()):
            old_goals = old_suites.get(suite, {}).get(tactic, {})
            new_goals = new_suites.get(suite, {}).get(tactic, {})
            old_statements = weekly.get("statements", {}).get(suite, {})
            new_statements = current.get("statements", {}).get(suite, {})
            paired = sorted(goal for goal in old_goals.keys() & new_goals.keys()
                            if old_statements.get(goal) == new_statements.get(goal))
            omitted += len((old_goals.keys() | new_goals.keys()) - set(paired))
            if not paired:
                continue
            old_ok = sum(old_goals[g] == "OK" for g in paired)
            new_ok = sum(new_goals[g] == "OK" for g in paired)
            gains = [g for g in paired if old_goals[g] != "OK" and new_goals[g] == "OK"]
            losses = [g for g in paired if old_goals[g] == "OK" and new_goals[g] != "OK"]
            timeouts = sum(new_goals[g] == "TIMEOUT" for g in paired)
            for key, value in (("matched", len(paired)), ("old", old_ok), ("new", new_ok),
                               ("gains", len(gains)), ("losses", len(losses)),
                               ("timeouts", timeouts)):
                totals[key] += value
            lines.append(f"| {suite} | {len(paired)} | {old_ok} | {new_ok} | "
                         f"+{len(gains)} | −{len(losses)} | {timeouts} |")
            if gains or losses:
                details.append((suite, gains, losses))

        if not totals["matched"]:
            raise ValueError(f"No comparable goals for {tactic}; benchmark output may be incomplete")
        lines += [f"| **Total** | **{totals['matched']}** | **{totals['old']}** | "
                  f"**{totals['new']}** | **+{totals['gains']}** | **−{totals['losses']}** | "
                  f"**{totals['timeouts']}** |", ""]
        if omitted:
            lines.append(f"{omitted} goal IDs were omitted because they are new, missing, or have changed recorded statements.")
        if details:
            lines += ["", "<details><summary>Changed goals</summary>", ""]
            for suite, gains, losses in details:
                lines.append(f"- **{suite}**: " + ", ".join(
                    [f"+`{goal}`" for goal in gains] + [f"−`{goal}`" for goal in losses]))
            lines += ["", "</details>"]

        if tc != old_tc:
            lines += ["", "The toolchains differ, so this measures the PR with its declared "
                      "toolchain rather than isolating source changes alone."]

    return "\n".join(lines).rstrip() + "\n"


def main() -> None:
    results, baseline, output = map(Path, sys.argv[1:4])
    benches, seen, _ = discover(results)
    manifest = load_manifest(results)
    missing = [t for t in TACTICS if t not in seen or t not in manifest]
    if missing:
        raise ValueError(f"Missing benchmark results for: {', '.join(missing)}")
    current = snapshot(benches, seen, manifest)
    weekly = json.loads(baseline.read_text(encoding="utf-8"))
    output.write_text(comparison(current, weekly), encoding="utf-8")
    print(f"Wrote {output}")


if __name__ == "__main__":
    if len(sys.argv) != 4:
        raise SystemExit(__doc__)
    try:
        main()
    except (OSError, ValueError) as exc:
        raise SystemExit(f"PR comparison failed: {exc}") from exc
