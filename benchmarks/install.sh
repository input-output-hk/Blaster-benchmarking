#!/bin/bash
set -euo pipefail

# Installation script for Lean Benchmark System

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo -e "${BLUE}  Lean Benchmark System Installation${NC}"
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo ""

# Check if we're in the right directory
if [[ ! -f "benchmark.sh" ]]; then
    echo -e "${RED}Error: benchmark.sh not found${NC}"
    echo "Please run this script from the benchmark directory"
    exit 1
fi

# Make scripts executable
echo -e "${BLUE}[1/6]${NC} Making scripts executable..."
chmod +x benchmark.sh
chmod +x benchmark_config.sh
chmod +x benchmark_utils.sh
chmod +x benchmark_core.sh
chmod +x benchmark_formatters.sh
chmod +x visualize_benchmarks.py 2>/dev/null || true
echo -e "${GREEN}✓${NC} Scripts are now executable"

# Check dependencies
echo -e "\n${BLUE}[2/5]${NC} Checking dependencies..."

check_command() {
    if command -v "$1" &> /dev/null; then
        echo -e "  ${GREEN}✓${NC} $1 found"
        return 0
    else
        echo -e "  ${RED}✗${NC} $1 not found"
        return 1
    fi
}

DEPS_OK=1
check_command "bash" || DEPS_OK=0
check_command "lake" || DEPS_OK=0
check_command "lean" || DEPS_OK=0

if [[ $DEPS_OK -eq 0 ]]; then
    echo -e "${YELLOW}Warning: Some dependencies are missing${NC}"
    echo "Please install Lean 4 and Lake to use this benchmark system"
else
    echo -e "${GREEN}✓${NC} All dependencies found"
fi

# Create configuration file
echo -e "\n${BLUE}[3/5]${NC} Setting up configuration..."
if [[ -f "benchmark.conf" ]]; then
    echo -e "${YELLOW}!${NC} benchmark.conf already exists, skipping"
else
    if [[ -f "benchmark.conf.example" ]]; then
        cp benchmark.conf.example benchmark.conf
        echo -e "${GREEN}✓${NC} Created benchmark.conf from example"
    else
        echo -e "${YELLOW}!${NC} benchmark.conf.example not found"
        echo "You can create benchmark.conf manually if needed"
    fi
fi

# Create directories
echo -e "\n${BLUE}[4/5]${NC} Creating directories..."
mkdir -p benchmark_temp
mkdir -p benchmark_results
mkdir -p benchmark_results/archive
echo -e "${GREEN}✓${NC} Directories created"

# Test installation
echo -e "\n${BLUE}[5/5]${NC} Testing installation..."
if ./benchmark.sh list &> /dev/null; then
    echo -e "${GREEN}✓${NC} Benchmark system is working"
else
    echo -e "${YELLOW}!${NC} Test failed - you may need to configure BENCHMARK_FILES"
fi

# Summary
echo ""
echo -e "${GREEN}═══════════════════════════════════════${NC}"
echo -e "${GREEN}  Installation Complete!${NC}"
echo -e "${GREEN}═══════════════════════════════════════${NC}"
echo ""
echo "Quick Start:"
echo "  ./benchmark.sh list        # List available benchmarks"
echo "  ./benchmark.sh run -v      # Run all benchmarks (verbose)"
echo "  ./benchmark.sh help        # Show all commands"
echo ""
echo "Configuration:"
echo "  Edit benchmark.conf to customize settings"
echo ""
echo "Documentation:"
echo "  See README.md for full documentation"
echo ""

if [[ $DEPS_OK -eq 0 ]]; then
    echo -e "${YELLOW}Note: Install Lean 4 and Lake before running benchmarks${NC}"
    echo ""
fi