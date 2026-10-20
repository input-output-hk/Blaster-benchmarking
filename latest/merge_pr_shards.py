#!/usr/bin/env python3
"""Combine four PR benchmark shard artifacts into one results directory.

Usage: merge_pr_shards.py SHARDS_DIR OUTPUT_DIR PR_NUMBER
"""

import csv
import shutil
import sys
from pathlib import Path


SHARD_SUITES = {
    "uplc-width": ("UPLCWidth",),
    "uplc-depth": ("UPLCDepth",),
    "classic": ("NNG4", "STG4", "ITL4", "MiniF2F", "Verina"),
    "home": ("BlasterHome", "SmtHome", "AutoHome", "AesopHome", "HammerHome"),
}
IDENTITY = ("tool", "toolchain", "branch", "resolved_commit", "tactic")


def merge(shards_dir: Path, output: Path, pr_number: str) -> None:
    expected = {f"pr-benchmark-shard-{pr_number}-{name}" for name in SHARD_SUITES}
    actual = {p.name for p in shards_dir.iterdir() if p.is_dir()}
    if actual != expected:
        raise ValueError(f"Shard artifacts differ: missing={sorted(expected - actual)}, extra={sorted(actual - expected)}")

    output.mkdir(parents=True, exist_ok=True)
    result_dir = output / "blaster"
    result_dir.mkdir(exist_ok=True)
    manifests: dict[str, dict] = {}
    headers: list[str] | None = None
    env_errors: list[str] = []

    for shard_type in SHARD_SUITES:
        shard_name = f"pr-benchmark-shard-{pr_number}-{shard_type}"
        shard = shards_dir / shard_name
        manifest_path = shard / "manifest.tsv"
        with manifest_path.open(newline="", encoding="utf-8") as f:
            reader = csv.DictReader(f, delimiter="\t")
            rows = list(reader)
            if not rows or not reader.fieldnames:
                raise ValueError(f"Empty manifest in {shard_name}")
            if headers is None:
                headers = reader.fieldnames
            elif reader.fieldnames != headers:
                raise ValueError(f"Manifest columns differ in {shard_name}")
        for row in rows:
            tactic = row["tactic"]
            if row["build_status"] not in ("OK", "CACHED"):
                raise ValueError(f"{shard_name}: {tactic} build status is {row['build_status']}")
            previous = manifests.get(tactic)
            if previous:
                if any(previous[key] != row[key] for key in IDENTITY):
                    raise ValueError(f"{shard_name}: {tactic} manifest identity differs")
                if row["build_status"] == "OK":
                    previous["build_status"] = "OK"
            else:
                manifests[tactic] = row

        csvs = sorted((shard / "blaster").glob("*_results.csv"))
        expected_csvs = {f"{suite}_results.csv" for suite in SHARD_SUITES[shard_type]}
        actual_csvs = {p.name for p in csvs}
        if actual_csvs != expected_csvs:
            raise ValueError(f"{shard_name}: missing CSVs={sorted(expected_csvs - actual_csvs)}, "
                             f"extra CSVs={sorted(actual_csvs - expected_csvs)}")
        for csv_path in csvs:
            destination = result_dir / csv_path.name
            if destination.exists():
                raise ValueError(f"Duplicate suite CSV: {csv_path.name}")
            shutil.copy2(csv_path, destination)
        env_path = shard / "blaster" / "env_errors.tsv"
        if env_path.exists():
            env_errors.extend(env_path.read_text(encoding="utf-8").splitlines())

    with (output / "manifest.tsv").open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=headers, delimiter="\t")
        writer.writeheader()
        writer.writerows(manifests.values())
    (result_dir / "env_errors.tsv").write_text(
        "\n".join(env_errors) + ("\n" if env_errors else ""), encoding="utf-8"
    )
    print(f"Combined {len(expected)} shards, {len(list(result_dir.glob('*_results.csv')))} suites")


if __name__ == "__main__":
    if len(sys.argv) != 4:
        raise SystemExit(__doc__)
    try:
        merge(Path(sys.argv[1]), Path(sys.argv[2]), sys.argv[3])
    except (OSError, ValueError, KeyError) as exc:
        raise SystemExit(f"Shard merge failed: {exc}") from exc
