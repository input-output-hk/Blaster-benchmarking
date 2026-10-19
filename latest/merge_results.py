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
import gzip
import html
import json
import os
import sys
from datetime import datetime, timezone
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
    "BlasterHome": "Lean-blaster regression and SMT goals",
    "SmtHome": "lean-smt logic, arithmetic, and bitvector tests",
    "AutoHome": "lean-auto regression and translation goals",
    "AesopHome": "Aesop test goals",
    "HammerHome": "LeanHammer smoke test and Duper dependency tests",
}
SUITE_LABELS = {
    "BlasterHome": "Blaster",
    "SmtHome": "lean-smt",
    "AutoHome": "lean-auto",
    "AesopHome": "Aesop",
    "HammerHome": "LeanHammer + Duper",
}
SUITE_SOURCES = {
    "BlasterHome": "https://github.com/input-output-hk/Lean-blaster/tree/main/Tests",
    "SmtHome": "https://github.com/ufmg-smite/lean-smt/tree/main/Test",
    "AutoHome": "https://github.com/leanprover-community/lean-auto/tree/main/Test",
    "AesopHome": "https://github.com/leanprover-community/aesop/tree/master/AesopTest",
    "HammerHome": "https://github.com/leanprover-community/duper/tree/main/Duper/Tests",
}
STATUS_RANK = {"OK": 0, "TIMEOUT": 1, "ENV": 2, "FAIL": 3}
STATUS_STYLE = {
    "OK":      ("#147761", "✓"),
    "TIMEOUT": ("#9a6b12", "⏱"),
    "ENV":     ("#35648c", "⊘"),
    "FAIL":    ("#a54444", "✗"),
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


def snapshot(benches: dict, tactics: list, man: dict) -> dict:
    """Persist status by stable suite/theorem/tactic ID for the next run."""
    return {
        "schema_version": 1,
        "run": {
            "id": os.environ.get("GITHUB_RUN_ID", ""),
            "time": datetime.now(timezone.utc).isoformat(timespec="seconds"),
            "url": os.environ.get("GITHUB_SERVER_URL", "https://github.com")
            + "/" + os.environ.get("GITHUB_REPOSITORY", "input-output-hk/Lean-blaster")
            + "/actions/runs/" + os.environ.get("GITHUB_RUN_ID", ""),
        },
        "versions": {t: man.get(t, {}) for t in tactics},
        "suites": {
            suite: {
                tac: {thm: cell[1] for thm, cell in rows.items()}
                for tac, rows in per_tactic.items()
            }
            for suite, per_tactic in benches.items()
        },
        "statements": {
            suite: {
                thm: cell[2]
                for rows in per_tactic.values() for thm, cell in rows.items()
            }
            for suite, per_tactic in benches.items()
        },
    }


def progress(current: dict, previous: dict) -> dict:
    """Count status transitions only for identical suite, theorem and tactic IDs."""
    if previous.get("schema_version") != 1:
        return {}
    out = {}
    for suite, tactics in current["suites"].items():
        prior_suite = previous.get("suites", {}).get(suite, {})
        for tac, goals in tactics.items():
            old_goals = prior_suite.get(tac, {})
            now_statements = current.get("statements", {}).get(suite, {})
            old_statements = previous.get("statements", {}).get(suite, {})
            shared = {goal for goal in goals.keys() & old_goals.keys()
                      if now_statements.get(goal) == old_statements.get(goal)}
            gained = sum(goals[g] == "OK" and old_goals[g] != "OK" for g in shared)
            lost = sum(goals[g] != "OK" and old_goals[g] == "OK" for g in shared)
            out[(suite, tac)] = (gained, lost, len(shared), len(goals) - len(shared))
    return out


def delta_badge(changes: tuple | None) -> str:
    if not changes:
        return "—"
    gain, loss, comparable, new = changes
    if not comparable:
        return f'<span class="delta neutral">{new} new goals</span>' if new else "—"
    badges = (f'<span class="delta gain">+{gain}</span> '
              f'<span class="delta loss">−{loss}</span>') if gain or loss else '<span class="delta neutral">no change</span>'
    if new:
        badges += f' <span class="delta neutral">{new} new</span>'
    return badges


def col_label(tac: str, man: dict) -> str:
    info = man.get(tac)
    if not info:
        return html.escape(tac)
    tc = info.get("toolchain", "?").replace("leanprover/lean4:", "")
    commit = info.get("resolved_commit", "?")
    build = info.get("build_status", "OK")
    cached = " · cached" if build == "CACHED" else ""
    tag = "" if build in ("OK", "CACHED") else f' <span style="color:#a54444">[{html.escape(build)}]</span>'
    return (f'<div class="tac">{html.escape(tac)}</div>'
            f'<div class="ver">{html.escape(tc)} · {html.escape(commit)}{cached}</div>{tag}')


def render_html(results: Path, benches: dict, tactics: list, man: dict, errors: dict,
                previous: dict | None = None) -> str:
    """Return a body-content fragment (style + markup), no document wrapper."""
    tcs = sorted({man[t].get("toolchain", "").replace("leanprover/lean4:", "")
                  for t in tactics if t in man} - {""})
    span = f"{tcs[0]} – {tcs[-1]}" if len(tcs) > 1 else (tcs[0] if tcs else "")
    changes = progress(snapshot(benches, tactics, man), previous) if previous else {}
    parts = []
    parts.append(STYLE)
    parts.append('<div class="wrap">')
    parts.append('<header class="masthead">')
    parts.append('<div class="eyebrow">Weekly benchmark · latest branches</div>')
    parts.append('<h1>Lean 4 tactic benchmark</h1>')
    parts.append(f'<p class="lede">{len(tactics)} tactics compared across {len(benches)} theorem suites. '
                 'Each tactic runs in its own isolated Lake project on its latest branch and that '
                 'branch\'s Lean toolchain; every column shows the toolchain and commit it ran on.</p>')
    if span:
        parts.append(f'<div class="spanline">toolchains {html.escape(span)} &middot; '
                     f'{len(tactics)} tactics &middot; {len(benches)} suites</div>')
    if previous:
        prev_run = previous.get("run", {})
        prev_url = prev_run.get("url", "")
        prev_date = prev_run.get("time", "")[:10]
        baseline = (f'<a href="{html.escape(prev_url, quote=True)}">{html.escape(prev_date)}</a>'
                    if prev_url.startswith("https://github.com/") else html.escape(prev_date))
        parts.append(f'<p class="compare-note">Changes compared with the {baseline} run. '
                     'Only unchanged statements count as gains or losses; new goals have no baseline.</p>')
    parts.append('</header>')
    parts.append('<nav class="jump" aria-label="Report sections"><a href="#overview">Overview</a>'
                 '<a href="#suites">Suites</a><a href="#versions">Versions</a>'
                 '<a href="#notes">How to read</a></nav>')

    # ---- at-a-glance overview: suites + overall standings ----
    suites = sorted(benches)
    home_suites = [s for s in suites if s.endswith("Home")]
    shared_suites = [s for s in suites if s not in home_suites]
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

    parts.append('<h2 id="overview">Overview</h2>')
    for label, group in (("Home turf · each source is its own category", home_suites),
                         ("Shared benchmarks", shared_suites)):
        if not group:
            continue
        parts.append(f'<h3 class="group-title">{html.escape(label)}</h3><div class="suite-cards">')
        for suite in group:
            n, best, best_ok = suite_info[suite]
            desc = SUITE_DESC.get(suite, "")
            pct = f"{best_ok / n * 100:.0f}%" if n else "0%"
            parts.append(
                f'<a class="scard" href="#suite-{html.escape(suite)}"><div class="scard-name">{html.escape(SUITE_LABELS.get(suite, suite))}</div>'
                + (f'<div class="scard-desc">{html.escape(desc)}</div>' if desc else '<div class="scard-desc">&nbsp;</div>')
                + f'<div class="scard-n mono">{n} theorems</div>'
                f'<div class="scard-best">best <b>{html.escape(best or "-")}</b> '
                f'<span class="mono">{best_ok}/{n} ({pct})</span></div></a>')
        parts.append('</div>')

    parts.append('<h3>Overall standing</h3><div class="table-scroll"><table class="standings"><tr>'
                 '<th>#</th><th>tactic</th><th>solved</th><th>since last run</th>'
                 '<th class="bar-col">share solved</th></tr>')
    for i, tac in enumerate(sorted(tactics, key=lambda x: totals[x], reverse=True), 1):
        sol = totals[tac]
        pct = sol / grand_n * 100 if grand_n else 0
        comparison = None
        if previous:
            related = [changes[(s, tac)] for s in suites if (s, tac) in changes]
            comparison = (sum(c[0] for c in related), sum(c[1] for c in related),
                          sum(c[2] for c in related), sum(c[3] for c in related))
        parts.append(
            f'<tr><td class="mono dim">{i}</td><td class="mono">{html.escape(tac)}</td>'
            f'<td class="mono"><b>{sol}</b>/{grand_n} <span class="dim">({pct:.0f}%)</span></td>'
            f'<td>{delta_badge(comparison) if previous else "—"}</td>'
            f'<td><div class="bar"><span style="width:{pct:.1f}%"></span></div></td></tr>')
    parts.append('</table></div>')

    # version manifest
    parts.append('<h2 id="versions">Versions run</h2><div class="table-scroll">')
    parts.append('<table class="manifest"><tr><th>tactic</th><th>branch</th><th>toolchain</th>'
                 '<th>commit</th><th>build</th></tr>')
    for tac in tactics:
        info = man.get(tac, {})
        build = info.get("build_status", "?")
        bcol = "#147761" if build in ("OK", "CACHED") else "#a54444"
        parts.append(
            f'<tr><td class="mono">{html.escape(tac)}</td>'
            f'<td class="mono">{html.escape(info.get("branch","?"))}</td>'
            f'<td class="mono">{html.escape(info.get("toolchain","?"))}</td>'
            f'<td class="mono">{html.escape(info.get("resolved_commit","?"))}</td>'
            f'<td class="mono" style="color:{bcol}">{html.escape(build)}</td></tr>')
    parts.append('</table></div>')

    # per-benchmark summary + matrix
    parts.append('<h2 id="suites">Suite details</h2>')
    for bench in home_suites + shared_suites:
        if home_suites and bench == home_suites[0]:
            parts.append('<h3 class="group-title">Home turf categories</h3>')
        if shared_suites and bench == shared_suites[0]:
            parts.append('<h3 class="group-title">Shared benchmarks</h3>')
        per_tactic = benches[bench]
        theorems, stmt_of = write_merged_csv(results, bench, tactics, per_tactic)
        summ = summarize(tactics, per_tactic, theorems)
        n = len(theorems)
        source = SUITE_SOURCES.get(bench)
        parts.append(f'<section class="suite" id="suite-{html.escape(bench)}">')
        parts.append(f'<div class="suite-head"><div><h3>{html.escape(SUITE_LABELS.get(bench, bench))} '
                     f'<span class="dim">· {n} theorems</span></h3>'
                     f'<p>{html.escape(SUITE_DESC.get(bench, ""))}</p></div>'
                     + (f'<a class="source" href="{html.escape(source, quote=True)}">Source ↗</a>' if source else '')
                     + '</div><div class="table-scroll">')

        # summary bars
        parts.append('<table class="summary"><tr><th>tactic</th><th>solved</th>'
                     '<th>since last run</th><th class="bar-col">breakdown</th>'
                     '<th>timeout</th><th>env</th><th>fail</th></tr>')
        for tac in tactics:
            c = summ[tac]
            ok, to, en, fa = c["OK"], c["TIMEOUT"], c["ENV"], c["FAIL"]
            tot = max(n, 1)
            seg = (f'<span style="background:#16836c;width:{ok/tot*100:.1f}%"></span>'
                   f'<span style="background:#c18a20;width:{to/tot*100:.1f}%"></span>'
                   f'<span style="background:#4b78a3;width:{en/tot*100:.1f}%"></span>'
                   f'<span style="background:#c75e5e;width:{fa/tot*100:.1f}%"></span>')
            parts.append(
                f'<tr><td class="mono">{html.escape(tac)}</td>'
                f'<td class="mono"><b>{ok}</b>/{n} ({ok/tot*100:.0f}%)</td>'
                f'<td>{delta_badge(changes.get((bench, tac))) if previous else "—"}</td>'
                f'<td><div class="bar">{seg}</div></td>'
                f'<td class="mono">{to}</td><td class="mono" style="color:#35648c">{en}</td>'
                f'<td class="mono">{fa}</td></tr>')
        parts.append('</table></div>')

        # matrix
        parts.append('<details class="matrix-details"><summary>Explore theorem results '
                     f'<span>{n} goals × {len(tactics)} tactics</span></summary>')
        parts.append('<div class="scroll"><table class="matrix"><tr><th class="thm">theorem</th>')
        for tac in tactics:
            parts.append(f'<th>{col_label(tac, man)}</th>')
        parts.append('</tr>')
        for thm in theorems:
            parts.append(f'<tr><td class="thm mono">{html.escape(thm)}</td>')
            for tac in tactics:
                cell = per_tactic.get(tac, {}).get(thm, ("", "FAIL", ""))
                time_s, st = cell[0], cell[1]
                color, glyph = STATUS_STYLE.get(st, ("#a54444", "✗"))
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
        parts.append('</table></div></details></section>')

    # caveats
    parts.append('<h2 id="notes">Reading these results fairly</h2><ul class="caveats">')
    parts.append('<li><b>Home turf suites.</b> Each category has 50 source-linked goals, '
                 'adapted to portable statements and run against every tactic. Hammer’s category '
                 'uses one LeanHammer example and 49 Duper dependency tests because LeanHammer '
                 'does not publish a theorem test suite. These samples do not replace the projects’ '
                 'own test suites.</li>')
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
:root{--bg:#f7f8f5;--panel:#fff;--bd:#dfe3dc;--tx:#17221e;--dim:#61716a;--acc:#146955;--ok:#16836c;--to:#c18a20;--env:#4b78a3;--fail:#c75e5e}
*{box-sizing:border-box}html{scroll-behavior:smooth}body{color:var(--tx)}
.wrap{max-width:1280px;margin:0 auto;padding:0 32px 96px;font:15px/1.6 ui-sans-serif,-apple-system,BlinkMacSystemFont,"Segoe UI",sans-serif;color:var(--tx)}
a{color:var(--acc)}.masthead{padding:56px 0 30px}.eyebrow{color:var(--acc);font-size:.75rem;font-weight:750;text-transform:uppercase;letter-spacing:.16em;margin-bottom:15px}
h1{font-size:clamp(2.3rem,5vw,4rem);line-height:1.05;margin:0 0 18px;font-weight:760;letter-spacing:-.045em}.lede{color:var(--dim);max-width:78ch;font-size:1.05rem;margin:0}
.spanline{margin-top:18px;color:var(--dim);font-size:.82rem}.compare-note{margin:22px 0 0;padding:12px 16px;border-left:3px solid var(--acc);background:#eaf4ee;color:#355448;font-size:.88rem;max-width:80ch}
.jump{position:sticky;top:0;z-index:20;display:flex;gap:24px;flex-wrap:wrap;padding:12px 0;margin:0 0 30px;background:rgba(247,248,245,.95);border-block:1px solid var(--bd);backdrop-filter:blur(12px)}.jump a{text-decoration:none;font-weight:650;font-size:.85rem}.jump a:hover{text-decoration:underline}
h2{margin:50px 0 16px;font-size:1.55rem;letter-spacing:-.025em;line-height:1.2}h3{margin:0 0 10px;font-size:1.09rem;letter-spacing:-.01em}.group-title{margin:24px 0 12px;color:var(--dim);font-size:.9rem;text-transform:uppercase;letter-spacing:.06em}.dim{color:var(--dim);font-weight:400;font-size:.88rem}.mono{font-family:ui-monospace,SFMono-Regular,Menlo,monospace;font-variant-numeric:tabular-nums}
.suite-cards{display:grid;grid-template-columns:repeat(auto-fit,minmax(210px,1fr));gap:12px;margin:0 0 32px}.scard{display:block;color:inherit;text-decoration:none;background:var(--panel);border:1px solid var(--bd);border-radius:12px;padding:17px 18px;box-shadow:0 1px 3px #193d2910;transition:transform .15s,box-shadow .15s}.scard:hover{transform:translateY(-2px);box-shadow:0 8px 25px #193d291b;border-color:#a5c8b5}.scard-name{font-weight:750;font-size:1.1rem}.scard-desc{color:var(--dim);font-size:.8rem;min-height:2.3em;margin:3px 0 10px}.scard-n{font-size:.72rem;color:var(--dim)}.scard-best{margin-top:8px;font-size:.85rem}.scard-best b{color:var(--acc)}
table{border-collapse:collapse;width:100%;font-size:13px;background:var(--panel)}th,td{padding:10px 13px;border-bottom:1px solid var(--bd);text-align:left;vertical-align:middle}tr:last-child td{border-bottom:0}th{color:var(--dim);font-size:.68rem;text-transform:uppercase;letter-spacing:.07em;font-weight:700;background:#f0f3ee}td{font-variant-numeric:tabular-nums}tr:hover td{background:#f6faf6}.table-scroll{overflow-x:auto;border:1px solid var(--bd);border-radius:11px;background:var(--panel);box-shadow:0 1px 3px #193d2910}.manifest td,.summary td,.standings td{white-space:nowrap}.bar-col{min-width:180px;width:25%}.bar{display:flex;height:9px;border-radius:9px;overflow:hidden;background:#e6ebe5}.bar span{display:block;background:var(--ok)}.bar span:nth-child(2){background:var(--to)}.bar span:nth-child(3){background:var(--env)}.bar span:nth-child(4){background:var(--fail)}
.delta{display:inline-block;padding:2px 7px;border-radius:5px;font-size:.73rem;font-weight:750;white-space:nowrap}.delta.gain{color:#0d694b;background:#ddf3e7}.delta.loss{color:#a83c3c;background:#ffe9e5}.delta.neutral{color:#67766c;background:#edf0e9}
.suite{border-top:1px solid var(--bd);padding:26px 0 8px;scroll-margin-top:70px}.suite-head{display:flex;justify-content:space-between;gap:16px;align-items:start}.suite-head p{margin:0 0 14px;color:var(--dim);font-size:.9rem}.source{font-size:.78rem;text-decoration:none;font-weight:700;white-space:nowrap}.source:hover{text-decoration:underline}
.matrix-details{margin:12px 0 24px}.matrix-details summary{cursor:pointer;color:var(--acc);font-weight:700;font-size:.85rem;padding:7px 0}.matrix-details summary span{color:var(--dim);font-weight:400;margin-left:7px}.scroll{overflow:auto;max-height:670px;border:1px solid var(--bd);border-radius:9px;margin-top:9px}.matrix{font-size:12px}.matrix th{position:sticky;top:0;z-index:2}.matrix th .tac{font-size:.77rem;font-weight:700;color:var(--tx);text-transform:none;letter-spacing:0;white-space:nowrap}.matrix th .ver{font-size:.64rem;color:var(--dim);font-weight:400;text-transform:none;letter-spacing:0;white-space:nowrap}.matrix .thm{position:sticky;left:0;background:var(--panel);min-width:180px;max-width:260px;overflow:hidden;text-overflow:ellipsis;box-shadow:1px 0 0 var(--bd);z-index:1}.matrix th.thm{z-index:3;background:#f0f3ee}.cell{white-space:nowrap;cursor:pointer}.cell:hover{text-decoration:underline}
.caveats{color:var(--dim);max-width:82ch}.caveats li{margin:12px 0}.caveats b{color:var(--tx)}.hint{color:var(--dim);font-size:.81rem}code{background:#e9efea;padding:1px 5px;border-radius:4px;font-size:.85em}
#cellpop{position:fixed;z-index:60;max-width:380px;display:none;background:var(--panel);border:1px solid var(--bd);border-radius:9px;padding:13px 15px;box-shadow:0 12px 36px #17221e38}#cellpop .pl{color:var(--dim);font-size:.68rem;text-transform:uppercase;letter-spacing:.08em}#cellpop .pt{font-weight:700;font-size:.92rem;margin-top:2px;word-break:break-word}#cellpop .pst{margin-top:7px;font-weight:700;font-family:ui-monospace,SFMono-Regular,Menlo,monospace}#cellpop .pm{margin-top:6px;font-family:ui-monospace,SFMono-Regular,Menlo,monospace;font-size:.82rem;color:var(--tx);white-space:pre-wrap;word-break:break-word;line-height:1.5}
@media(max-width:700px){.wrap{padding:0 16px 70px}.masthead{padding:34px 0 20px}.jump{gap:14px}.suite-head{display:block}.source{display:inline-block;margin-bottom:12px}.bar-col{min-width:110px}}
@media(prefers-reduced-motion:reduce){html{scroll-behavior:auto}.scard{transition:none}}
</style>"""

POPOVER_JS = """<script>
(function(){
  var pop=document.getElementById('cellpop');
  var COL={OK:'#147761',TIMEOUT:'#9a6b12',ENV:'#35648c',FAIL:'#a54444'};
  pop.innerHTML='<div class="pl"></div><div class="pt"></div><div class="pst"></div><div class="pm"></div>';
  document.addEventListener('click',function(e){
    var td=e.target.closest?e.target.closest('td.cell'):null;
    if(!td){pop.style.display='none';return;}
    pop.querySelector('.pl').textContent=td.dataset.tac||'';
    pop.querySelector('.pt').textContent=td.dataset.thm||'';
    var ps=pop.querySelector('.pst');ps.textContent=td.dataset.st||'';
    ps.style.color=COL[td.dataset.st]||'#a54444';
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

    home = [s for s in suites if s.endswith("Home")]
    shared = [s for s in suites if s not in home]
    order = sorted(tactics, key=lambda x: totals[x][0], reverse=True)

    def version(t: str) -> str:
        info = man.get(t, {})
        tc = info.get("toolchain", "?").replace("leanprover/lean4:", "")
        commit = info.get("resolved_commit", "?")
        build = info.get("build_status", "OK")
        if build in ("OK", "CACHED"):
            return f"`{tc}` @ `{commit}`" + (" _(cached)_" if build == "CACHED" else "")
        return f"`{tc}` **{build}**"

    rows = []
    if shared:
        rows.append("### Shared benchmarks\n")
        rows.append("| Tactic | Version | " + " | ".join(shared) + " | **Shared solved** |")
        rows.append("|:--|:--|" + "--:|" * len(shared) + "--:|")
        for t in order:
            cells = " | ".join(f"{per[t][s][0]}/{per[t][s][1]}" for s in shared)
            ok, n = sum(per[t][s][0] for s in shared), sum(per[t][s][1] for s in shared)
            rows.append(f"| `{t}` | {version(t)} | {cells} | **{ok}/{n}** |")

    if home:
        rows.append("\n### Home turf · 50 goals per source\n")
        labels = [SUITE_LABELS.get(s, s) for s in home]
        rows.append("| Tactic | " + " | ".join(labels) + " | **Home solved** | **All solved** |")
        rows.append("|:--|" + "--:|" * (len(home) + 2))
        for t in order:
            cells = " | ".join(f"{per[t][s][0]}/{per[t][s][1]}" for s in home)
            home_ok, home_n = sum(per[t][s][0] for s in home), sum(per[t][s][1] for s in home)
            sol, tot = totals[t]
            rows.append(f"| `{t}` | {cells} | **{home_ok}/{home_n}** | **{sol}/{tot}** |")

    note = ("\n_Each tactic runs in an isolated Lake project on its **latest default branch** and that "
            "branch's own Lean toolchain (tracked live). Cells show theorems **solved / total**; "
            "cross-version numbers can shift with mathlib changes, not only tactic quality. "
            "Home turf goals come from the tactic repositories; Hammer's category includes "
            "Duper dependency tests. The report gives source links and per-goal results._")
    link = f"\n\n**[Full interactive report →]({report_url})**" if report_url else ""
    return "\n".join(rows) + "\n" + note + link + "\n"


def wrap_standalone(fragment: str) -> str:
    return (f'<!doctype html><html lang="en"><head><meta charset="utf-8">'
            f'<meta name="viewport" content="width=device-width,initial-scale=1">'
            f'<title>Fair latest-branch tactic benchmark</title>'
            f'<style>body{{margin:0;background:#f7f8f5}}</style></head><body>{fragment}</body></html>')


def main():
    results = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(__file__).parent / "results"
    previous_path = Path(sys.argv[2]) if len(sys.argv) > 2 else None
    previous = None
    if previous_path and previous_path.exists():
        reader = gzip.open if previous_path.suffix == ".gz" else open
        with reader(previous_path, "rt", encoding="utf-8") as f:
            previous = json.load(f)
    man = load_manifest(results)
    benches, seen, errors = discover(results)
    if not benches:
        print(f"No per-tool result CSVs found under {results}", file=sys.stderr)
        sys.exit(1)
    tactics = ordered_tactics(seen)
    fragment = render_html(results, benches, tactics, man, errors, previous)
    out_html = results / "report.html"
    out_html.write_text(wrap_standalone(fragment), encoding="utf-8")
    frag_html = results / "report.artifact.html"
    frag_html.write_text(fragment, encoding="utf-8")
    snapshot_out = results / "snapshot.json"
    snapshot_out.write_text(json.dumps(snapshot(benches, tactics, man), indent=2, sort_keys=True) + "\n",
                            encoding="utf-8")
    # Markdown summary for README injection (report URL comes from env in CI).
    import os
    md = emit_markdown(benches, tactics, man, os.environ.get("BENCH_REPORT_URL", ""))
    md_out = results / "summary.md"
    md_out.write_text(md, encoding="utf-8")
    print(f"Merged CSVs: {results/'merged'}")
    print(f"Report:      {out_html}")
    print(f"Artifact:    {frag_html}")
    print(f"Summary md:  {md_out}")
    print(f"Snapshot:    {snapshot_out}")
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
