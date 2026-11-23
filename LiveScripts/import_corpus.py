#!/usr/bin/env python3
"""Import a BlasterCorpus export as immutable, deduplicated Lean script cases.

The script hash is the case identity. An existing case is never deleted when it
falls out of the rolling seven-day window; the dashboard records when it was
last observed instead. Run from any directory with --corpus and --repo.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import shutil
from datetime import datetime, timezone
from pathlib import Path


HASH = re.compile(r"[0-9a-f]{56}\Z")
TX_HASH = re.compile(r"[0-9a-f]{64}\Z")
LANG = {"plutusV1": "PlutusV1", "plutusV2": "PlutusV2", "plutusV3": "PlutusV3"}
LANG_TAG = {"plutusV1": 1, "plutusV2": 2, "plutusV3": 3}


def write_if_changed(path: Path, content: str | bytes) -> None:
    data = content.encode() if isinstance(content, str) else content
    if path.exists() and path.read_bytes() == data:
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(data)


def json_text(value: object) -> str:
    return json.dumps(value, indent=2, sort_keys=True, ensure_ascii=False) + "\n"


def script_module(script_hash: str, script_type: str) -> str:
    return (
        "import PlutusCore.UPLC.ScriptEncoding\n\n"
        f'#import_uplc script_{script_hash} {LANG[script_type]} single_cbor_hex '
        f'"LiveScripts/S_{script_hash}/script.cbor.hex"\n'
    )


def primary_purpose(purposes: set[str]) -> str:
    return next((purpose for purpose in ("spend", "mint", "reward", "cert")
                 if purpose in purposes), "spend")


def property_module(script_hash: str, script_type: str, purpose: str) -> str:
    version = LANG[script_type].replace("Plutus", "")
    name = {"spend": "Spending", "mint": "Minting", "reward": "Rewarding", "cert": "Certifying"}[purpose]
    variable = "ctx" if version == "V3" else "input"
    variable_type = "ScriptContext" if version == "V3" else f"{name}Input"
    inputs = name.lower() + "Inputs"
    valid = f"valid{name}Context"
    return (
        f"import CardanoLedgerApi.{version}\n"
        f"import LiveScripts.S_{script_hash}.Script\n"
        "import Blaster.Command.Syntax\n"
        "import PlutusCore.UPLC.CekMachine\n"
        "import PlutusCore.UPLC.Utils\n\n"
        f"open CardanoLedgerApi.{version}\n"
        "open PlutusCore.UPLC.CekMachine (cekExecuteProgram)\n"
        "open PlutusCore.UPLC.Utils (isSuccessful)\n\n"
        "-- A counterexample is a candidate until its concrete invocation is replayed.\n"
        f"-- Search purpose: {purpose}; CEK fuel: 1000; SMT limit: 10 seconds.\n"
        "#blaster (timeout: 10) (verbose: 1) (solve-result: 1)\n"
        f"  [∀ {variable} : {variable_type},\n"
        f"    {valid} {variable} →\n"
        f"      ¬ isSuccessful (cekExecuteProgram script_{script_hash}.script ({inputs} {variable}) 1000)]\n"
    )


def load_export(corpus: Path) -> tuple[dict[str, dict], dict[str, bytes]]:
    records: dict[str, dict] = {}
    bodies: dict[str, bytes] = {}
    for line in (corpus / "manifest.jsonl").read_text().splitlines():
        item = json.loads(line)
        script_hash = item["script_hash"]
        script_type = item["script_type"]
        network = item["network"]
        if not HASH.fullmatch(script_hash) or script_type not in LANG:
            raise ValueError(f"Invalid Plutus script identity: {script_hash}")
        if network not in ("mainnet", "preprod"):
            raise ValueError(f"Unknown network: {network}")
        body = (corpus / item["script_path"]).read_bytes()
        if len(body) != int(item["serialised_size"]):
            raise ValueError(f"Script size mismatch: {script_hash}")
        actual_hash = hashlib.blake2b(bytes([LANG_TAG[script_type]]) + body, digest_size=28).hexdigest()
        if actual_hash != script_hash:
            raise ValueError(f"Script hash mismatch: {script_hash} != {actual_hash}")
        if script_hash in bodies and bodies[script_hash] != body:
            raise ValueError(f"Same hash has different CBOR: {script_hash}")
        bodies[script_hash] = body
        record = records.setdefault(script_hash, {
            "script_hash": script_hash, "script_type": script_type,
            "serialised_size": len(body), "networks": [], "purposes": [],
            "cluster_id": item.get("cluster_id"),
            "shape_hash": item.get("shape_hash"), "examples": [],
            "first_seen": None, "last_seen": None,
        })
        if record["script_type"] != script_type:
            raise ValueError(f"Same hash has different languages: {script_hash}")
        if network not in record["networks"]:
            record["networks"].append(network)
        for example in item.get("examples", []):
            tx_hash = example["tx_hash"]
            if not TX_HASH.fullmatch(tx_hash):
                raise ValueError(f"Invalid transaction hash: {tx_hash}")
            purpose = example.get("purpose") or "unknown"
            if purpose not in record["purposes"]:
                record["purposes"].append(purpose)
            context_file = corpus / example["context_path"]
            context = json.loads(context_file.read_text())
            block_time = context.get("transaction", {}).get("block_time")
            if block_time is not None:
                block_time = int(block_time)
                record["first_seen"] = min(record["first_seen"] or block_time, block_time)
                record["last_seen"] = max(record["last_seen"] or block_time, block_time)
            witness = {
                "network": network, "tx_hash": tx_hash, "purpose": purpose,
                "tx_index": example.get("tx_index"),
                "valid_contract": example.get("valid_contract"),
                "block_time": block_time,
                "cbor_path": f"LiveScripts/fixtures/{network}/{tx_hash}.cbor",
                "context_path": f"LiveScripts/fixtures/{network}/{tx_hash}.json",
            }
            if witness not in record["examples"]:
                record["examples"].append(witness)
    for record in records.values():
        record["networks"].sort()
        record["purposes"].sort()
        record["examples"].sort(key=lambda e: (e["network"], e["tx_hash"], e["purpose"]))
    return records, bodies


def import_corpus(corpus: Path, repo: Path, cohort_name: str | None) -> dict:
    incoming, bodies = load_export(corpus)
    scripts_root = repo / "LiveScripts"
    catalog_path = scripts_root / "catalog.json"
    old_catalog = json.loads(catalog_path.read_text()) if catalog_path.exists() else {"scripts": []}
    records = {r["script_hash"]: r for r in old_catalog["scripts"]}

    for script_hash, fresh in incoming.items():
        old = records.get(script_hash)
        if old:
            if old["script_type"] != fresh["script_type"] or old["serialised_size"] != fresh["serialised_size"]:
                raise ValueError(f"Existing script identity changed: {script_hash}")
            old_body = scripts_root / f"S_{script_hash}" / "script.cbor.hex"
            if old_body.exists() and bytes.fromhex(old_body.read_text().strip()) != bodies[script_hash]:
                raise ValueError(f"Existing script body changed: {script_hash}")
            fresh["networks"] = sorted(set(old["networks"]) | set(fresh["networks"]))
            fresh["purposes"] = sorted(set(old["purposes"]) | set(fresh["purposes"]))
            first_times = [x for x in (old.get("first_seen"), fresh["first_seen"]) if x is not None]
            last_times = [x for x in (old.get("last_seen"), fresh["last_seen"]) if x is not None]
            fresh["first_seen"] = min(first_times) if first_times else None
            fresh["last_seen"] = max(last_times) if last_times else None
            seen = {(e["network"], e["tx_hash"], e["purpose"], e.get("tx_index")) for e in fresh["examples"]}
            for example in old["examples"]:
                key = (example["network"], example["tx_hash"], example["purpose"], example.get("tx_index"))
                if key not in seen:
                    fresh["examples"].append(example)
                    seen.add(key)
            fresh["examples"].sort(key=lambda e: (e["network"], e["tx_hash"], e["purpose"], e.get("tx_index") or 0))
        records[script_hash] = fresh
        fresh["search_purpose"] = primary_purpose(set(fresh["purposes"]))
        case = scripts_root / f"S_{script_hash}"
        write_if_changed(case / "script.cbor.hex", bodies[script_hash].hex() + "\n")
        write_if_changed(case / "Script.lean", script_module(script_hash, fresh["script_type"]))
        write_if_changed(case / "Properties.lean", property_module(
            script_hash, fresh["script_type"], fresh["search_purpose"]))
        write_if_changed(case / "metadata.json", json_text(fresh))

    # Transaction fixtures are content-addressed and shared by script cases.
    fixtures: set[tuple[str, str, str]] = set()
    for item in incoming.values():
        for example in item["examples"]:
            network, tx_hash = example["network"], example["tx_hash"]
            for suffix in (".cbor", ".json"):
                fixtures.add((network, tx_hash, suffix))
    for network, tx_hash, suffix in sorted(fixtures):
        src = corpus / "transactions" / network / f"{tx_hash}{suffix}"
        dst = scripts_root / "fixtures" / network / f"{tx_hash}{suffix}"
        if not dst.exists() or dst.read_bytes() != src.read_bytes():
            dst.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(src, dst)

    catalog = {"schema_version": 1, "scripts": [records[h] for h in sorted(records)]}
    write_if_changed(catalog_path, json_text(catalog))
    if cohort_name:
        if not re.fullmatch(r"[A-Za-z0-9_-]+", cohort_name):
            raise ValueError("Invalid cohort name")
        cohort_path = scripts_root / "cohorts" / f"{cohort_name}.json"
        if not cohort_path.exists():
            cohort = {"schema_version": 1, "name": cohort_name,
                      "created_at": datetime.now(timezone.utc).isoformat(),
                      "script_hashes": sorted(incoming)}
            write_if_changed(cohort_path, json_text(cohort))
    return {"imported": len(incoming), "total_unique": len(records),
            "fixtures": len(fixtures) // 2}


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--corpus", type=Path, required=True)
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parent.parent)
    parser.add_argument("--cohort", help="Create this immutable benchmark cohort if absent")
    args = parser.parse_args()
    print(json.dumps(import_corpus(args.corpus.resolve(), args.repo.resolve(), args.cohort)))


if __name__ == "__main__":
    main()
