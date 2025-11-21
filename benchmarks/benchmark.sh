#!/usr/bin/env bash
set -euo pipefail

# Main benchmark orchestration script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Detect if we're in benchmarks/ subdirectory and adjust paths
if [[ "$(basename "$PWD")" == "benchmarks" ]]; then
    # Running from benchmarks/ directory
    PROJECT_ROOT="$(cd .. && pwd)"
elif [[ -d "benchmarks" && -f "benchmarks/benchmark.sh" ]]; then
    # Running from project root
    PROJECT_ROOT="$PWD"
else
    # Assume current directory is project root
    PROJECT_ROOT="$PWD"
fi

cd "$PROJECT_ROOT"
export PROJECT_ROOT

# Load modules
source "${SCRIPT_DIR}/benchmark_config.sh"
source "${SCRIPT_DIR}/benchmark_utils.sh"
source "${SCRIPT_DIR}/benchmark_core.sh"
source "${SCRIPT_DIR}/benchmark_formatters.sh"

# Colors
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; NC='\033[0m'

# Print usage information
usage() {
    cat <<EOF
Usage: $0 [COMMAND] [OPTIONS]

Commands:
    run         Run all benchmarks (default)
    latex       Generate LaTeX tables from existing results
    json        Generate JSON output from existing results
    summary     Show summary statistics from existing results
    visualize   Generate visualization plots from existing results
    compare     Compare with baseline results
    clean       Remove all output files
    list        List available benchmarks
    test        Test a specific theorem with a tactic
    help        Show this help message

Options:
    -p, --parallel JOBS     Run with N parallel jobs (default: 1)
    -t, --timeout SECONDS   Set timeout per test (default: 5)
    -v, --verbose           Enable verbose output
    -q, --quiet             Quiet mode (minimal output)
    -d, --dry-run           Show what would be done without executing
    -b, --baseline FILE     Set baseline file for comparison
    -c, --config FILE       Load configuration from file

Examples:
    $0 run -p 4 -v                    # Run with 4 parallel jobs, verbose
    $0 test NNG4 zero_add blaster     # Test specific theorem
    $0 visualize NNG4                 # Generate visualization for NNG4
    $0 visualize                      # Generate visualizations for all benchmarks
    $0 compare -b baseline.csv        # Compare with baseline
    $0 run -d                         # Dry run to see what would execute

EOF
    exit 0
}

# Parse command line arguments
parse_args() {
    COMMAND="${1:-run}"
    shift || true
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            -p|--parallel)
                PARALLEL_JOBS="$2"
                shift 2
                ;;
            -t|--timeout)
                TIMEOUT="$2"
                shift 2
                ;;
            -v|--verbose)
                VERBOSE=1
                shift
                ;;
            -q|--quiet)
                QUIET=1
                VERBOSE=0
                shift
                ;;
            -d|--dry-run)
                DRY_RUN=1
                shift
                ;;
            -b|--baseline)
                BASELINE_FILE="$2"
                shift 2
                ;;
            -c|--config)
                CONFIG_FILE="$2"
                [[ -f "$CONFIG_FILE" ]] && source "$CONFIG_FILE"
                shift 2
                ;;
            -h|--help)
                usage
                ;;
            *)
                COMMAND_ARGS+=("$1")
                shift
                ;;
        esac
    done
}

# Check system requirements
check_requirements() {
    local required_mb=100
    local available=$(df "$OUTPUT_DIR" 2>/dev/null | awk 'NR==2 {print int($4/1024)}' || echo "0")
    
    if [[ $available -lt $required_mb ]]; then
        echo -e "${RED}Error: Insufficient disk space (need ${required_mb}MB, have ${available}MB)${NC}" >&2
        exit 1
    fi
    
    if ! command -v lake &> /dev/null; then
        echo -e "${RED}Error: 'lake' command not found${NC}" >&2
        exit 1
    fi
}

# Main execution
main() {
    # Load config if exists
    [[ -f "$CONFIG_FILE" ]] && source "$CONFIG_FILE"
    
    # Parse arguments
    parse_args "$@"
    
    # Setup
    mkdir -p "$TEMP_DIR" "$OUTPUT_DIR"
    check_requirements
    
    # Execute command
    case "$COMMAND" in
        run)
            run_benchmarks
            generate_all_outputs
            log_success "Benchmark complete!"
            ;;
        latex)
            generate_latex_output
            log_success "LaTeX output generated"
            ;;
        json)
            generate_json_output
            log_success "JSON output generated"
            ;;
        summary)
            show_summary
            ;;
        visualize)
            # Check if Python and matplotlib are available
            if ! command -v python3 &> /dev/null; then
                log_error "python3 not found. Please install Python 3 to use visualization."
                exit 1
            fi
            
            # Check if visualize script exists
            local viz_script="${SCRIPT_DIR}/visualize_benchmarks.py"
            if [[ ! -f "$viz_script" ]]; then
                log_error "Visualization script not found: $viz_script"
                exit 1
            fi
            
            # Run visualization
            if [[ ${#COMMAND_ARGS[@]} -gt 0 ]]; then
                # Visualize specific benchmark
                python3 "$viz_script" "${COMMAND_ARGS[0]}" "$OUTPUT_DIR"
            else
                # Visualize all benchmarks
                python3 "$viz_script" "" "$OUTPUT_DIR"
            fi
            ;;
        compare)
            compare_with_baseline "${BASELINE_FILE:-$OUTPUT_DIR/baseline.csv}"
            ;;
        clean)
            rm -rf "$OUTPUT_DIR" "$TEMP_DIR"
            log_success "Cleaned output directories"
            ;;
        list)
            list_benchmarks
            ;;
        test)
            if [[ ${#COMMAND_ARGS[@]} -lt 3 ]]; then
                echo "Usage: $0 test <benchmark> <theorem> <tactic>"
                exit 1
            fi
            test_single "${COMMAND_ARGS[0]}" "${COMMAND_ARGS[1]}" "${COMMAND_ARGS[2]}"
            ;;
        help|--help|-h)
            usage
            ;;
        *)
            echo -e "${RED}Unknown command: $COMMAND${NC}"
            usage
            ;;
    esac
}

# Cleanup on exit
cleanup() {
    if [[ -d "$TEMP_DIR" ]]; then
        log_verbose "Cleaning up temporary files..."
        rm -rf "$TEMP_DIR"
    fi
}
trap cleanup EXIT

# Run main
main "$@"