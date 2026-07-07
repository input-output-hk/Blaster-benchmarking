#!/bin/bash
# Output formatting functions for various formats

# Generate CSV header
generate_csv_header() {
    echo -n "Benchmark,Theorem,Statement"
    for tactic in "${TACTICS[@]}"; do
        echo -n ",${tactic}_time,${tactic}_status"
    done
    echo ""
}

# Generate LaTeX table header
# Args: benchmark_name
generate_latex_header() {
    local benchmark_name="$1"
    local col_format="l"
    local tactic_header=""
    
    for tactic in "${TACTICS[@]}"; do
        col_format="${col_format}c"
        tactic_header="$tactic_header & \\texttt{$tactic}"
    done
    
    cat <<EOF
\\begin{table}[htbp]
\\centering
\\small
\\begin{tabular}{$col_format}
\\toprule
\\multicolumn{$((${#TACTICS[@]} + 1))}{c}{\\textbf{$benchmark_name Benchmark}} \\\\
\\midrule
Theorem$tactic_header \\\\
\\midrule
EOF
}

# Generate LaTeX table footer
# Args: benchmark_name
generate_latex_footer() {
    local benchmark_name="$1"
    cat <<EOF
\\bottomrule
\\end{tabular}
\\caption{$benchmark_name benchmark results. Times in milliseconds. TO = timeout (>${TIMEOUT}s), ✗ = failed.}
\\label{tab:benchmark_${benchmark_name}}
\\end{table}

EOF
}

# Format time for LaTeX output
# Args: time status
format_latex_time() {
    local time="$1"
    local status="$2"
    
    case "$status" in
        OK)
            if [[ $time -lt $FAST_THRESHOLD ]]; then
                echo "\\textcolor{green!70!black}{$time}"
            elif [[ $time -lt $SLOW_THRESHOLD ]]; then
                echo "$time"
            else
                echo "\\textcolor{orange!80!black}{$time}"
            fi
            ;;
        TIMEOUT)
            echo "\\textcolor{red}{TO}"
            ;;
        FAIL)
            echo "\\textcolor{red}{✗}"
            ;;
        DRY_RUN)
            echo "---"
            ;;
        *)
            echo "---"
            ;;
    esac
}

# Generate LaTeX output from CSV files
generate_latex_output() {
    local combined="$OUTPUT_DIR/all_benchmarks.tex"
    
    log_info "Generating LaTeX output..."
    
    cat > "$combined" <<'EOF'
% Generated benchmark tables
% Requires: \usepackage{booktabs,xcolor}

EOF
    
    for spec in "${BENCHMARK_FILES[@]}"; do
        read -r _ _ display_name _ <<< "$(parse_benchmark_spec "$spec")"
        local csv="$OUTPUT_DIR/${display_name}_results.csv"
        
        if [[ ! -f "$csv" ]]; then
            log_warning "CSV not found for $display_name, skipping"
            continue
        fi
        
        log_verbose "Processing LaTeX for $display_name"
        
        {
            generate_latex_header "$display_name"
            
            # Process CSV data
            tail -n +2 "$csv" | while IFS=, read -r bench theorem stmt rest; do
                # Escape LaTeX special characters in theorem name
                local safe_theorem=$(echo "$theorem" | sed 's/_/\\_/g; s/#/\\#/g; s/&/\\&/g')
                echo -n "$safe_theorem"
                
                # Process tactic results
                local remaining="$rest"
                for _ in "${TACTICS[@]}"; do
                    local time=$(echo "$remaining" | cut -d',' -f1)
                    local status=$(echo "$remaining" | cut -d',' -f2)
                    remaining=$(echo "$remaining" | cut -d',' -f3-)
                    echo -n " & $(format_latex_time "$time" "$status")"
                done
                echo " \\\\"
            done
            
            generate_latex_footer "$display_name"
        } >> "$combined"
    done
    
    log_success "LaTeX output: $combined"
}

# Generate JSON output (pure Python, no jq dependency)
generate_json_output() {
    local json="$OUTPUT_DIR/all_benchmarks.json"
    log_info "Generating JSON output..."

    # Build args: csv_file:display_name:timeout pairs
    local csv_specs=()
    for spec in "${BENCHMARK_FILES[@]}"; do
        read -r _ file_path display_name timeout _mode <<< "$(parse_benchmark_spec "$spec")"
        local csv="$OUTPUT_DIR/${display_name}_results.csv"
        [[ -f "$csv" ]] && csv_specs+=("${csv}:${display_name}:${timeout}")
    done

    python3 - "$json" "$TIMEOUT" "$PARALLEL_JOBS" "${csv_specs[@]}" <<'PYEOF'
import csv, json, sys
from datetime import datetime, timezone

out_file = sys.argv[1]
timeout = int(sys.argv[2])
parallel = int(sys.argv[3])
specs = sys.argv[4:]

benchmarks = []
for spec in specs:
    csv_file, name, bench_timeout = spec.rsplit(':', 2)
    with open(csv_file, newline='') as f:
        rows = list(csv.DictReader(f))
    tactics = [k[:-len('_status')] for k in (rows[0] if rows else {}) if k.endswith('_status')]
    theorems = []
    for row in rows:
        results = {}
        for t in tactics:
            status = row.get(f'{t}_status', 'FAIL')
            raw_time = row.get(f'{t}_time', '')
            time_ms = int(raw_time) if status == 'OK' and raw_time.lstrip('-').isdigit() else None
            results[t] = {"time_ms": time_ms, "status": status}
        theorems.append({"name": row.get('Theorem', ''), "statement": row.get('Statement', ''), "results": results})
    benchmarks.append({"name": name, "timeout": int(bench_timeout), "theorems": theorems})

output = {
    "metadata": {
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "timeout": timeout,
        "parallel_jobs": parallel,
    },
    "benchmarks": benchmarks
}
with open(out_file, 'w') as f:
    json.dump(output, f, indent=2)
print(f"JSON output: {out_file}")
PYEOF

    log_success "JSON output: $json"
}

# Calculate statistics for a benchmark using Python for robust CSV parsing
# Args: csv_file
calculate_statistics() {
    local csv="$1"
    [[ ! -f "$csv" ]] && return 1
    python3 - "$csv" <<'PYEOF'
import csv, sys
csv_file = sys.argv[1]
with open(csv_file, newline='') as f:
    reader = csv.DictReader(f)
    rows = list(reader)
print(f"total_theorems:{len(rows)}")
for key in rows[0].keys():
    if not key.endswith('_status'):
        continue
    tactic = key[:-len('_status')]
    ok = sum(1 for r in rows if r[key] == 'OK')
    to = sum(1 for r in rows if r[key] == 'TIMEOUT')
    fa = sum(1 for r in rows if r[key] == 'FAIL')
    print(f"{tactic}_success:{ok}")
    print(f"{tactic}_timeout:{to}")
    print(f"{tactic}_fail:{fa}")
PYEOF
}

# Show summary statistics
show_summary() {
    log_info "Benchmark Summary"
    echo ""

    for spec in "${BENCHMARK_FILES[@]}"; do
        read -r _ _ display_name _ <<< "$(parse_benchmark_spec "$spec")"
        local csv="$OUTPUT_DIR/${display_name}_results.csv"

        [[ ! -f "$csv" ]] && continue

        echo -e "${BLUE}═══ $display_name ═══${NC}"

        python3 - "$csv" "$GREEN" "$RED" "$YELLOW" "$NC" <<'PYEOF'
import csv, sys
csv_file, GREEN, RED, YELLOW, NC = sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4], sys.argv[5]
with open(csv_file, newline='') as f:
    rows = list(csv.DictReader(f))
tactics = [k[:-len('_status')] for k in rows[0] if k.endswith('_status')] if rows else []
print(f"Total theorems: {len(rows)}")
print()
print(f"{'Tactic':<20} {'Success':>8} {'Timeout':>8} {'Fail':>8} {'Avg(ms)':>10}")
print(f"{'-'*20} {'-'*8} {'-'*8} {'-'*8} {'-'*10}")
for tactic in tactics:
    ok_times = [int(r[f'{tactic}_time']) for r in rows if r.get(f'{tactic}_status') == 'OK'
                and r.get(f'{tactic}_time', '').lstrip('-').isdigit()]
    to = sum(1 for r in rows if r.get(f'{tactic}_status') == 'TIMEOUT')
    fa = sum(1 for r in rows if r.get(f'{tactic}_status') == 'FAIL')
    avg = f"{sum(ok_times)//len(ok_times)}ms" if ok_times else "N/A"
    print(f"{tactic:<20} {GREEN}{len(ok_times):>8}{NC} {RED}{to:>8}{NC} {RED}{fa:>8}{NC} {avg:>10}")
PYEOF

        echo ""
    done
}

# Compare current results with baseline
# Args: baseline_file
compare_with_baseline() {
    local baseline="$1"
    
    if [[ ! -f "$baseline" ]]; then
        log_error "Baseline file not found: $baseline"
        return 1
    fi
    
    log_info "Comparing with baseline: $baseline"
    
    # Extract benchmark name from baseline filename
    local baseline_name=$(basename "$baseline" _results.csv)
    local current="$OUTPUT_DIR/${baseline_name}_results.csv"
    
    if [[ ! -f "$current" ]]; then
        log_error "Current results not found: $current"
        return 1
    fi
    
    echo -e "\n${BLUE}═══ Comparison: $baseline_name ═══${NC}\n"
    
    # Compare results
    local improvements=0
    local regressions=0
    local unchanged=0
    
    # Create associative arrays for baseline
    declare -A baseline_results
    
    while IFS=',' read -r bench theorem stmt rest; do
        baseline_results["$theorem"]="$rest"
    done < <(tail -n +2 "$baseline")
    
    # Compare with current
    while IFS=',' read -r bench theorem stmt rest; do
        if [[ -z "${baseline_results[$theorem]}" ]]; then
            echo -e "${YELLOW}NEW${NC}: $theorem"
            continue
        fi
        
        # Compare each tactic
        local base_rest="${baseline_results[$theorem]}"
        local changed=0
        
        for tactic in "${TACTICS[@]}"; do
            # Extract time and status for baseline
            local base_time=$(echo "$base_rest" | cut -d',' -f1)
            local base_status=$(echo "$base_rest" | cut -d',' -f2)
            base_rest=$(echo "$base_rest" | cut -d',' -f3-)
            
            # Extract time and status for current
            local curr_time=$(echo "$rest" | cut -d',' -f1)
            local curr_status=$(echo "$rest" | cut -d',' -f2)
            rest=$(echo "$rest" | cut -d',' -f3-)
            
            # Check for changes
            if [[ "$base_status" != "$curr_status" ]]; then
                if [[ "$base_status" != "OK" && "$curr_status" == "OK" ]]; then
                    echo -e "  ${GREEN}IMPROVED${NC}: $theorem / $tactic: $base_status → $curr_status"
                    ((improvements++))
                    changed=1
                elif [[ "$base_status" == "OK" && "$curr_status" != "OK" ]]; then
                    echo -e "  ${RED}REGRESSED${NC}: $theorem / $tactic: $base_status → $curr_status"
                    ((regressions++))
                    changed=1
                fi
            elif [[ "$base_status" == "OK" && "$curr_status" == "OK" ]]; then
                # Check time difference
                local diff=$((curr_time - base_time))
                local percent_diff=$((diff * 100 / base_time))
                
                if [[ $percent_diff -gt 20 ]]; then
                    echo -e "  ${RED}SLOWER${NC}: $theorem / $tactic: ${base_time}ms → ${curr_time}ms (+${percent_diff}%)"
                    ((regressions++))
                    changed=1
                elif [[ $percent_diff -lt -20 ]]; then
                    echo -e "  ${GREEN}FASTER${NC}: $theorem / $tactic: ${base_time}ms → ${curr_time}ms (${percent_diff}%)"
                    ((improvements++))
                    changed=1
                fi
            fi
        done
        
        [[ $changed -eq 0 ]] && ((unchanged++))
        
    done < <(tail -n +2 "$current")
    
    # Summary
    echo ""
    echo -e "${BLUE}Summary:${NC}"
    echo -e "  ${GREEN}Improvements: $improvements${NC}"
    echo -e "  ${RED}Regressions: $regressions${NC}"
    echo -e "  Unchanged: $unchanged"
    
    if [[ $regressions -gt 0 ]]; then
        return 1
    fi
    
    return 0
}