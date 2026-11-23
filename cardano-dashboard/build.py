#!/usr/bin/env python3
"""Build the standalone public Cardano Scripts dashboard."""

from __future__ import annotations

import json
import shutil
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parent
REPO = ROOT.parent
DIST = ROOT / "dist"


def build() -> dict:
    catalog = json.loads((REPO / "LiveScripts/catalog.json").read_text())
    cohort_files = sorted((REPO / "LiveScripts/cohorts").glob("*.json"))
    cohorts = [json.loads(path.read_text()) for path in cohort_files]
    runs_path = ROOT / "runs.json"
    runs = json.loads(runs_path.read_text()) if runs_path.exists() else {"events": [], "results": {}}
    latest_path = REPO / "LiveScripts/results/latest.json"
    latest = json.loads(latest_path.read_text()) if latest_path.exists() else {}
    config_path = REPO / "LiveScripts/results/active-config.json"
    if config_path.exists():
        active_config = json.loads(config_path.read_text())["config"]
        latest = {key: result for key, result in latest.items()
                  if result.get("config") == active_config}
    scripts = catalog["scripts"]
    statuses = {**latest, **runs.get("results", {})}
    public_scripts = []
    for record in scripts:
        item = dict(record)
        item["status"] = statuses.get(record["script_hash"], {}).get("status", "unrun")
        item["result"] = statuses.get(record["script_hash"], {})
        public_scripts.append(item)
    payload = {
        "schema_version": 1,
        "scripts": public_scripts,
        "cohorts": cohorts,
        "events": runs.get("events", []),
        "counts": dict(Counter(item["status"] for item in public_scripts)),
    }
    (DIST / "assets").mkdir(parents=True, exist_ok=True)
    (DIST / "data").mkdir(parents=True, exist_ok=True)
    shutil.copy2(ROOT / "index.html", DIST / "index.html")
    shutil.copy2(ROOT / "styles.css", DIST / "assets/styles.css")
    shutil.copy2(ROOT / "app.js", DIST / "assets/app.js")
    (DIST / "data/dashboard.json").write_text(json.dumps(payload, separators=(",", ":")))
    return {"scripts": len(public_scripts), "cohorts": len(cohorts),
            "events": len(payload["events"]), "dist": str(DIST)}


if __name__ == "__main__":
    print(json.dumps(build()))
