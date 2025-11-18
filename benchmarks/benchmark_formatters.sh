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

# Generate JSON output
generate_json_output() {
    local json="$OUTPUT_DIR/all_benchmarks.json"
    
    log_info "Generating JSON output..."
    
    cat > "$json" <<EOF
{
  "metadata": {
    "timestamp": "$(date -Iseconds)",
    "timeout": $TIMEOUT,
    "parallel_jobs": $PARALLEL_JOBS,
    "tactics": $(printf '%s\n' "${TACTICS[@]}" | jq -R . | jq -s .)
  },
  "benchmarks": [
EOF
    
    local first_benchmark=1
    for spec in "${BENCHMARK_FILES[@]}"; do
        read -r import_path file_path display_name timeout <<< "$(parse_benchmark_spec "$spec")"
        local csv="$OUTPUT_DIR/${display_name}_results.csv"
        
        if [[ ! -f "$csv" ]]; then
            log_warning "CSV not found for $display_name, skipping"
            continue
        fi
        
        log_verbose "Processing JSON for $display_name"
        
        # Add comma separator between benchmarks
        [[ $first_benchmark -eq 0 ]] && echo "," >> "$json"
        first_benchmark=0
        
        cat >> "$json" <<EOF
    {
      "name": "$display_name",
      "file": "$file_path",
      "timeout": $timeout,
      "theorems": [
EOF
        
        local first_theorem=1
        while IFS=, read -r bench theorem stmt rest; do
            # Add comma separator between theorems
            if [[ $first_theorem -eq 0 ]]; then
                echo "," >> "$json"
            fi
            first_theorem=0
            
            # Escape JSON strings
            local safe_theorem=$(echo "$theorem" | sed 's/\\/\\\\/g; s/"/\\"/g')
            local safe_stmt=$(echo "$stmt" | sed 's/\\/\\\\/g; s/"/\\"/g' | tr -d '\n')
            
            cat >> "$json" <<EOF
        {
          "name": "$safe_theorem",
          "statement": "$safe_stmt",
          "results": {
EOF
            
            # Process tactic results
            local remaining="$rest"
            local first_tactic=1
            for tactic in "${TACTICS[@]}"; do
                local time=$(echo "$remaining" | cut -d',' -f1)
                local status=$(echo "$remaining" | cut -d',' -f2)
                remaining=$(echo "$remaining" | cut -d',' -f3-)
                
                if [[ $first_tactic -eq 0 ]]; then
                    echo "," >> "$json"
                fi
                first_tactic=0
                
                cat >> "$json" <<EOF
            "$tactic": {
              "time_ms": $([ "$status" = "OK" ] && echo "$time" || echo "null"),
              "status": "$status"
            }
EOF
            done
            
            echo "          }" >> "$json"
            echo -n "        }" >> "$json"
        done < <(tail -n +2 "$csv")

        cat >> "$json" <<EOF

      ]
    }
EOF
    done
    
    cat >> "$json" <<EOF
  ]
}
EOF
    
    log_success "JSON output: $json"
}

# Calculate statistics for a benchmark
# Args: csv_file
calculate_statistics() {
    local csv="$1"
    
    [[ ! -f "$csv" ]] && return 1
    
    local total_theorems=$(tail -n +2 "$csv" | wc -l)
    
    echo "total_theorems:$total_theorems"
    
    for tactic in "${TACTICS[@]}"; do
        local successes=0
        local timeouts=0
        local failures=0
        local total_time=0
        local count=0
        
        # Parse results for this tactic
        tail -n +2 "$csv" | while IFS=',' read -r line; do
            # Find tactic columns (need to parse header to get positions)
            :
        done
        
        # Count by searching for patterns
        successes=$(grep -o ",OK" "$csv" | grep -B1 "$tactic" | grep -c "OK" || echo 0)
        timeouts=$(grep -o ",TIMEOUT" "$csv" | grep -B1 "$tactic" | grep -c "TIMEOUT" || echo 0)
        failures=$(grep -o ",FAIL" "$csv" | grep -B1 "$tactic" | grep -c "FAIL" || echo 0)
        
        echo "${tactic}_success:$successes"
        echo "${tactic}_timeout:$timeouts"
        echo "${tactic}_fail:$failures"
    done
}

# Show summary statistics
show_summary() {
    log_info "Benchmark Summary"
    echo ""
    
    for spec in "${BENCHMARK_FILES[@]}"; do
        read -r _ _ display_name _ <<< "$(parse_benchmark_spec "$spec")"
        local csv="$OUTPUT_DIR/${display_name}_results.csv"
        
        if [[ ! -f "$csv" ]]; then
            continue
        fi
        
        echo -e "${BLUE}═══ $display_name ═══${NC}"
        
        local total=$(tail -n +2 "$csv" | wc -l)
        echo "Total theorems: $total"
        echo ""
        
        # Calculate statistics for each tactic
        printf "%-10s %8s %8s %8s %8s\n" "Tactic" "Success" "Timeout" "Fail" "Avg Time"
        printf "%-10s %8s %8s %8s %8s\n" "------" "-------" "-------" "----" "--------"
        
        for tactic in "${TACTICS[@]}"; do
            local success=0
            local timeout=0
            local fail=0
            local times=()
            
            # Parse CSV for this tactic's results
            local col_idx=4  # Starting column for first tactic
            for t in "${TACTICS[@]}"; do
                if [[ "$t" == "$tactic" ]]; then
                    break
                fi
                ((col_idx += 2))
            done
            
            local status_col=$((col_idx + 1))
            
            while IFS=',' read -r line; do
                local status=$(echo "$line" | cut -d',' -f${status_col})
                local time=$(echo "$line" | cut -d',' -f${col_idx})
                
                case "$status" in
                    OK)
                        ((success++))
                        times+=("$time")
                        ;;
                    TIMEOUT)
                        ((timeout++))
                        ;;
                    FAIL)
                        ((fail++))
                        ;;
                esac
            done < <(tail -n +2 "$csv")
            
            # Calculate average time
            local avg_time="N/A"
            if [[ ${#times[@]} -gt 0 ]]; then
                local sum=0
                for t in "${times[@]}"; do
                    ((sum += t))
                done
                avg_time=$(( sum / ${#times[@]} ))
                avg_time="${avg_time}ms"
            fi
            
            # Format output with colors
            local success_str=$(printf "${GREEN}%7d${NC}" "$success")
            local timeout_str=$(printf "${RED}%7d${NC}" "$timeout")
            local fail_str=$(printf "${RED}%7d${NC}" "$fail")
            
            printf "%-10s %8s %8s %8s %8s\n" \
                "$tactic" "$success_str" "$timeout_str" "$fail_str" "$avg_time"
        done
        
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