#!/usr/bin/env python3
"""Exercise the existing benchmark harness against a fixed Blaster revision.

Fresh proof attempts only. This is a functionality smoke test; elapsed times on
shared CI runners do not establish a performance regression.
"""
import argparse
import csv
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import shutil
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[2]
THEOREMS = {'zero_add', 'add_comm', 'add_assoc'}
TACTICS = ('omega', 'blaster')


def validate_results(csv_path):
    with Path(csv_path).open(newline='') as source:
        rows = list(csv.DictReader(source))
    if len(rows) != len(THEOREMS) or {r.get('Theorem') for r in rows} != THEOREMS:
        raise ValueError('Smoke results have missing, duplicate or unexpected theorems')
    for row in rows:
        for tactic in TACTICS:
            status, elapsed = row.get(tactic + '_status'), row.get(tactic + '_time')
            if status != 'OK' or not elapsed or not elapsed.isdigit():
                raise ValueError(f"{row['Theorem']}/{tactic}: {status}, elapsed={elapsed}")
    return rows


def output(*args, cwd=ROOT):
    return subprocess.check_output(args, cwd=cwd, text=True, stderr=subprocess.STDOUT).strip()


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--blaster-ref', default=(ROOT / 'ci/lean-blaster-revision').read_text().strip())
    parser.add_argument('--output', type=Path, default=ROOT / '.ci-results/benchmark')
    args = parser.parse_args()
    if not re.fullmatch(r'[0-9a-fA-F]{40}', args.blaster_ref):
        parser.error('--blaster-ref must be a full commit SHA')
    dest = args.output.resolve()
    dest.mkdir(parents=True, exist_ok=True)
    smoke = ROOT / 'ci/Smoke.lean'
    evidence = {
        'schema_version': 1,
        'harness_commit': output('git', 'rev-parse', 'HEAD'),
        'blaster_commit': args.blaster_ref,
        'suite_sha256': hashlib.sha256(smoke.read_bytes()).hexdigest(),
        'lean_toolchain': (ROOT / 'lean-toolchain').read_text().strip(),
        'lean': output('lean', '--version'),
        'z3': output('z3', '--version'),
        'runner': {'os': platform.system(), 'architecture': platform.machine()},
        'timeout_seconds': 20, 'parallel_jobs': 1, 'cache_enabled': False,
        'trust': {'omega': 'Lean tactic compilation', 'blaster': 'solver Valid; no proof certification claim'},
        'status': 'incomplete',
    }
    try:
        # A new project also prevents stale timing and elaboration-cache reuse.
        with tempfile.TemporaryDirectory(prefix='blaster-ci-smoke-') as temporary:
            project = Path(temporary)
            (project / 'lean-toolchain').write_text(evidence['lean_toolchain'] + '\n')
            (project / 'lakefile.lean').write_text(
                'import Lake\nopen Lake DSL\npackage CISmoke\n'
                'require Blaster from git "https://github.com/input-output-hk/Lean-blaster" @ "'
                + args.blaster_ref + '"\n')
            shutil.copyfile(smoke, project / 'Smoke.lean')
            config = project / 'smoke.conf'
            config.write_text('BENCHMARK_FILES=("CI:Smoke.lean:Smoke:20")\n'
                              'TACTICS=("omega" "blaster")\n'
                              'TACTIC_IMPORTS["blaster"]="Blaster.Command.Tactic"\n'
                              'ENABLE_CACHE=0\nARCHIVE_RESULTS=0\n')
            env = dict(os.environ, OUTPUT_DIR=str(dest), TEMP_DIR=str(dest / 'attempts'),
                       ENABLE_CACHE='0', PARALLEL_JOBS='1')
            with (dest / 'harness.log').open('w') as log:
                for command in [['lake', 'update'], ['lake', 'build', 'Blaster.Command.Tactic'],
                                ['bash', str(ROOT / 'benchmarks/benchmark.sh'), 'run', '-c', str(config)]]:
                    subprocess.run(command, cwd=project, env=env, stdout=log,
                                   stderr=subprocess.STDOUT, check=True)
            evidence['lake_manifest'] = json.loads((project / 'lake-manifest.json').read_text())
            evidence['results'] = validate_results(dest / 'Smoke_results.csv')
            evidence['status'] = 'success'
    except Exception as error:
        evidence['status'] = 'failure'
        evidence['error'] = str(error)
        raise
    finally:
        (dest / 'manifest.json').write_text(json.dumps(evidence, indent=2) + '\n')


if __name__ == '__main__':
    main()
