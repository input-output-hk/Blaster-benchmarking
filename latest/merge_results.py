#!/usr/bin/env python3
"""
Merge per-tool "latest-branch" benchmark CSVs into a unified comparison and
render a self-contained HTML report with full version transparency.

Each isolated project produced single-tactic CSVs under
    latest/results/<tool>/<BENCH>_results.csv   (columns: Benchmark,Theorem,Statement,<tactic>_time,<tactic>_status)
and the orchestrator recorded, per tactic, the Lean toolchain + resolved commit
it actually ran on in
    latest/results/manifest.tsv

This script joins them per benchmark on the theorem name, writes merged CSVs
(so the standard dashboard can still consume them), and emits report.html where
EVERY tactic column is labelled with its toolchain + commit — the whole point of
a "fair latest" run is being explicit about what each tactic was.

Usage: python3 merge_results.py [results_dir]   (default: latest/results)
"""

import csv
import html
import sys
from pathlib import Path

# Home tactic first, then the rest in a stable order.
TACTIC_ORDER = ["blaster", "smt +model", "auto", "aesop", "hammer"]
STATUS_RANK = {"OK": 0, "TIMEOUT": 1, "ENV": 2, "FAIL": 3}
STATUS_STYLE = {
    "OK":      ("#4ade80", "✓"),
    "TIMEOUT": ("#fbbf24", "⏱"),
    "ENV":     ("#60a5fa", "⊘"),
    "FAIL":    ("#f87171", "✗"),
}


def load_manifest(results: Path) -> dict:
    """tactic -> {toolchain, commit, branch, build}"""
    m = {}
    mf = results / "manifest.tsv"
    if not mf.exists():
        return m
    with open(mf, newline="", encoding="utf-8") as f:
        for row in csv.DictReader(f, delimiter="\t"):
            m[row["tactic"]] = row
    return m


def discover(results: Path):
    """Return {bench_name: {tactic: {theorem: (time,status,statement)}}} and tactic set."""
    benches: dict = {}
    tactics_seen: list = []
    for tool_dir in sorted(p for p in results.iterdir() if p.is_dir() and p.name != "merged"):
        for csv_path in sorted(tool_dir.glob("*_results.csv")):
            bench = csv_path.stem.replace("_results", "")
            with open(csv_path, newline="", encoding="utf-8") as f:
                rows = list(csv.DictReader(f))
            if not rows:
                continue
            # single-tactic CSV: find the "<tactic>_status" column
            tactic = next((k[:-len("_status")] for k in rows[0] if k.endswith("_status")), None)
            if tactic is None:
                continue
            if tactic not in tactics_seen:
                tactics_seen.append(tactic)
            b = benches.setdefault(bench, {})
            t = b.setdefault(tactic, {})
            for r in rows:
                thm = r.get("Theorem", "")
                t[thm] = (
                    r.get(f"{tactic}_time", ""),
                    r.get(f"{tactic}_status", "FAIL"),
                    r.get("Statement", ""),
                )
    return benches, tactics_seen


def ordered_tactics(seen: list) -> list:
    known = [t for t in TACTIC_ORDER if t in seen]
    extra = [t for t in seen if t not in TACTIC_ORDER]
    return known + extra


def write_merged_csv(results: Path, bench: str, tactics: list, per_tactic: dict):
    """Reconstruct the multi-tactic CSV format the standard dashboard expects."""
    out = results / "merged"
    out.mkdir(exist_ok=True)
    # union of theorems, preserving first-seen order from the first tactic that has them
    theorems: list = []
    stmt_of: dict = {}
    for tac in tactics:
        for thm, (_, _, stmt) in per_tactic.get(tac, {}).items():
            if thm not in stmt_of:
                stmt_of[thm] = stmt
                theorems.append(thm)
    header = ["Benchmark", "Theorem", "Statement"]
    for tac in tactics:
        header += [f"{tac}_time", f"{tac}_status"]
    with open(out / f"{bench}_results.csv", "w", newline="", encoding="utf-8") as f:
        w = csv.writer(f)
        w.writerow(header)
        for thm in theorems:
            row = [bench, thm, stmt_of.get(thm, "")]
            for tac in tactics:
                cell = per_tactic.get(tac, {}).get(thm)
                if cell:
                    row += [cell[0], cell[1]]
                else:
                    row += ["", "FAIL"]
            w.writerow(row)
    return theorems, stmt_of


def summarize(tactics: list, per_tactic: dict, theorems: list) -> dict:
    s = {}
    for tac in tactics:
        d = per_tactic.get(tac, {})
        counts = {"OK": 0, "TIMEOUT": 0, "ENV": 0, "FAIL": 0}
        for thm in theorems:
            st = d.get(thm, (None, "FAIL", ""))[1]
            counts[st] = counts.get(st, 0) + 1
        s[tac] = counts
    return s


def col_label(tac: str, man: dict) -> str:
    info = man.get(tac)
    if not info:
        return html.escape(tac)
    tc = info.get("toolchain", "?").replace("leanprover/lean4:", "")
    commit = info.get("commit", "?")
    build = info.get("build", "OK")
    tag = "" if build == "OK" else f' <span style="color:#f87171">[{html.escape(build)}]</span>'
    return (f'<div class="tac">{html.escape(tac)}</div>'
            f'<div class="ver">{html.escape(tc)} · {html.escape(commit)}</div>{tag}')


def render_html(results: Path, benches: dict, tactics: list, man: dict) -> str:
    parts = []
    parts.append(HEAD)
    parts.append('<div class="wrap">')
    parts.append('<h1>Fair latest-branch tactic benchmark</h1>')
    parts.append('<p class="lede">Each tactic runs in its own isolated Lake project pinned to its '
                 '<b>latest default branch</b> and that branch\'s Lean toolchain — tracked live, not '
                 'pinned to a common version. Columns are labelled with the toolchain + resolved commit '
                 'each tactic actually ran on.</p>')

    # version manifest
    parts.append('<h2>Versions run</h2>')
    parts.append('<table class="manifest"><tr><th>tactic</th><th>branch</th><th>toolchain</th>'
                 '<th>commit</th><th>build</th></tr>')
    for tac in tactics:
        info = man.get(tac, {})
        build = info.get("build", "?")
        bcol = "#4ade80" if build == "OK" else "#f87171"
        parts.append(
            f'<tr><td class="mono">{html.escape(tac)}</td>'
            f'<td class="mono">{html.escape(info.get("branch","?"))}</td>'
            f'<td class="mono">{html.escape(info.get("toolchain","?"))}</td>'
            f'<td class="mono">{html.escape(info.get("commit","?"))}</td>'
            f'<td class="mono" style="color:{bcol}">{html.escape(build)}</td></tr>')
    parts.append('</table>')

    # per-benchmark summary + matrix
    for bench in sorted(benches):
        per_tactic = benches[bench]
        theorems, stmt_of = write_merged_csv(results, bench, tactics, per_tactic)
        summ = summarize(tactics, per_tactic, theorems)
        n = len(theorems)
        parts.append(f'<h2>{html.escape(bench)} <span class="dim">· {n} theorems</span></h2>')

        # summary bars
        parts.append('<table class="summary"><tr><th>tactic</th><th>solved</th>'
                     '<th style="width:38%">breakdown</th><th>timeout</th><th>env</th><th>fail</th></tr>')
        for tac in tactics:
            c = summ[tac]
            ok, to, en, fa = c["OK"], c["TIMEOUT"], c["ENV"], c["FAIL"]
            tot = max(n, 1)
            seg = (f'<span style="background:#4ade80;width:{ok/tot*100:.1f}%"></span>'
                   f'<span style="background:#fbbf24;width:{to/tot*100:.1f}%"></span>'
                   f'<span style="background:#60a5fa;width:{en/tot*100:.1f}%"></span>'
                   f'<span style="background:#f87171;width:{fa/tot*100:.1f}%"></span>')
            parts.append(
                f'<tr><td class="mono">{html.escape(tac)}</td>'
                f'<td class="mono"><b style="color:#4ade80">{ok}</b>/{n} ({ok/tot*100:.0f}%)</td>'
                f'<td><div class="bar">{seg}</div></td>'
                f'<td class="mono">{to}</td><td class="mono" style="color:#60a5fa">{en}</td>'
                f'<td class="mono">{fa}</td></tr>')
        parts.append('</table>')

        # matrix
        parts.append('<div class="scroll"><table class="matrix"><tr><th class="thm">theorem</th>')
        for tac in tactics:
            parts.append(f'<th>{col_label(tac, man)}</th>')
        parts.append('</tr>')
        for thm in theorems:
            parts.append(f'<tr><td class="thm mono">{html.escape(thm)}</td>')
            for tac in tactics:
                cell = per_tactic.get(tac, {}).get(thm, ("", "FAIL", ""))
                time_s, st = cell[0], cell[1]
                color, glyph = STATUS_STYLE.get(st, ("#f87171", "✗"))
                label = f"{time_s} ms" if (st == "OK" and str(time_s).isdigit()) else st
                parts.append(f'<td class="cell mono" style="color:{color}" title="{html.escape(st)}">'
                             f'{glyph} {html.escape(label)}</td>')
            parts.append('</tr>')
        parts.append('</table></div>')

    # caveats
    parts.append('<h2>Reading these results fairly</h2><ul class="caveats">')
    parts.append('<li><b>Different toolchains &amp; mathlib versions.</b> A tactic\'s pass/fail can shift '
                 'between Lean versions because available lemmas and simp sets changed — not necessarily '
                 'because the tactic itself improved or regressed. Compare with that in mind.</li>')
    parts.append('<li><b>ENV (⊘) is not a tactic failure.</b> It means the theorem statement did not even '
                 'elaborate on that toolchain (mathlib API drift, or a benchmark-extraction artifact), so '
                 'no tactic is blamed for it.</li>')
    parts.append('<li><b>lean-smt "SMT-LIB does not support lambdas".</b> That message is a hard-coded '
                 'error in lean-smt\'s own translator (<code>Smt/Translate.lean</code>), thrown on any '
                 'lambda term. It is a translator gap, not a solver limitation — cvc5 itself supports '
                 'higher-order reasoning and lambdas. It accounts for several STG4 failures.</li>')
    parts.append('</ul>')

    parts.append('</div></body></html>')
    return "\n".join(parts)


HEAD = """<!doctype html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Fair latest-branch tactic benchmark</title>
<style>
:root{--bg:#0d0f14;--card:#151922;--bd:rgba(255,255,255,.08);--tx:#dde1ef;--dim:#8891a8}
*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--tx);
 font:15px/1.6 -apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif}
.wrap{max-width:1200px;margin:0 auto;padding:40px 24px 80px}
h1{font-size:2rem;margin:0 0 8px}h2{margin:44px 0 12px;font-size:1.3rem}
.lede{color:var(--dim);max-width:760px}.dim{color:var(--dim);font-weight:400;font-size:.9rem}
.mono{font-family:ui-monospace,SFMono-Regular,Menlo,monospace}
table{border-collapse:collapse;width:100%;margin:8px 0;font-size:13px}
th,td{padding:7px 12px;border-bottom:1px solid var(--bd);text-align:left;vertical-align:top}
th{color:var(--dim);font-size:.72rem;text-transform:uppercase;letter-spacing:.06em;font-weight:600}
.manifest td,.summary td{white-space:nowrap}
.bar{display:flex;height:8px;border-radius:4px;overflow:hidden;background:rgba(255,255,255,.05)}
.bar span{display:block}
.scroll{overflow-x:auto;border:1px solid var(--bd);border-radius:8px}
.matrix{margin:0;font-size:12px}.matrix th .tac{font-weight:700;color:var(--tx);text-transform:none;font-size:.8rem}
.matrix th .ver{color:var(--dim);font-size:.66rem;font-weight:400;text-transform:none;letter-spacing:0}
.matrix .thm{position:sticky;left:0;background:var(--bg);max-width:280px;overflow:hidden;text-overflow:ellipsis}
.cell{white-space:nowrap}
.caveats{color:var(--dim);max-width:820px}.caveats li{margin:8px 0}
code{background:rgba(255,255,255,.07);padding:1px 5px;border-radius:3px;font-size:.85em}
tr:hover td{background:rgba(255,255,255,.02)}
</style></head><body>"""


def main():
    results = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(__file__).parent / "results"
    man = load_manifest(results)
    benches, seen = discover(results)
    if not benches:
        print(f"No per-tool result CSVs found under {results}", file=sys.stderr)
        sys.exit(1)
    tactics = ordered_tactics(seen)
    out_html = results / "report.html"
    out_html.write_text(render_html(results, benches, tactics, man), encoding="utf-8")
    print(f"Merged CSVs: {results/'merged'}")
    print(f"Report:      {out_html}")
    # brief console summary
    for bench in sorted(benches):
        thms = set()
        for tac in tactics:
            thms |= set(benches[bench].get(tac, {}))
        summ = summarize(tactics, benches[bench], sorted(thms))
        print(f"\n{bench} ({len(thms)} theorems):")
        for tac in tactics:
            c = summ[tac]
            print(f"  {tac:14s} OK={c['OK']:3d} TIMEOUT={c['TIMEOUT']:3d} "
                  f"ENV={c['ENV']:3d} FAIL={c['FAIL']:3d}")


if __name__ == "__main__":
    main()
