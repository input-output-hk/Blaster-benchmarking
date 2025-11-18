import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
from pathlib import Path

def load_benchmark_csv(csv_file):
    """
    Load benchmark results from CSV file.
    Expected columns: Benchmark, Theorem, Statement, 
                     {tactic}_time, {tactic}_status for each tactic
    """
    return pd.read_csv(csv_file)

def extract_tactic_results(df, tactic_name, timeout_ms=300000):
    """
    Extract results for a specific tactic from the dataframe.
    
    Args:
        df: DataFrame with benchmark results
        tactic_name: Name of the tactic (e.g., "blaster", "simp")
        timeout_ms: Timeout in milliseconds
    
    Returns:
        List of solve times in seconds (sorted)
    """
    time_col = f"{tactic_name}_time"
    status_col = f"{tactic_name}_status"
    
    if time_col not in df.columns or status_col not in df.columns:
        print(f"Warning: {tactic_name} columns not found")
        return []
    
    # Extract solved problems with valid times
    solved_times = []
    for _, row in df.iterrows():
        status = row[status_col]
        time = row[time_col]
        
        # Check if solved successfully
        if status == "OK" and pd.notna(time) and time != "fail":
            try:
                time_s = float(time) / 1000.0  # Convert ms to seconds
                solved_times.append(time_s)
            except (ValueError, TypeError):
                continue
    
    return sorted(solved_times)

def plot_cactus(csv_file, tactics=None, output_path='cactus_plot.pdf', 
                timeout_s=300.0, log_scale=True, figsize=(12, 7),
                title="Solver Performance Comparison"):
    """
    Generate a cactus plot from benchmark CSV.
    
    Args:
        csv_file: Path to CSV file with benchmark results
        tactics: List of tactic names to plot (None = all tactics)
        output_path: Where to save the plot
        timeout_s: Maximum time in seconds for display
        log_scale: Use log scale for x-axis
        figsize: Figure size in inches
        title: Plot title
    """
    df = load_benchmark_csv(csv_file)
    
    # If no tactics specified, auto-detect from columns
    if tactics is None:
        tactics = []
        for col in df.columns:
            if col.endswith("_time"):
                tactic = col.replace("_time", "")
                tactics.append(tactic)
    
    plt.figure(figsize=figsize)
    
    # Color scheme (expand as needed)
    colors = {
        'rfl': '#8B4513',
        'simp': '#A23B72',
        'decide': '#6B8E23',
        'decide +native': '#2F4F4F',
        'omega': '#F18F01',
        'grind': '#C73E1D',
        'smt': '#4B0082',
        'auto': '#FF1493',
        'aesop': '#00CED1',
        'hammer': '#FF8C00',
        'blaster (only-optimize: 1)': '#4169E1',
        'blaster': '#2E86AB',
    }
    
    # Line styles to help distinguish tactics
    line_styles = {
        'blaster': '-',
        'blaster (only-optimize: 1)': '--',
        'omega': '-',
        'grind': '-',
        'simp': '-',
        'smt': ':',
        'hammer': '-.',
        'auto': '--',
        'aesop': ':',
    }
    
    # Plot each tactic
    results_summary = {}
    for tactic in tactics:
        times = extract_tactic_results(df, tactic)
        
        if len(times) == 0:
            print(f"No results for {tactic}, skipping...")
            continue
        
        # Create cumulative counts
        counts = list(range(1, len(times) + 1))
        
        # Add final point at timeout to show plateau
        if times[-1] < timeout_s:
            times.append(timeout_s)
            counts.append(counts[-1])
        
        # Plot
        color = colors.get(tactic, None)
        linestyle = line_styles.get(tactic, '-')
        plt.plot(times, counts, label=tactic, 
                linewidth=2.5 if tactic == 'blaster' else 2, 
                color=color, 
                linestyle=linestyle,
                drawstyle='steps-post',
                alpha=0.9)
        
        results_summary[tactic] = {
            'solved': len([t for t in times if t < timeout_s]),
            'median': np.median([t for t in times if t < timeout_s]) if times else float('inf'),
            'mean': np.mean([t for t in times if t < timeout_s]) if times else float('inf')
        }
    
    # Formatting
    if log_scale:
        plt.xscale('log')
        plt.xlabel('Time (seconds, log scale)', fontsize=13, fontweight='bold')
    else:
        plt.xlabel('Time (seconds)', fontsize=13, fontweight='bold')
    
    plt.ylabel('Number of problems solved', fontsize=13, fontweight='bold')
    plt.title(title, fontsize=15, fontweight='bold')
    plt.legend(loc='lower right', fontsize=10, framealpha=0.95)
    plt.grid(True, alpha=0.3, linestyle='--', linewidth=0.5)
    plt.tight_layout()
    
    # Save in multiple formats
    plt.savefig(output_path, dpi=300, bbox_inches='tight')
    png_path = Path(output_path).with_suffix('.png')
    plt.savefig(png_path, dpi=300, bbox_inches='tight')
    
    print(f"\nCactus plot saved to {output_path} and {png_path}")
    
    # Print summary
    print("\n" + "="*60)
    print("RESULTS SUMMARY")
    print("="*60)
    for tactic in sorted(results_summary.keys(), key=lambda t: results_summary[t]['solved'], reverse=True):
        stats = results_summary[tactic]
        print(f"{tactic:30s} | Solved: {stats['solved']:3d} | Median: {stats['median']:6.2f}s | Mean: {stats['mean']:6.2f}s")
    print("="*60)
    
    plt.close()
    return results_summary

def generate_latex_table(csv_file, tactics=None):
    """
    Generate LaTeX table with summary statistics.
    
    Returns:
        LaTeX table string
    """
    df = load_benchmark_csv(csv_file)
    
    if tactics is None:
        tactics = []
        for col in df.columns:
            if col.endswith("_time"):
                tactic = col.replace("_time", "")
                tactics.append(tactic)
    
    lines = []
    lines.append(r"\begin{tabular}{lrrr}")
    lines.append(r"\toprule")
    lines.append(r"Tactic & Solved & Median (s) & Mean (s) \\")
    lines.append(r"\midrule")
    
    results = []
    for tactic in tactics:
        times = extract_tactic_results(df, tactic)
        if len(times) > 0:
            results.append((
                tactic,
                len(times),
                np.median(times),
                np.mean(times)
            ))
    
    # Sort by number solved (descending)
    results.sort(key=lambda x: x[1], reverse=True)
    
    for tactic, solved, median_time, mean_time in results:
        # Escape underscores for LaTeX
        tactic_latex = tactic.replace("_", r"\_")
        lines.append(f"{tactic_latex} & {solved} & {median_time:.3f} & {mean_time:.3f} \\\\")
    
    lines.append(r"\bottomrule")
    lines.append(r"\end{tabular}")
    
    return "\n".join(lines)

def plot_per_benchmark(csv_file, tactics=None, output_dir='plots'):
    """
    Generate separate cactus plots for each benchmark suite.
    """
    df = load_benchmark_csv(csv_file)
    Path(output_dir).mkdir(exist_ok=True)
    
    benchmarks = df['Benchmark'].unique()
    
    for benchmark in benchmarks:
        benchmark_df = df[df['Benchmark'] == benchmark]
        csv_path = f"{output_dir}/{benchmark}_temp.csv"
        benchmark_df.to_csv(csv_path, index=False)
        
        plot_cactus(
            csv_path,
            tactics=tactics,
            output_path=f"{output_dir}/{benchmark}_cactus.pdf",
            title=f"{benchmark} - Solver Performance"
        )
        
        Path(csv_path).unlink()  # Clean up temp file

# Main execution
if __name__ == "__main__":
    import sys
    
    # Example usage - adjust path to your CSV
    example_name = "ITL4"
    csv_file = f"./benchmark_results/{example_name}_results.csv"  # Change this to your CSV path
    # Define which tactics to compare
    # Key tactics for main plot
    main_tactics = ["blaster", "simp", "omega", "grind", "smt", "hammer"]
    
    # All tactics
    all_tactics = ["rfl", "simp", "decide", "decide +native", "omega", 
                   "grind", "smt", "auto", "aesop", "hammer", 
                   "blaster (only-optimize: 1)", "blaster"]
    
    print("Generating main cactus plot...")
    results = plot_cactus(csv_file, tactics=main_tactics, 
                         output_path='main_cactus.pdf',
                         title='Blaster vs. State-of-the-Art Tactics')
    
    print("\nGenerating full comparison plot...")
    plot_cactus(csv_file, tactics=all_tactics, 
               output_path='full_cactus.pdf',
               figsize=(14, 8),
               title=f'Complete Tactic Comparison on {example_name}')
    
    print("\nGenerating per-benchmark plots...")
    plot_per_benchmark(csv_file, tactics=main_tactics)
    
    print("\nGenerating LaTeX table...")
    table = generate_latex_table(csv_file, tactics=all_tactics)
    print("\n" + table)
    
    # Save table to file
    with open('results_table.tex', 'w') as f:
        f.write(table)
    print("\nLaTeX table saved to results_table.tex")