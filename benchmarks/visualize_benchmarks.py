#!/usr/bin/env python3
"""
Generate visualization comparing tactic performance across benchmarks.
Usage: python3 visualize_benchmarks.py [benchmark_name] [results_dir]
"""

import sys
import os
import csv
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from collections import defaultdict

def read_benchmark_results(results_dir, benchmark_name=None):
    """Read CSV files from the benchmark results directory."""
    results_by_benchmark = defaultdict(list)
    
    for filename in os.listdir(results_dir):
        if filename.endswith('_results.csv'):
            # Extract benchmark name from filename
            bench_name = filename.replace('_results.csv', '')
            
            # Skip if we're filtering for a specific benchmark
            if benchmark_name and bench_name != benchmark_name:
                continue
            
            filepath = os.path.join(results_dir, filename)
            with open(filepath, 'r') as f:
                reader = csv.DictReader(f)
                for row in reader:
                    results_by_benchmark[bench_name].append(row)
    
    return results_by_benchmark

def compute_statistics(results):
    """Compute success/fail/timeout statistics per tactic."""
    if not results:
        return {}, []
    
    # Extract tactic names from CSV headers
    tactics = []
    first_row = results[0]
    for key in first_row.keys():
        if key.endswith('_status'):
            tactic_name = key.replace('_status', '')
            tactics.append(tactic_name)
    
    stats = {tactic: {'YES': 0, 'NO': 0, 'TIMEOUT': 0} for tactic in tactics}
    
    for row in results:
        for tactic in tactics:
            status = row.get(f'{tactic}_status', 'FAIL')
            if status == 'OK':
                stats[tactic]['YES'] += 1
            elif status == 'TIMEOUT':
                stats[tactic]['TIMEOUT'] += 1
            else:
                stats[tactic]['NO'] += 1
    
    return stats, tactics

def create_visualization(benchmark_name, results, stats, tactics, output_file):
    """Create the side-by-side visualization for a single benchmark."""
    
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(16, max(8, len(results) * 0.15)))
    fig.suptitle(f'{benchmark_name} - Tactic Performance Comparison', 
                 fontsize=16, fontweight='bold')
    
    # Colors
    color_yes = '#4CAF50'      # Green
    color_no = '#F44336'       # Red  
    color_timeout = '#FF9800'  # Orange
    
    # LEFT PANEL: Overall statistics per tactic
    total_theorems = len(results)
    tactic_names = []
    yes_percentages = []
    no_percentages = []
    timeout_percentages = []
    
    for tactic in tactics:
        tactic_names.append(tactic)
        total = sum(stats[tactic].values())
        if total > 0:
            yes_percentages.append((stats[tactic]['YES'] / total) * 100)
            timeout_percentages.append((stats[tactic]['TIMEOUT'] / total) * 100)
            no_percentages.append((stats[tactic]['NO'] / total) * 100)
        else:
            yes_percentages.append(0)
            timeout_percentages.append(0)
            no_percentages.append(0)
    
    # Create horizontal stacked bar chart
    y_pos = range(len(tactic_names))
    
    # Plot bars
    p1 = ax1.barh(y_pos, yes_percentages, color=color_yes, label='Success')
    p2 = ax1.barh(y_pos, timeout_percentages, left=yes_percentages, 
                  color=color_timeout, label='Timeout')
    
    left_accum = [y + t for y, t in zip(yes_percentages, timeout_percentages)]
    p3 = ax1.barh(y_pos, no_percentages, left=left_accum, color=color_no, label='Failed')
    
    # Add percentage labels
    for i, (tactic, yes_pct, timeout_pct, no_pct) in enumerate(
            zip(tactic_names, yes_percentages, timeout_percentages, no_percentages)):
        # YES label
        if yes_pct > 5:
            ax1.text(yes_pct/2, i, f'{yes_pct:.1f}%', 
                    ha='center', va='center', fontweight='bold', fontsize=9, color='white')
        
        # TIMEOUT label
        if timeout_pct > 5:
            ax1.text(yes_pct + timeout_pct/2, i, f'{timeout_pct:.1f}%',
                    ha='center', va='center', fontweight='bold', fontsize=9, color='white')
        
        # NO label
        if no_pct > 5:
            total_left = yes_pct + timeout_pct
            ax1.text(total_left + no_pct/2, i, f'{no_pct:.1f}%',
                    ha='center', va='center', fontweight='bold', fontsize=9, color='white')
        
        # Add count label at end
        count_yes = stats[tactic]['YES']
        ax1.text(102, i, f'{count_yes}/{total_theorems}',
                va='center', fontsize=9)
    
    ax1.set_yticks(y_pos)
    ax1.set_yticklabels(tactic_names, fontsize=11, fontweight='bold')
    ax1.set_xlabel('Percentage', fontsize=12)
    ax1.set_xlim(0, 120)
    ax1.legend(loc='lower right', framealpha=0.9)
    ax1.grid(axis='x', alpha=0.3, linestyle='--')
    ax1.set_title('Success Rate by Tactic', fontsize=13, pad=10)
    
    # RIGHT PANEL: Per-theorem heatmap
    theorem_names = [row['Theorem'] for row in results]
    
    # Create color matrix
    matrix_data = []
    for tactic in tactics:
        tactic_results = []
        for row in results:
            status = row.get(f'{tactic}_status', 'FAIL')
            if status == 'OK':
                tactic_results.append(1)  # Green
            elif status == 'TIMEOUT':
                tactic_results.append(2)  # Orange
            else:
                tactic_results.append(0)  # Red
        matrix_data.append(tactic_results)
    
    # Plot heatmap
    colors_map = {0: color_no, 1: color_yes, 2: color_timeout}
    
    # Create the grid
    for tactic_idx, tactic_results in enumerate(matrix_data):
        for theorem_idx, result in enumerate(tactic_results):
            color = colors_map[result]
            ax2.add_patch(mpatches.Rectangle(
                (tactic_idx, theorem_idx), 1, 1,
                facecolor=color, edgecolor='white', linewidth=1
            ))
    
    ax2.set_xlim(0, len(tactics))
    ax2.set_ylim(0, len(theorem_names))
    ax2.set_xticks([i + 0.5 for i in range(len(tactics))])
    ax2.set_xticklabels(tactics, rotation=45, ha='right', fontsize=10, fontweight='bold')
    ax2.set_yticks([i + 0.5 for i in range(len(theorem_names))])
    ax2.set_yticklabels(theorem_names, fontsize=max(4, min(8, 100 // len(theorem_names))))
    ax2.set_xlabel('Tactics', fontsize=12)
    ax2.set_ylabel('Theorems', fontsize=12)
    ax2.set_title('Results per Theorem', fontsize=13, pad=10)
    ax2.invert_yaxis()  # So first theorem is at top
    
    # Add legend for right panel
    legend_elements = [
        mpatches.Patch(color=color_yes, label='Success'),
        mpatches.Patch(color=color_no, label='Failed'),
        mpatches.Patch(color=color_timeout, label='Timeout')
    ]
    ax2.legend(handles=legend_elements, loc='upper right', 
               bbox_to_anchor=(1.02, 1.02), framealpha=0.9)
    
    plt.tight_layout()
    plt.savefig(output_file, dpi=300, bbox_inches='tight')
    print(f"✓ Visualization saved: {output_file}")
    
    return stats

def print_summary(benchmark_name, stats, tactics, total_theorems):
    """Print summary statistics for a benchmark."""
    print(f"\n{'='*60}")
    print(f"  {benchmark_name} Summary")
    print(f"{'='*60}")
    print(f"{'Tactic':<15} {'Success':<12} {'Timeout':<12} {'Failed':<12} {'Rate':<10}")
    print(f"{'-'*60}")
    
    for tactic in tactics:
        yes = stats[tactic]['YES']
        timeout = stats[tactic]['TIMEOUT']
        no = stats[tactic]['NO']
        total = yes + timeout + no
        rate = (yes / total * 100) if total > 0 else 0
        
        print(f"{tactic:<15} {yes:<3}/{total:<7} {timeout:<3}/{total:<7} "
              f"{no:<3}/{total:<7} {rate:>5.1f}%")

def main():
    # Parse arguments
    benchmark_name = None
    results_dir = 'benchmark_results'
    
    if len(sys.argv) > 1:
        if sys.argv[1] in ['-h', '--help', 'help']:
            print(__doc__)
            print("\nExamples:")
            print("  python3 visualize_benchmarks.py              # Visualize all benchmarks")
            print("  python3 visualize_benchmarks.py NNG4         # Visualize only NNG4")
            print("  python3 visualize_benchmarks.py NNG4 results # Use custom results dir")
            sys.exit(0)
        benchmark_name = sys.argv[1]
    
    if len(sys.argv) > 2:
        results_dir = sys.argv[2]
    
    if not os.path.exists(results_dir):
        print(f"Error: Directory '{results_dir}' not found")
        sys.exit(1)
    
    print(f"Reading benchmark results from: {results_dir}")
    if benchmark_name:
        print(f"Filtering for benchmark: {benchmark_name}")
    
    results_by_benchmark = read_benchmark_results(results_dir, benchmark_name)
    
    if not results_by_benchmark:
        if benchmark_name:
            print(f"Error: No results found for benchmark '{benchmark_name}'")
        else:
            print("Error: No benchmark results found")
        sys.exit(1)
    
    print(f"Found {len(results_by_benchmark)} benchmark(s)")
    
    # Generate visualization for each benchmark
    for bench_name, results in sorted(results_by_benchmark.items()):
        print(f"\nProcessing {bench_name}...")
        print(f"  Theorems: {len(results)}")
        
        stats, tactics = compute_statistics(results)
        
        output_file = os.path.join(results_dir, f'{bench_name}_visualization.png')
        create_visualization(bench_name, results, stats, tactics, output_file)
        print_summary(bench_name, stats, tactics, len(results))
    
    print(f"\n{'='*60}")
    print("All visualizations complete!")
    print(f"{'='*60}")

if __name__ == '__main__':
    main()