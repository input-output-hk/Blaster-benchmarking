"""Network-free tests for external-solver identity and local theorem caches."""
import os
import re
import hashlib
import json
from pathlib import Path
import subprocess
import tempfile
import unittest

BENCH = Path(__file__).resolve().parent.parent / 'benchmarks'


class TheoremCacheTests(unittest.TestCase):
    def run_shell(self, body):
        with tempfile.TemporaryDirectory() as tmp:
            script = f'''set -euo pipefail
source "{BENCH}/benchmark_utils.sh"
ENABLE_CACHE=1
CACHE_DIR="{tmp}/cache"
unset BENCH_SOLVER_ID
z3() {{ echo "Z3 version $VERSION - 64 bit"; }}
VERSION=4.15.2
init_solver_environment blaster
''' + body
            result = subprocess.run(['bash', '-c', script], capture_output=True, text=True,
                                    env=dict(os.environ, NO_CACHE='0'))
            self.assertEqual(result.returncode, 0, result.stdout + result.stderr)

    def test_changed_solver_never_reuses_theorem_or_environment_cache(self):
        self.run_shell('''
for tactic in blaster 'blaster (only-optimize: 1)' auto 'smt +model' hammer __ENV__; do
    VERSION=4.15.2; init_solver_environment blaster
    old=$(generate_cache_key S goal "$tactic" abc)
    store_cache "$old" '1|OK'
    [[ $(check_cache "$old") == '1|OK' ]]
    VERSION=5.4.0; init_solver_environment blaster
    new=$(generate_cache_key S goal "$tactic" abc)
    [[ "$new" != "$old" ]]
    ! check_cache "$new"
    store_cache "$new" '2|OK'
    [[ $(check_cache "$new") == '2|OK' ]]
done
''')

    def test_legacy_z3_cache_not_reused_but_baselines_preserved(self):
        self.run_shell('''
mkdir -p "$CACHE_DIR"
echo '1|OK' > "$CACHE_DIR/S_goal_blaster_abc"
! check_cache "$(generate_cache_key S goal blaster abc)"
for tactic in aesop omega grind simp; do
    key=$(generate_cache_key S goal "$tactic" abc)
    [[ "$key" == "S_goal_${tactic}_abc" ]]
    store_cache "$key" '1|OK'
    VERSION=5.4.0; init_solver_environment blaster
    [[ $(check_cache "$(generate_cache_key S goal "$tactic" abc)") == '1|OK' ]]
done
''')

    def test_force_run_bypasses_existing_theorem_cache(self):
        self.run_shell('''
key=$(generate_cache_key S goal blaster abc)
store_cache "$key" '1|OK'
NO_CACHE=1
! check_cache "$key"
store_cache other '2|OK'
[[ ! -f "$CACHE_DIR/other" ]]
''')

    def test_unknown_solver_cannot_read_or_write_cache(self):
        self.run_shell('''
z3() { return 1; }
init_solver_environment blaster
[[ "$SOLVER_CACHE_ID" == unknown ]]
key=$(generate_cache_key S goal blaster abc)
mkdir -p "$CACHE_DIR"
echo '1|OK' > "$CACHE_DIR/$key"
! check_cache "$key"
store_cache "${key}_other__solver_unknown" '2|OK'
[[ ! -f "$CACHE_DIR/${key}_other__solver_unknown" ]]
''')

    def test_non_z3_tool_ignores_unrelated_external_z3(self):
        self.run_shell('''
BENCH_SOLVER_ID=none
init_solver_environment aesop
[[ "$SOLVER_CACHE_ID" == none ]]
[[ "$EXTERNAL_Z3_VERSION" == not-used ]]
''')


class SuiteIdentityTests(unittest.TestCase):
    def test_non_z3_legacy_keys_preserved_and_z3_legacy_keys_rejected(self):
        runner = (BENCH.parent / 'latest/run_latest.sh').read_text()
        function = re.search(r'^cache_key\(\).*?^}', runner, re.M | re.S).group()
        for tool in ['aesop', 'baselines', 'blaster', 'auto', 'smt', 'hammer']:
            legacy = hashlib.sha1(f'{tool}|commit|tc|tactics|source|4'.encode()).hexdigest()
            script = f'''source "{BENCH}/solver_environment.sh"
CACHE_VERSION=4
SOLVER_CACHE_ID=z3-5.4.0
hash_stdin() {{ sha1sum | awk '{{print $1}}'; }}
{function}
cache_key {tool} commit tc tactics source
'''
            result = subprocess.run(['bash', '-c', script], capture_output=True, text=True, check=True)
            if tool in ['aesop', 'baselines']:
                self.assertEqual(result.stdout.strip(), legacy)
            else:
                self.assertNotEqual(result.stdout.strip(), legacy)

    def test_sidecar_distinguishes_external_z3_and_packaged_cvc5(self):
        with tempfile.TemporaryDirectory() as tmp:
            manifest = Path(tmp) / 'lake-manifest.json'
            manifest.write_text(json.dumps({'packages': [{'name': 'cvc5', 'rev': 'pinned-revision'}]}))
            output = Path(tmp) / 'solver_environment.json'
            script = f'''source "{BENCH}/solver_environment.sh"
export SOLVER_CACHE_ID=z3-5.4.0 EXTERNAL_Z3_VERSION="Z3 version 5.4.0 - 64 bit"
write_solver_environment "{output}" "{manifest}"
'''
            subprocess.run(['bash', '-c', script], check=True)
            data = json.loads(output.read_text())
            self.assertEqual(data['solver_id'], 'z3-5.4.0')
            self.assertEqual(data['external_z3'], 'Z3 version 5.4.0 - 64 bit')
            self.assertEqual(data['cvc5']['packages'][0]['rev'], 'pinned-revision')


if __name__ == '__main__':
    unittest.main()
