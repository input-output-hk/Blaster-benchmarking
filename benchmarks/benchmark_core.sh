#!/bin/bash
# Core benchmark testing functions

# Test a single tactic on a theorem
# Args: import_path benchmark_name theorem_name statement tactic context file_hash timeout
# Returns: time_ms|status
test_tactic() {
    local import_path="$1"
    local benchmark_name="$2"
    local theorem_name="$3"
    local statement="$4"
    local tactic="$5"
    local context="$6"
    local file_hash="$7"
    local timeout="${8:-$TIMEOUT}"
    
    # Check cache first
    local cache_key=$(generate_cache_key "$benchmark_name" "$theorem_name" "$tactic" "$file_hash")
    local cached_result=$(check_cache "$cache_key")
    if [[ -n "$cached_result" ]]; then
        log_verbose "Cache hit: $benchmark_name/$theorem_name/$tactic"
        echo "$cached_result"
        return 0
    fi
    
    # Dry run mode
    if [[ $DRY_RUN -eq 1 ]]; then
        echo "0|DRY_RUN"
        return 0
    fi
    
    # Create test file
    local test_file="$TEMP_DIR/Test_${benchmark_name}_${theorem_name}_${tactic}.lean"
    local tactic_import=$(get_tactic_import "$tactic")
    local tactic_preamble=$(get_tactic_preamble "$tactic")
    
    {
        [[ -n "$tactic_import" ]] && echo "import $tactic_import" && echo ""
        [[ -n "$context" ]] && echo "$context" && echo ""
        [[ -n "$tactic_preamble" ]] && echo "$tactic_preamble" && echo ""
        echo "-- Standalone proof attempt for $theorem_name"
        echo "example $statement := by $tactic"
    } > "$test_file"
    
    # Run test with timeout
    local start=$(date +%s%N)
    local error_log="$TEMP_DIR/error_${benchmark_name}_${theorem_name}_${tactic}.log"
    local result
    
    if timeout "${timeout}s" lake env lean "$test_file" 2>&1 > "$error_log"; then
        local elapsed=$(( ($(date +%s%N) - start) / 1000000 ))
        result="${elapsed}|OK"
    else
        local exit_code=$?
        if [[ $exit_code -eq 124 ]]; then
            result="timeout|TIMEOUT"
        else
            result="fail|FAIL"
        fi
    fi
    
    # Store in cache
    store_cache "$cache_key" "$result"
    
    echo "$result"
}

# Process a single theorem with all tactics
# Args: benchmark_name file_path theorem_name file_hash timeout
process_theorem() {
    local benchmark_name="$1"
    local file_path="$2"
    local theorem_name="$3"
    local file_hash="$4"
    local timeout="$5"
    
    # Extract theorem statement and context
    local statement=$(extract_theorem_info "$file_path" "$theorem_name")
    if [[ -z "$statement" ]]; then
        echo "  ${RED}✗${NC} Could not extract statement" >&2
        return 1
    fi
    
    local context=$(extract_context "$file_path")
    
    # Test each tactic
    local results=""
    for tactic in "${TACTICS[@]}"; do
        local result=$(test_tactic "" "$benchmark_name" "$theorem_name" \
                                   "$statement" "$tactic" "$context" \
                                   "$file_hash" "$timeout" 2>&1)

        IFS='|' read -r time status <<< "$result"
        results="${results},${time},${status}"

        # Show result immediately (always show unless quiet)
        if [[ $QUIET -eq 0 ]]; then
            case "$status" in
                OK)
                    echo -e "    ${tactic}: ${GREEN}✓${NC} ${time}ms" >&2
                    ;;
                TIMEOUT)
                    echo -e "    ${tactic}: ${RED}✗ TIMEOUT${NC} (>${timeout}s)" >&2
                    ;;
                FAIL)
                    echo -e "    ${tactic}: ${RED}✗ FAIL${NC}" >&2
                    ;;
                DRY_RUN)
                    echo -e "    ${tactic}: ${CYAN}[DRY RUN]${NC}" >&2
                    ;;
            esac
        fi
    done

    # Return CSV row
    echo "$benchmark_name,$theorem_name,\"$statement\"$results"
}

# Note: Functions are available in main script context
# For parallel execution, the subshell will need to source the modules

# Run benchmarks for a single benchmark file
# Args: spec
run_benchmark_file() {
    local spec="$1"
    read -r import_path file_path display_name timeout <<< "$(parse_benchmark_spec "$spec")"
    
    if [[ ! -f "$file_path" ]]; then
        log_warning "Skipping $display_name: file not found ($file_path)"
        return 1
    fi
    
    log_info "Running benchmark: $display_name"
    
    # Setup output file
    local csv="$OUTPUT_DIR/${display_name}_results.csv"
    generate_csv_header > "$csv"
    
    # Get file hash for caching
    local file_hash=$(get_file_hash "$file_path")
    
    # Get all theorems
    local theorems=($(get_all_theorems "$file_path"))
    local total=${#theorems[@]}
    
    log_info "Found $total theorems in $display_name"
    
    if [[ $total -eq 0 ]]; then
        log_warning "No theorems found in $file_path"
        return 1
    fi
    
    log_verbose "First few theorems: ${theorems[@]:0:3}"
    
    local start_time=$(date +%s)
    
    # Run tests (parallel or sequential)
    if [[ $PARALLEL_JOBS -gt 1 ]]; then
        log_info "Running with $PARALLEL_JOBS parallel jobs"

        # Create a wrapper script for parallel execution
        local wrapper_script="$TEMP_DIR/process_wrapper_${display_name}.sh"

        # Serialize tactic imports and preambles for the wrapper
        local tactic_imports_serialized=""
        local tactic_preambles_serialized=""
        for key in "${!TACTIC_IMPORTS[@]}"; do
            tactic_imports_serialized+="[\"$key\"]=\"${TACTIC_IMPORTS[$key]}\""$'\n'
        done
        for key in "${!TACTIC_PREAMBLES[@]}"; do
            tactic_preambles_serialized+="[\"$key\"]=\"${TACTIC_PREAMBLES[$key]}\""$'\n'
        done

        cat > "$wrapper_script" <<'WRAPPER_EOF'
#!/bin/bash
# Wrapper script for parallel execution
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../benchmarks" && pwd)"

# Source required modules
source "${SCRIPT_DIR}/benchmark_config.sh"
source "${SCRIPT_DIR}/benchmark_utils.sh"

# Re-export color codes
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; NC='\033[0m'

# Recreate associative arrays from serialized data
declare -A TACTIC_IMPORTS
declare -A TACTIC_PREAMBLES
WRAPPER_EOF

        # Add the serialized array data
        echo "$tactic_imports_serialized" | while IFS= read -r line; do
            [[ -n "$line" ]] && echo "TACTIC_IMPORTS$line" >> "$wrapper_script"
        done
        echo "$tactic_preambles_serialized" | while IFS= read -r line; do
            [[ -n "$line" ]] && echo "TACTIC_PREAMBLES$line" >> "$wrapper_script"
        done

        # Continue with the rest of the wrapper script
        cat >> "$wrapper_script" <<'WRAPPER_EOF2'

# Define test_tactic function
test_tactic() {
    local import_path="$1"
    local benchmark_name="$2"
    local theorem_name="$3"
    local statement="$4"
    local tactic="$5"
    local context="$6"
    local file_hash="$7"
    local timeout="${8:-$TIMEOUT}"

    # Check cache first
    local cache_key=$(generate_cache_key "$benchmark_name" "$theorem_name" "$tactic" "$file_hash")
    local cached_result=$(check_cache "$cache_key")
    if [[ -n "$cached_result" ]]; then
        echo "$cached_result"
        return 0
    fi

    # Dry run mode
    if [[ $DRY_RUN -eq 1 ]]; then
        echo "0|DRY_RUN"
        return 0
    fi

    # Create test file with unique name
    local test_file="$TEMP_DIR/Test_${benchmark_name}_${theorem_name}_${tactic}_$$.lean"
    local tactic_import=$(get_tactic_import "$tactic")
    local tactic_preamble=$(get_tactic_preamble "$tactic")

    {
        [[ -n "$tactic_import" ]] && echo "import $tactic_import" && echo ""
        [[ -n "$context" ]] && echo "$context" && echo ""
        [[ -n "$tactic_preamble" ]] && echo "$tactic_preamble" && echo ""
        echo "-- Standalone proof attempt for $theorem_name"
        echo "example $statement := by $tactic"
    } > "$test_file"

    # Run test with timeout
    local start=$(date +%s%N)
    local error_log="$TEMP_DIR/error_${benchmark_name}_${theorem_name}_${tactic}_$$.log"
    local result

    if timeout "${timeout}s" lake env lean "$test_file" 2>&1 > "$error_log"; then
        local elapsed=$(( ($(date +%s%N) - start) / 1000000 ))
        result="${elapsed}|OK"
    else
        local exit_code=$?
        if [[ $exit_code -eq 124 ]]; then
            result="timeout|TIMEOUT"
        else
            result="fail|FAIL"
        fi
    fi

    # Store in cache
    store_cache "$cache_key" "$result"

    echo "$result"
}

# Execute: test single tactic
test_tactic "$@"
WRAPPER_EOF2

        chmod +x "$wrapper_script"

        # Process theorems in parallel
        local current=0
        for theorem in "${theorems[@]}"; do
            current=$((current + 1))

            # Show theorem being processed
            if [[ $QUIET -eq 0 ]]; then
                clear_progress
                echo -e "${BLUE}[$current/$total]${NC} ${YELLOW}$theorem${NC}"
            fi

            # Extract theorem info
            local statement=$(extract_theorem_info "$file_path" "$theorem")
            if [[ -z "$statement" ]]; then
                log_warning "  Could not extract statement for $theorem"
                continue
            fi

            local context=$(extract_context "$file_path")

            # Start parallel jobs for all tactics and collect results
            local tactic_pids=()
            local tactic_outputs=()

            for i in "${!TACTICS[@]}"; do
                local tactic="${TACTICS[$i]}"
                local output_file="$TEMP_DIR/result_${display_name}_${theorem}_${i}_$$.txt"
                tactic_outputs[$i]="$output_file"

                # Run tactic test in background
                bash "$wrapper_script" "" "$display_name" "$theorem" \
                    "$statement" "$tactic" "$context" "$file_hash" "$timeout" \
                    > "$output_file" 2>&1 &
                tactic_pids[$i]=$!
            done

            # Wait for all tactics to complete and collect results
            local results=""
            for i in "${!TACTICS[@]}"; do
                wait "${tactic_pids[$i]}" 2>/dev/null || true
                local result=$(cat "${tactic_outputs[$i]}" 2>/dev/null || echo "fail|FAIL")

                IFS='|' read -r time status <<< "$result"
                results="${results},${time},${status}"

                # Show result immediately (always show unless quiet)
                if [[ $QUIET -eq 0 ]]; then
                    local tactic="${TACTICS[$i]}"
                    case "$status" in
                        OK)
                            echo -e "    ${tactic}: ${GREEN}✓${NC} ${time}ms" >&2
                            ;;
                        TIMEOUT)
                            echo -e "    ${tactic}: ${RED}✗ TIMEOUT${NC} (>${timeout}s)" >&2
                            ;;
                        FAIL)
                            echo -e "    ${tactic}: ${RED}✗ FAIL${NC}" >&2
                            ;;
                        DRY_RUN)
                            echo -e "    ${tactic}: ${CYAN}[DRY RUN]${NC}" >&2
                            ;;
                    esac
                fi

                # Clean up temp file
                rm -f "${tactic_outputs[$i]}"
            done

            # Write CSV row atomically
            echo "$display_name,$theorem,\"$statement\"$results" >> "$csv"

            # Blank line between theorems
            [[ $QUIET -eq 0 ]] && echo ""
        done

        log_verbose "Completed processing all theorems in parallel mode"
    else
        # Sequential processing with progress
        local current=0

        for theorem in "${theorems[@]}"; do
            current=$((current + 1))

            # Show theorem being processed (always show, not just verbose)
            if [[ $QUIET -eq 0 ]]; then
                clear_progress
                echo -e "${BLUE}[$current/$total]${NC} ${YELLOW}$theorem${NC}"
            fi

            # Process theorem - capture stdout (CSV row) and let stderr (results) display
            local row
            row=$(process_theorem "$display_name" "$file_path" "$theorem" \
                                 "$file_hash" "$timeout") || {
                log_warning "  Failed to process theorem: $theorem"
                continue
            }

            if [[ -n "$row" ]]; then
                echo "$row" >> "$csv"
            else
                log_warning "  Empty result for theorem: $theorem"
            fi

            # Blank line between theorems (not in quiet mode)
            [[ $QUIET -eq 0 ]] && echo ""
        done

        log_verbose "Completed processing all theorems"
    fi
    
    log_success "Completed $display_name: $total theorems processed"
}

# Run all benchmarks
run_benchmarks() {
    archive_previous_results
    
    log_info "Starting benchmark suite"
    log_info "Configuration:"
    log_info "  Timeout: ${TIMEOUT}s"
    log_info "  Parallel jobs: $PARALLEL_JOBS"
    log_info "  Cache: $([ $ENABLE_CACHE -eq 1 ] && echo 'enabled' || echo 'disabled')"
    log_info "  Dry run: $([ $DRY_RUN -eq 1 ] && echo 'yes' || echo 'no')"
    echo ""
    
    for spec in "${BENCHMARK_FILES[@]}"; do
        run_benchmark_file "$spec" || log_warning "Benchmark failed, continuing..."
    done
    
    log_success "All benchmarks complete"
}

# Test a single theorem with a specific tactic
# Args: benchmark_name theorem_name tactic
test_single() {
    local target_benchmark="$1"
    local target_theorem="$2"
    local target_tactic="$3"
    
    for spec in "${BENCHMARK_FILES[@]}"; do
        read -r import_path file_path display_name timeout <<< "$(parse_benchmark_spec "$spec")"
        
        [[ "$display_name" != "$target_benchmark" ]] && continue
        
        if [[ ! -f "$file_path" ]]; then
            log_error "Benchmark file not found: $file_path"
            exit 1
        fi
        
        local statement=$(extract_theorem_info "$file_path" "$target_theorem")
        if [[ -z "$statement" ]]; then
            log_error "Theorem not found: $target_theorem"
            echo ""
            echo "Available theorems in $display_name:"
            get_all_theorems "$file_path" | while read -r thm; do
                echo "  - $thm"
            done
            exit 1
        fi
        
        log_info "Testing: $display_name / $target_theorem / $target_tactic"
        log_verbose "Statement: $statement"
        
        local context=$(extract_context "$file_path")
        local file_hash=$(get_file_hash "$file_path")
        
        local result=$(test_tactic "" "$display_name" "$target_theorem" \
                                   "$statement" "$target_tactic" "$context" \
                                   "$file_hash" "$timeout")
        
        IFS='|' read -r time status <<< "$result"
        
        case "$status" in
            OK)
                echo -e "${GREEN}✓ SUCCESS${NC} (${time}ms)"
                ;;
            TIMEOUT)
                echo -e "${RED}✗ TIMEOUT${NC} (>${timeout}s)"
                ;;
            FAIL)
                echo -e "${RED}✗ FAILED${NC}"
                local error_log="$TEMP_DIR/error_${display_name}_${target_theorem}_${target_tactic}.log"
                if [[ -f "$error_log" ]]; then
                    echo ""
                    echo "Error output:"
                    cat "$error_log"
                fi
                ;;
        esac
        
        exit 0
    done
    
    log_error "Benchmark not found: $target_benchmark"
    exit 1
}

# Generate all output formats
generate_all_outputs() {
    log_info "Generating output formats..."
    generate_latex_output
    generate_json_output
    show_summary
    log_success "Output generation complete"
}