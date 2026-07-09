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
TACTIC_ORDER = ["blaster", "blaster (only-optimize: 1)", "smt +model", "auto", "aesop",
                "hammer", "omega", "grind", "simp"]

# Short descriptions for known benchmark suites (only ones we can state accurately).
SUITE_DESC = {
    "NNG4": "Lean Natural Number Game",
    "STG4": "Lean Set Theory Game",
    "ITL4": "Introduction to Logic",
    "MiniF2F": "Competition math (integer/number-theory subset)",
    "Verina": "Verified-programming specs (Verina, basic)",
    "UPLCWidth": "UPLC symbolic correctness (growing expressions)",
    "UPLCDepth": "UPLC concrete evaluation (growing computation)",
}
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
    """Return (benches, tactic set, errors).
    benches: {bench: {tactic: {theorem: (time,status,statement)}}}
    errors:  {tactic: {(bench, theorem): message}} from each tool's env_errors.tsv
    """
    benches: dict = {}
    tactics_seen: list = []
    errors: dict = {}
    for tool_dir in sorted(p for p in results.iterdir() if p.is_dir() and p.name != "merged"):
        dir_tactics: list = []
        for csv_path in sorted(tool_dir.glob("*_results.csv")):
            bench = csv_path.stem.replace("_results", "")
            with open(csv_path, newline="", encoding="utf-8") as f:
                rows = list(csv.DictReader(f))
            if not rows:
                continue
            # a project may run several tactics -> one CSV with several "<tactic>_status"
            # columns; surface every one (not just the first).
            csv_tactics = [k[: -len("_status")] for k in rows[0] if k.endswith("_status")]
            for tactic in csv_tactics:
                if tactic not in dir_tactics:
                    dir_tactics.append(tactic)
                if tactic not in tactics_seen:
                    tactics_seen.append(tactic)
                t = benches.setdefault(bench, {}).setdefault(tactic, {})
                for r in rows:
                    t[r.get("Theorem", "")] = (
                        r.get(f"{tactic}_time", ""),
                        r.get(f"{tactic}_status", "FAIL"),
                        r.get("Statement", ""),
                    )
        # ENV-error sidecar for this tool applies to every tactic in the project
        # (a statement that fails to elaborate does so regardless of tactic).
        errfile = tool_dir / "env_errors.tsv"
        if dir_tactics and errfile.exists():
            emaps = [errors.setdefault(t, {}) for t in dir_tactics]
            for line in errfile.read_text(encoding="utf-8").splitlines():
                parts = line.split("\t", 2)
                if len(parts) == 3:
                    for emap in emaps:
                        emap[(parts[0], parts[1])] = parts[2]
    return benches, tactics_seen, errors


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
    commit = info.get("resolved_commit", "?")
    build = info.get("build_status", "OK")
    cached = " · cached" if build == "CACHED" else ""
    tag = "" if build in ("OK", "CACHED") else f' <span style="color:#f87171">[{html.escape(build)}]</span>'
    return (f'<div class="tac">{html.escape(tac)}</div>'
            f'<div class="ver">{html.escape(tc)} · {html.escape(commit)}{cached}</div>{tag}')


def render_html(results: Path, benches: dict, tactics: list, man: dict, errors: dict) -> str:
    """Return a body-content fragment (style + markup), no document wrapper."""
    tcs = sorted({man[t].get("toolchain", "").replace("leanprover/lean4:", "")
                  for t in tactics if t in man} - {""})
    span = f"{tcs[0]} – {tcs[-1]}" if len(tcs) > 1 else (tcs[0] if tcs else "")
    parts = []
    parts.append(STYLE)
    parts.append('<div class="wrap">')
    parts.append('<header class="masthead">')
    parts.append('<h1>Lean 4 tactic benchmark</h1>')
    parts.append(f'<p class="lede">{len(tactics)} tactics compared across {len(benches)} theorem suites. '
                 'Each tactic runs in its own isolated Lake project on its latest branch and that '
                 'branch\'s Lean toolchain; every column shows the toolchain and commit it ran on.</p>')
    if span:
        parts.append(f'<div class="spanline">toolchains {html.escape(span)} &middot; '
                     f'{len(tactics)} tactics &middot; {len(benches)} suites</div>')
    parts.append('</header>')

    # ---- at-a-glance overview: suites + overall standings ----
    suites = sorted(benches)
    totals = {t: 0 for t in tactics}
    grand_n = 0
    suite_info = {}
    for suite in suites:
        thms = set()
        for t in tactics:
            thms |= set(benches[suite].get(t, {}))
        n = len(thms)
        grand_n += n
        summ = summarize(tactics, benches[suite], sorted(thms))
        oks = {t: summ[t]["OK"] for t in tactics}
        for t in tactics:
            totals[t] += oks[t]
        best = max(tactics, key=lambda x: oks[x]) if tactics else None
        suite_info[suite] = (n, best, oks.get(best, 0) if best else 0)

    parts.append('<h2>Overview</h2>')
    parts.append('<div class="suite-cards">')
    for suite in suites:
        n, best, best_ok = suite_info[suite]
        desc = SUITE_DESC.get(suite, "")
        pct = f"{best_ok / n * 100:.0f}%" if n else "0%"
        parts.append(
            f'<div class="scard"><div class="scard-name">{html.escape(suite)}</div>'
            + (f'<div class="scard-desc">{html.escape(desc)}</div>' if desc else '<div class="scard-desc">&nbsp;</div>')
            + f'<div class="scard-n mono">{n} theorems</div>'
            f'<div class="scard-best">best <b>{html.escape(best or "-")}</b> '
            f'<span class="mono">{best_ok}/{n} ({pct})</span></div></div>')
    parts.append('</div>')

    parts.append('<table class="standings"><tr><th>#</th><th>tactic</th>'
                 '<th>solved</th><th style="width:46%"></th></tr>')
    for i, tac in enumerate(sorted(tactics, key=lambda x: totals[x], reverse=True), 1):
        sol = totals[tac]
        pct = sol / grand_n * 100 if grand_n else 0
        parts.append(
            f'<tr><td class="mono dim">{i}</td><td class="mono">{html.escape(tac)}</td>'
            f'<td class="mono"><b>{sol}</b>/{grand_n} <span class="dim">({pct:.0f}%)</span></td>'
            f'<td><div class="bar"><span style="background:#4ade80;width:{pct:.1f}%"></span></div></td></tr>')
    parts.append('</table>')

    # version manifest
    parts.append('<h2>Versions run</h2>')
    parts.append('<table class="manifest"><tr><th>tactic</th><th>branch</th><th>toolchain</th>'
                 '<th>commit</th><th>build</th></tr>')
    for tac in tactics:
        info = man.get(tac, {})
        build = info.get("build_status", "?")
        bcol = "#4ade80" if build in ("OK", "CACHED") else "#f87171"
        parts.append(
            f'<tr><td class="mono">{html.escape(tac)}</td>'
            f'<td class="mono">{html.escape(info.get("branch","?"))}</td>'
            f'<td class="mono">{html.escape(info.get("toolchain","?"))}</td>'
            f'<td class="mono">{html.escape(info.get("resolved_commit","?"))}</td>'
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
                if st == "ENV":
                    info = errors.get(tac, {}).get((bench, thm)) or "statement did not elaborate on this toolchain"
                elif st == "OK":
                    info = f"solved in {time_s} ms" if str(time_s).isdigit() else "solved"
                elif st == "TIMEOUT":
                    info = "timed out"
                else:
                    info = "tactic did not close the goal"
                parts.append(f'<td class="cell mono" style="color:{color}" '
                             f'data-thm="{html.escape(thm)}" data-tac="{html.escape(tac)}" '
                             f'data-st="{html.escape(st)}" data-info="{html.escape(info)}" '
                             f'title="{html.escape(info)}">{glyph} {html.escape(label)}</td>')
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
    parts.append('<p class="hint">Tip: click any cell for its status and (for ENV) the exact Lean error.</p>')

    parts.append('</div>')
    parts.append('<div id="cellpop"></div>')
    parts.append(POPOVER_JS)
    return "\n".join(parts)


# Utilitarian data report: cool ink ground, one restrained sky accent for structure,
# and semantic status colours (green/amber/blue/red) carrying the data — kept separate
# from the accent. Tabular figures so columns of numbers align.
STYLE = """<style>
:root{--bg:#0b0e14;--panel:#111621;--bd:rgba(148,163,199,.14);--tx:#e5e9f5;
 --dim:#8b93ab;--acc:#7dd3fc;--ok:#4ade80;--to:#fbbf24;--env:#60a5fa;--fail:#f87171}
*{box-sizing:border-box}
.wrap{max-width:1180px;margin:0 auto;padding:8px 24px 96px;
 font:15px/1.65 ui-sans-serif,-apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif;color:var(--tx)}
.masthead{padding:40px 0 28px;border-bottom:1px solid var(--bd);margin-bottom:8px}
.eyebrow{font-family:ui-monospace,SFMono-Regular,Menlo,monospace;font-size:.72rem;
 letter-spacing:.18em;text-transform:uppercase;color:var(--acc);margin-bottom:14px}
h1{font-size:clamp(1.9rem,4vw,2.7rem);line-height:1.08;margin:0 0 14px;font-weight:700;
 letter-spacing:-.015em;text-wrap:balance;max-width:16ch}
h1 .hl{color:var(--acc)}
h2{margin:48px 0 6px;font-size:1.25rem;font-weight:650;letter-spacing:-.01em}
.lede{color:var(--dim);max-width:64ch;font-size:1.02rem}
.spanline{margin-top:16px;font-family:ui-monospace,SFMono-Regular,Menlo,monospace;
 font-size:.78rem;color:var(--dim)}.spanline b{color:var(--tx)}
.dim{color:var(--dim);font-weight:400;font-size:.9rem}
.mono{font-family:ui-monospace,SFMono-Regular,Menlo,monospace;font-variant-numeric:tabular-nums}
table{border-collapse:collapse;width:100%;margin:10px 0;font-size:13px}
th,td{padding:8px 13px;border-bottom:1px solid var(--bd);text-align:left;vertical-align:top}
th{color:var(--dim);font-size:.68rem;text-transform:uppercase;letter-spacing:.07em;font-weight:600}
td{font-variant-numeric:tabular-nums}
.manifest td,.summary td{white-space:nowrap}
.manifest,.summary,.standings{background:var(--panel);border:1px solid var(--bd);border-radius:10px;overflow:hidden}
.suite-cards{display:grid;grid-template-columns:repeat(auto-fit,minmax(190px,1fr));gap:12px;margin:12px 0 26px}
.scard{background:var(--panel);border:1px solid var(--bd);border-radius:10px;padding:16px 18px}
.scard-name{font-weight:700;font-size:1.1rem;letter-spacing:-.01em}
.scard-desc{color:var(--dim);font-size:.78rem;margin:1px 0 12px}
.scard-n{font-size:.72rem;color:var(--dim);text-transform:uppercase;letter-spacing:.05em}
.scard-best{margin-top:8px;font-size:.9rem}.scard-best b{color:var(--acc)}
.standings td{white-space:nowrap}.standings td:last-child{width:46%}
.bar{display:flex;height:8px;border-radius:5px;overflow:hidden;background:rgba(148,163,199,.1)}
.bar span{display:block}
.scroll{overflow-x:auto;border:1px solid var(--bd);border-radius:10px}
.matrix{margin:0;font-size:12px}
.matrix th .tac{font-weight:700;color:var(--tx);text-transform:none;font-size:.8rem}
.matrix th .ver{color:var(--dim);font-size:.66rem;font-weight:400;text-transform:none;
 letter-spacing:0;font-family:ui-monospace,SFMono-Regular,Menlo,monospace}
.matrix .thm{position:sticky;left:0;background:var(--bg);max-width:280px;overflow:hidden;
 text-overflow:ellipsis;box-shadow:1px 0 0 var(--bd)}
.cell{white-space:nowrap;cursor:pointer}
.caveats{color:var(--dim);max-width:78ch}.caveats li{margin:9px 0}.caveats b{color:var(--tx)}
.hint{color:var(--dim);font-size:.8rem;margin-top:18px}
code{background:rgba(148,163,199,.12);padding:1px 5px;border-radius:4px;font-size:.85em;
 font-family:ui-monospace,SFMono-Regular,Menlo,monospace}
tr:hover td{background:rgba(148,163,199,.05)}
#cellpop{position:fixed;z-index:60;max-width:380px;display:none;background:var(--panel);
 border:1px solid var(--bd);border-radius:8px;padding:12px 14px;box-shadow:0 10px 34px rgba(0,0,0,.55)}
#cellpop .pl{color:var(--dim);font-size:.68rem;text-transform:uppercase;letter-spacing:.08em}
#cellpop .pt{font-weight:700;font-size:.92rem;margin-top:2px;word-break:break-word}
#cellpop .pst{margin-top:7px;font-weight:600;font-family:ui-monospace,SFMono-Regular,Menlo,monospace}
#cellpop .pm{margin-top:6px;font-family:ui-monospace,SFMono-Regular,Menlo,monospace;font-size:.82rem;
 color:var(--tx);white-space:pre-wrap;word-break:break-word;line-height:1.5}
</style>"""

POPOVER_JS = """<script>
(function(){
  var pop=document.getElementById('cellpop');
  var COL={OK:'#4ade80',TIMEOUT:'#fbbf24',ENV:'#60a5fa',FAIL:'#f87171'};
  pop.innerHTML='<div class="pl"></div><div class="pt"></div><div class="pst"></div><div class="pm"></div>';
  document.addEventListener('click',function(e){
    var td=e.target.closest?e.target.closest('td.cell'):null;
    if(!td){pop.style.display='none';return;}
    pop.querySelector('.pl').textContent=td.dataset.tac||'';
    pop.querySelector('.pt').textContent=td.dataset.thm||'';
    var ps=pop.querySelector('.pst');ps.textContent=td.dataset.st||'';
    ps.style.color=COL[td.dataset.st]||'#f87171';
    pop.querySelector('.pm').textContent=td.dataset.info||'';
    pop.style.display='block';
    var r=td.getBoundingClientRect(),pw=pop.offsetWidth,ph=pop.offsetHeight;
    var x=Math.min(r.left,window.innerWidth-pw-12),y=r.bottom+8;
    if(y+ph>window.innerHeight)y=r.top-ph-8;
    pop.style.left=Math.max(8,x)+'px';pop.style.top=Math.max(8,y)+'px';
    e.stopPropagation();
  });
})();
</script>"""


def emit_markdown(benches: dict, tactics: list, man: dict, report_url: str = "") -> str:
    """Compact markdown summary table for injection into a README (between markers)."""
    suites = sorted(benches)
    # totals[tac] = (solved, total) accumulated across suites
    totals = {t: [0, 0] for t in tactics}
    per = {t: {} for t in tactics}  # per[tac][suite] = (ok, n)
    for suite in suites:
        thms = set()
        for t in tactics:
            thms |= set(benches[suite].get(t, {}))
        n = len(thms)
        summ = summarize(tactics, benches[suite], sorted(thms))
        for t in tactics:
            ok = summ[t]["OK"]
            per[t][suite] = (ok, n)
            totals[t][0] += ok
            totals[t][1] += n

    head = "| Tactic | Version | " + " | ".join(suites) + " | **Solved** |"
    sep = "|:--|:--|" + "--:|" * len(suites) + "--:|"
    rows = [head, sep]
    # order tactics by total solved, descending
    for t in sorted(tactics, key=lambda x: totals[x][0], reverse=True):
        info = man.get(t, {})
        tc = info.get("toolchain", "?").replace("leanprover/lean4:", "")
        commit = info.get("resolved_commit", "?")
        build = info.get("build_status", "OK")
        if build in ("OK", "CACHED"):
            ver = f"`{tc}` @ `{commit}`" + (" _(cached)_" if build == "CACHED" else "")
        else:
            ver = f"`{tc}` **{build}**"
        cells = " | ".join(f"{per[t][s][0]}/{per[t][s][1]}" for s in suites)
        sol, tot = totals[t]
        rows.append(f"| `{t}` | {ver} | {cells} | **{sol}/{tot}** |")

    note = ("\n_Each tactic runs in an isolated Lake project on its **latest default branch** and that "
            "branch's own Lean toolchain (tracked live). Cells show theorems **solved / total**; "
            "cross-version numbers can shift with mathlib changes, not only tactic quality._")
    link = f"\n\n**[Full interactive report →]({report_url})**" if report_url else ""
    return "\n".join(rows) + "\n" + note + link + "\n"


def wrap_standalone(fragment: str) -> str:
    return (f'<!doctype html><html lang="en"><head><meta charset="utf-8">'
            f'<meta name="viewport" content="width=device-width,initial-scale=1">'
            f'<title>Fair latest-branch tactic benchmark</title>'
            f'<style>body{{margin:0;background:#0b0e14}}</style></head><body>{fragment}</body></html>')


def main():
    results = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(__file__).parent / "results"
    man = load_manifest(results)
    benches, seen, errors = discover(results)
    if not benches:
        print(f"No per-tool result CSVs found under {results}", file=sys.stderr)
        sys.exit(1)
    tactics = ordered_tactics(seen)
    fragment = render_html(results, benches, tactics, man, errors)
    out_html = results / "report.html"
    out_html.write_text(wrap_standalone(fragment), encoding="utf-8")
    frag_html = results / "report.artifact.html"
    frag_html.write_text(fragment, encoding="utf-8")
    # Markdown summary for README injection (report URL comes from env in CI).
    import os
    md = emit_markdown(benches, tactics, man, os.environ.get("BENCH_REPORT_URL", ""))
    md_out = results / "summary.md"
    md_out.write_text(md, encoding="utf-8")
    print(f"Merged CSVs: {results/'merged'}")
    print(f"Report:      {out_html}")
    print(f"Artifact:    {frag_html}")
    print(f"Summary md:  {md_out}")
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
