#!/usr/bin/env bash
# Long Lake stages write detailed output to files. Emit a live heartbeat so an
# Actions log still says which stage is active and how long it has taken.
run_logged_attempt() {  # label logfile command...
    local label="$1" logfile="$2"; shift 2
    local start=$(date +%s) command_pid heartbeat_pid rc
    printf '[stage] %s %s start (log: %s)\n' "$(date -u +'%Y-%m-%dT%H:%M:%SZ')" "$label" "$logfile"
    "$@" > "$logfile" 2>&1 & command_pid=$!
    (
        while kill -0 "$command_pid" 2>/dev/null; do
            sleep 30 >/dev/null 2>&1
            kill -0 "$command_pid" 2>/dev/null || break
            printf '[stage] %s %s still running elapsed=%ss\n' \
                "$(date -u +'%Y-%m-%dT%H:%M:%SZ')" "$label" "$(($(date +%s)-start))"
        done
    ) & heartbeat_pid=$!
    wait "$command_pid"; rc=$?
    kill "$heartbeat_pid" 2>/dev/null || true
    wait "$heartbeat_pid" 2>/dev/null || true
    printf '[stage] %s %s done exit=%s elapsed=%ss\n' \
        "$(date -u +'%Y-%m-%dT%H:%M:%SZ')" "$label" "$rc" "$(($(date +%s)-start))"
    if [[ "$rc" -ne 0 ]]; then
        echo "  Last 50 lines of $logfile:"
        tail -n 50 "$logfile" || true
    fi
    return "$rc"
}

# Retry only recognized transport failures, never an arbitrary compiler error.
run_logged_stage() {
    local label="$1" logfile="$2"; shift 2
    local attempt rc
    for attempt in 1 2 3; do
        if run_logged_attempt "$label (attempt $attempt/3)" "$logfile" "$@"; then
            return 0
        else
            rc=$?
        fi
        cp "$logfile" "${logfile}.attempt-${attempt}.log"
        if [[ "$attempt" -eq 3 ]] || ! grep -Eiq \
            'HTTP[^[:cntrl:]]* (408|429|500|502|503|504)|requested URL returned error: (408|429|500|502|503|504)|Could not resolve host|Temporary failure in name resolution|Connection (reset|timed out)|download[^[:cntrl:]]*timed out' "$logfile"; then
            return "$rc"
        fi
        echo "  Transient download failure; retrying in $((attempt * 10))s"
        sleep "$((attempt * 10))"
    done
}

# Curl retries only transient errors, with a bounded request/retry budget.
fetch_toolchain() {
    local payload rc
    payload="$(mktemp)" || return 1
    # A regular output file lets curl discard partial data before each retry.
    # Never publish bytes from a transfer that ultimately failed.
    if curl -fsSL --connect-timeout 20 --max-time 120 --retry 3 \
        --retry-delay 5 --retry-max-time 300 --output "$payload" "$1"; then
        tr -d '[:space:]' < "$payload"
        rc=$?
    else
        rc=$?
    fi
    rm -f "$payload"
    return "$rc"
}

validate_suite() { # csv suite source mode tactics
    python3 "$HERE/validate_suite.py" "$@"
}
