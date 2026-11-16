#!/usr/bin/env bash
# Shared external-solver identity for suite and theorem caches. cvc5 is a
# packaged dependency, not the external z3 executable measured here.
solver_uses_z3() {
    case "$1" in blaster*|auto|smt*|hammer|__ENV__) return 0 ;; *) return 1 ;; esac
}

# Set once in the parent shell, before spawning benchmark workers.
init_solver_environment() {
    local tool="$1" detected="" output=""
    if ! solver_uses_z3 "$tool"; then
        SOLVER_CACHE_ID=none
        EXTERNAL_Z3_VERSION=not-used
    else
        output="$(z3 --version 2>/dev/null)" || output=""
        if [[ "$output" =~ ^Z3[[:space:]]version[[:space:]]([0-9]+\.[0-9]+\.[0-9]+)([[:space:]]|$) ]]; then
            detected="z3-${BASH_REMATCH[1]}"
        fi
        if [[ -n "${BENCH_SOLVER_ID:-}" && "$BENCH_SOLVER_ID" != "$detected" ]]; then
            echo "BENCH_SOLVER_ID=$BENCH_SOLVER_ID does not match installed Z3 (${detected:-unknown})" >&2
            return 1
        fi
        SOLVER_CACHE_ID="${detected:-unknown}"
        EXTERNAL_Z3_VERSION="${output:-unknown}"
        if [[ "$SOLVER_CACHE_ID" == unknown ]]; then
            echo 'Cannot identify external Z3; solver-sensitive caching is disabled.' >&2
        fi
    fi
    export SOLVER_CACHE_ID EXTERNAL_Z3_VERSION
}

write_solver_environment() {
    python3 - "$1" "$2" <<'PY'
import json, os, pathlib, sys
manifest = pathlib.Path(sys.argv[2])
packages = []
if manifest.is_file():
    packages = [p for p in json.loads(manifest.read_text()).get('packages', [])
                if 'cvc5' in p.get('name', '').lower()]
pathlib.Path(sys.argv[1]).write_text(json.dumps({
    'solver_id': os.environ['SOLVER_CACHE_ID'],
    'external_z3': os.environ['EXTERNAL_Z3_VERSION'],
    'cvc5': {'source': 'packaged dependency; pin recorded in Lake dependency manifest',
             'packages': packages},
}, indent=2) + '\n')
PY
}
