import hashlib
import json
import tempfile
import unittest
from pathlib import Path

from import_corpus import import_corpus, primary_purpose


class ImportCorpusTests(unittest.TestCase):
    def test_exact_hash_dedup_preserves_both_networks(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            corpus, repo = root / "export", root / "repo"
            body = bytes.fromhex("450101002499")
            script_hash = hashlib.blake2b(b"\x03" + body, digest_size=28).hexdigest()
            tx_hash = "b" * 64
            entries = []
            for network in ("mainnet", "preprod"):
                script_path = f"scripts/{network}/{script_hash}.cbor"
                context_path = f"transactions/{network}/{tx_hash}.json"
                tx_path = f"transactions/{network}/{tx_hash}.cbor"
                for path, content in (
                    (script_path, body),
                    (context_path, json.dumps({"transaction": {"block_time": 100}}).encode()),
                    (tx_path, b"transaction"),
                ):
                    target = corpus / path
                    target.parent.mkdir(parents=True, exist_ok=True)
                    target.write_bytes(content)
                entries.append({"network": network, "script_hash": script_hash,
                                "script_type": "plutusV3", "serialised_size": len(body),
                                "script_path": script_path, "cluster_id": "family",
                                "shape_hash": "shape",
                                "examples": [{"tx_hash": tx_hash, "purpose": "mint",
                                              "context_path": context_path, "path": tx_path,
                                              "tx_index": 0, "valid_contract": True}]})
            (corpus / "manifest.jsonl").write_text(
                "\n".join(json.dumps(item) for item in entries) + "\n")

            result = import_corpus(corpus, repo, "pilot")
            self.assertEqual(result, {"imported": 1, "total_unique": 1, "fixtures": 2})
            record = json.loads((repo / "LiveScripts/catalog.json").read_text())["scripts"][0]
            self.assertEqual(record["networks"], ["mainnet", "preprod"])
            self.assertEqual(len(record["examples"]), 2)
            self.assertEqual((repo / f"LiveScripts/S_{script_hash}/script.cbor.hex").read_text(), body.hex() + "\n")
            self.assertIn("validMintingContext ctx", (
                repo / f"LiveScripts/S_{script_hash}/Properties.lean").read_text())
            self.assertEqual(import_corpus(corpus, repo, "pilot"), result)
            cohort = json.loads((repo / "LiveScripts/cohorts/pilot.json").read_text())
            self.assertEqual(cohort["script_hashes"], [script_hash])

    def test_primary_purpose(self):
        self.assertEqual(primary_purpose({"spend", "mint"}), "spend")
        self.assertEqual(primary_purpose({"reward"}), "reward")


if __name__ == "__main__":
    unittest.main()
