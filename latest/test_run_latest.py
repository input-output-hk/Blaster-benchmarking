"""Network-free regression tests for infrastructure failure handling."""
import csv
import json
import hashlib
import os
from pathlib import Path
import shutil
import subprocess
import tempfile
import unittest

from validate_suite import validate

HERE = Path(__file__).resolve().parent


class SuiteValidationTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        self.source = self.root / 'source.lean'
        self.source.write_text('theorem a : True := by trivial\ntheorem b : True := by trivial\n')
        self.csv = self.root / 'S_results.csv'

    def write(self, rows):
        with self.csv.open('w', newline='') as f:
            writer = csv.writer(f)
            writer.writerow(['Benchmark', 'Theorem', 'Statement', 'auto_time', 'auto_status'])
            writer.writerows(rows)

    def check(self):
        validate(self.csv, 'S', self.source, 'stmt', 'auto')

    def test_real_tactic_failures_and_timeouts_are_valid(self):
        self.write([['S', 'a', 'True', 'fail', 'FAIL'], ['S', 'b', 'True', 'timeout', 'TIMEOUT']])
        self.check()

    def test_missing_header_only_partial_duplicate_and_bad_status_rejected(self):
        with self.assertRaises(OSError):
            self.check()
        for rows in [[], [['S', 'a', 'True', '1', 'OK']],
                     [['S', 'a', 'True', '1', 'OK']] * 2,
                     [['S', 'a', 'True', '0', 'DRY_RUN'], ['S', 'b', 'True', '1', 'OK']]]:
            with self.subTest(rows=rows):
                self.write(rows)
                with self.assertRaises(ValueError):
                    self.check()

    def test_taskdir_and_env_results(self):
        tasks = self.root / 'tasks'
        tasks.mkdir()
        (tasks / 'goal.lean').write_text('theorem ignored : True := by trivial')
        self.write([['S', 'goal', 'goal', 'env', 'ENV']])
        validate(self.csv, 'S', tasks, 'taskdir', 'auto')


class RetryTests(unittest.TestCase):
    def run_case(self, message, succeed_at, expected_calls, expected_rc):
        with tempfile.TemporaryDirectory() as tmp:
            script = f'''set -uo pipefail
source "{HERE}/run_support.sh"
# Keep tests instantaneous; command counting still happens in subprocesses.
sleep() {{ :; }}
flaky() {{
    n=$(cat count 2>/dev/null || echo 0); n=$((n+1)); echo "$n" > count
    if [[ "$n" -ge {succeed_at} ]]; then echo success; return 0; fi
    echo '{message}'; return 7
}}
run_logged_stage test stage.log flaky
'''
            result = subprocess.run(['bash', '-c', script], cwd=tmp, capture_output=True, text=True)
            self.assertEqual(result.returncode, expected_rc, result.stdout + result.stderr)
            self.assertEqual(int((Path(tmp) / 'count').read_text()), expected_calls)
            if expected_calls > 1:
                self.assertIn(message, (Path(tmp) / 'stage.log.attempt-1.log').read_text())

    def test_http_504_recovers(self):
        self.run_case('error: HTTP status code 504', 2, 2, 0)

    def test_actual_elan_504_recovers(self):
        self.run_case('info: caused by: http request returned an unsuccessful status code: 504', 2, 2, 0)

    def test_failed_toolchain_fetch_emits_no_partial_payload(self):
        with tempfile.TemporaryDirectory() as tmp:
            script = f'''source "{HERE}/run_support.sh"
curl() {{
    while [[ "$1" != "--output" ]]; do shift; done
    printf 'leanprover/lean4:v4.' > "$2"
    return 18
}}
fetch_toolchain https://example.invalid/lean-toolchain
'''
            result = subprocess.run(['bash', '-c', script], env=dict(os.environ, TMPDIR=tmp),
                                    capture_output=True, text=True)
            self.assertEqual(result.returncode, 18)
            self.assertEqual(result.stdout, '')
            self.assertEqual(list(Path(tmp).iterdir()), [])

    def test_curl_504_recovers(self):
        self.run_case('curl: (22) The requested URL returned error: 504', 3, 3, 0)

    def test_transient_retries_are_bounded(self):
        self.run_case('error: HTTP status code 503', 9, 3, 7)

    def test_compiler_failure_is_not_retried(self):
        self.run_case("fatal error: cstdint file not found", 9, 1, 7)


class OrchestratorTests(unittest.TestCase):
    def run_case(self, build_fail=False, partial=False, scaffold_fail=False, cache_roundtrip=False, solver_roundtrip=False, no_solver=False, wrong_solver=False, legacy_cache=False):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            (root / 'latest').mkdir()
            (root / 'benchmarks').mkdir()
            (root / 'bin').mkdir()
            for name in ['run_latest.sh', 'run_support.sh', 'validate_suite.py']:
                shutil.copy(HERE / name, root / 'latest' / name)
            shutil.copy(HERE.parent / 'benchmarks/solver_environment.sh', root / 'benchmarks')
            (root / 'source.lean').write_text('theorem a : True := by trivial\n')
            (root / 'benchmarks' / 'benchmark_config.sh').write_text(
                'BENCHMARK_FILES=("X:source.lean:S:1:stmt")\n')
            (root / 'benchmarks' / 'benchmark.sh').write_text('''source ./config.sh
mkdir -p "$OUTPUT_DIR"
echo 'Benchmark,Theorem,Statement,auto_time,auto_status' > "$OUTPUT_DIR/S_results.csv"
''' + ('' if partial else '''echo 'S,a,True,1,OK' >> "$OUTPUT_DIR/S_results.csv"\n'''))
            commands = {
                'git': 'echo "123456789abcdef refs/heads/main"',
                'curl': 'exit 22' if scaffold_fail else 'while [[ "$1" != "--output" ]]; do shift; done; echo leanprover/lean4:v4.31.0 > "$2"',
                'lake': 'echo "fatal error: cstdint file not found"; exit 1' if build_fail else 'exit 0',
                'z3': 'exit 1' if no_solver else 'echo "Z3 version 4.15.2 - 64 bit"',
                'column': 'cat "${@: -1}"',
            }
            for name, body in commands.items():
                path = root / 'bin' / name
                path.write_text('#!/usr/bin/env bash\n' + body + '\n')
                path.chmod(0o755)
            if legacy_cache:
                source_hash = hashlib.sha1((root / 'source.lean').read_bytes()).hexdigest()
                key = hashlib.sha1(f'auto|123456789|leanprover/lean4:v4.31.0|auto|{source_hash}|4'.encode()).hexdigest()
                cached = root / 'latest/results_cache/auto/S' / key
                cached.mkdir(parents=True)
                (cached / 'S_results.csv').write_text(
                    'Benchmark,Theorem,Statement,auto_time,auto_status\nS,a,True,999,OK\n')
            env = dict(os.environ, PATH=str(root / 'bin') + ':' + os.environ['PATH'])
            env.pop('BENCH_SOLVER_ID', None)
            if wrong_solver:
                env['BENCH_SOLVER_ID'] = 'z3-5.4.0'
            result = subprocess.run(['bash', str(root / 'latest/run_latest.sh'), 'auto'],
                                    env=env, capture_output=True, text=True)
            if wrong_solver:
                self.assertNotEqual(result.returncode, 0)
                self.assertIn('does not match installed Z3', result.stderr)
                return
            expected = 'SCAFFOLD_FAIL' if scaffold_fail else 'BUILD_FAIL' if build_fail else 'BENCH_FAIL' if partial else 'OK'
            self.assertEqual(result.returncode, int(build_fail or partial or scaffold_fail), result.stdout + result.stderr)
            self.assertIn('\tauto\t' + expected, (root / 'latest/results/manifest.tsv').read_text())
            caches = list((root / 'latest/results_cache').rglob('*_results.csv'))
            self.assertEqual(len(caches), 0 if build_fail or partial or scaffold_fail or no_solver else 1 + int(legacy_cache))
            if legacy_cache:
                self.assertIn("S,a,True,1,OK", (root / "latest/results/auto/S_results.csv").read_text())

            if solver_roundtrip:
                metadata = root / 'latest/results/auto/solver_environment.json'
                self.assertEqual(json.loads(metadata.read_text())['solver_id'], 'z3-4.15.2')
                for version, expected_status, force in [('4.15.2', 'CACHED', False),
                                                         ('5.4.0', 'OK', False),
                                                         ('5.4.0', 'CACHED', False),
                                                         ('5.4.0', 'OK', True)]:
                    (root / 'bin/z3').write_text('#!/usr/bin/env bash\necho "Z3 version ' + version + ' - 64 bit"\n')
                    rerun_env = dict(env, BENCH_SOLVER_ID='z3-' + version, NO_CACHE='1' if force else '0')
                    rerun = subprocess.run(['bash', str(root / 'latest/run_latest.sh'), 'auto'],
                                           env=rerun_env, capture_output=True, text=True)
                    self.assertEqual(rerun.returncode, 0, rerun.stdout + rerun.stderr)
                    self.assertIn('\tauto\t' + expected_status, (root / 'latest/results/manifest.tsv').read_text())
                    self.assertEqual(json.loads(metadata.read_text())['solver_id'], 'z3-' + version)
                self.assertEqual(len(list((root / 'latest/results_cache').rglob('*_results.csv'))), 2)

            if cache_roundtrip:
                for corrupt in (False, True):
                    if corrupt:
                        caches[0].write_text('broken cache\n')
                    rerun = subprocess.run(['bash', str(root / 'latest/run_latest.sh'), 'auto'],
                                           env=env, capture_output=True, text=True)
                    self.assertEqual(rerun.returncode, 0, rerun.stdout + rerun.stderr)
                    status = 'OK' if corrupt else 'CACHED'
                    self.assertIn('\tauto\t' + status, (root / 'latest/results/manifest.tsv').read_text())

    def test_seeded_legacy_suite_cache_is_not_reused_by_z3_tool(self):
        self.run_case(legacy_cache=True)

    def test_solver_version_separates_suite_caches_and_force_reruns(self):
        self.run_case(solver_roundtrip=True)

    def test_unknown_solver_does_not_save_suite_cache(self):
        self.run_case(no_solver=True)

    def test_mismatched_solver_fails_before_benchmark(self):
        self.run_case(wrong_solver=True)

    def test_valid_cache_reused_corrupt_cache_rebuilt(self):
        self.run_case(cache_roundtrip=True)

    def test_scaffold_failure_exits_nonzero_without_cache(self):
        self.run_case(scaffold_fail=True)

    def test_build_failure_exits_nonzero_without_cache(self):
        self.run_case(build_fail=True)

    def test_partial_output_exits_nonzero_without_cache(self):
        self.run_case(partial=True)

    def test_success_exits_zero_and_caches(self):
        self.run_case()


if __name__ == '__main__':
    unittest.main()
