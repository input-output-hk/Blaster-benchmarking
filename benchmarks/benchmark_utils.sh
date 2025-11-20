#!/bin/bash
# Utility functions for benchmark system

# Logging functions
log_verbose() {
    [[ $VERBOSE -eq 1 ]] && echo -e "${CYAN}[VERBOSE]${NC} $*" >&2
}

log_info() {
    [[ $QUIET -eq 0 ]] && echo -e "${BLUE}[INFO]${NC} $*"
}

log_success() {
    [[ $QUIET -eq 0 ]] && echo -e "${GREEN}[SUCCESS]${NC} $*"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $*" >&2
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $*" >&2
}

# Progress indicator with ETA
# Args: current total start_time description
show_progress() {
    [[ $QUIET -eq 1 ]] && return
    
    local current=$1
    local total=$2
    local start_time=$3
    local description="${4:-Processing}"
    
    local elapsed=$(($(date +%s) - start_time))
    local percentage=$((current * 100 / total))
    
    if [[ $current -gt 0 && $elapsed -gt 0 ]]; then
        local rate=$((current * 1000 / elapsed))
        local remaining=$((total - current))
        local eta=$((remaining * 1000 / rate / 1000))
        
        printf "\r${BLUE}%s:${NC} %d/%d (%.1f%%) ETA: %ds    " \
            "$description" "$current" "$total" "$percentage" "$eta"
    else
        printf "\r${BLUE}%s:${NC} %d/%d (%.1f%%)    " \
            "$description" "$current" "$total" "$percentage"
    fi
}

clear_progress() {
    [[ $QUIET -eq 1 ]] && return
    printf "\r%80s\r" " "
}

# File hash for caching
# Args: file_path
get_file_hash() {
    local file="$1"
    if command -v md5sum &> /dev/null; then
        md5sum "$file" 2>/dev/null | cut -d' ' -f1
    elif command -v md5 &> /dev/null; then
        md5 -q "$file" 2>/dev/null
    else
        echo "no-hash-$(stat -f%m "$file" 2>/dev/null || stat -c%Y "$file" 2>/dev/null)"
    fi
}

# Check if cached result is valid
# Args: cache_key
check_cache() {
    [[ $ENABLE_CACHE -eq 0 ]] && return 1
    
    local cache_key="$1"
    local cache_file="${CACHE_DIR}/${cache_key}"
    
    [[ -f "$cache_file" ]] && cat "$cache_file" && return 0
    return 1
}

# Store result in cache
# Args: cache_key result
store_cache() {
    [[ $ENABLE_CACHE -eq 0 ]] && return
    
    local cache_key="$1"
    local result="$2"
    
    mkdir -p "$CACHE_DIR"
    echo "$result" > "${CACHE_DIR}/${cache_key}"
}

# Generate cache key
# Args: benchmark theorem tactic file_hash
generate_cache_key() {
    local key="$1_$2_$3_$4"
    echo "$key" | sed 's/[^a-zA-Z0-9_-]/_/g'
}

# Extract context (imports, abbrevs, opens, namespace) from Lean file
# Args: file_path
extract_context() {
    local file="$1"
    local context=""
    
    while IFS= read -r line; do
        [[ $line =~ ^[[:space:]]*theorem[[:space:]]+ ]] && break
        [[ $line =~ ^[[:space:]]*(import|abbrev|open|namespace)[[:space:]]+ ]] && \
            context="$context$line"$'\n'
    done < "$file"
    
    echo "$context"
}

# Extract just the namespace and open statements (for when importing the full file)
# Args: file_path
extract_namespace_opens() {
    local file="$1"
    local context=""
    
    while IFS= read -r line; do
        [[ $line =~ ^[[:space:]]*theorem[[:space:]]+ ]] && break
        [[ $line =~ ^[[:space:]]*(open|namespace)[[:space:]]+ ]] && \
            context="$context$line"$'\n'
    done < "$file"
    
    echo "$context"
}

# Extract theorem information from Lean file
# Args: file_path theorem_name
# Returns: Theorem statement
extract_theorem_info() {
    local file="$1"
    local theorem_name="$2"
    local in_theorem=0
    local statement=""
    
    while IFS= read -r line; do
        if [[ $line =~ ^[[:space:]]*theorem[[:space:]]+${theorem_name}[[:space:]]*(.*)[[:space:]]*:= ]]; then
            statement="${BASH_REMATCH[1]%%:=*}"
            echo "$statement"
            return 0
        elif [[ $line =~ ^[[:space:]]*theorem[[:space:]]+${theorem_name}[[:space:]]+(.*) ]]; then
            statement="${BASH_REMATCH[1]}"
            in_theorem=1
        elif [[ $in_theorem -eq 1 && $line =~ :=[[:space:]]*by ]]; then
            statement="$statement ${line%:=*}"
            echo "${statement%% :=*}"
            return 0
        elif [[ $in_theorem -eq 1 ]]; then
            statement="$statement $line"
        fi
    done < "$file"
    
    return 1
}

# Get all theorems from a Lean file
# Args: file_path
get_all_theorems() {
    grep -E "^[[:space:]]*theorem[[:space:]]+" "$1" | \
        awk '{print $2}' | \
        sed 's/[[:space:]].*$//'
}

# List available benchmarks
list_benchmarks() {
    log_info "Available benchmarks:"
    for spec in "${BENCHMARK_FILES[@]}"; do
        IFS=':' read -r import_path file_path display_name timeout <<< "$spec"
        if [[ -f "$file_path" ]]; then
            local theorem_count=$(get_all_theorems "$file_path" | wc -l)
            echo -e "  ${GREEN}✓${NC} $display_name (${theorem_count} theorems, timeout: ${timeout}s)"
            log_verbose "    File: $file_path"
            log_verbose "    Import: $import_path"
        else
            echo -e "  ${RED}✗${NC} $display_name (file not found: $file_path)"
        fi
    done
}

# Archive previous results
archive_previous_results() {
    [[ $ARCHIVE_RESULTS -eq 0 ]] && return
    [[ ! -d "$OUTPUT_DIR" ]] && return
    
    local timestamp=$(date +%Y%m%d_%H%M%S)
    local archive_path="${ARCHIVE_DIR}/${timestamp}"
    
    mkdir -p "$archive_path"
    
    if ls "${OUTPUT_DIR}"/*.{csv,json,tex} &>/dev/null; then
        log_verbose "Archiving previous results to $archive_path"
        mv "${OUTPUT_DIR}"/*.{csv,json,tex} "$archive_path/" 2>/dev/null || true
    fi
}

# Parse benchmark specification
# Args: spec_string
# Returns: import_path file_path display_name timeout (space-separated)
parse_benchmark_spec() {
    local spec="$1"
    IFS=':' read -r import_path file_path display_name timeout <<< "$spec"
    timeout="${timeout:-$TIMEOUT}"
    echo "$import_path $file_path $display_name $timeout"
}

# Format time with color based on threshold
# Args: time_ms
format_time_colored() {
    local time=$1
    
    if [[ $time -lt $FAST_THRESHOLD ]]; then
        echo -e "${GREEN}${time}ms${NC}"
    elif [[ $time -lt $SLOW_THRESHOLD ]]; then
        echo -e "${YELLOW}${time}ms${NC}"
    else
        echo -e "${RED}${time}ms${NC}"
    fi
}