"""Small regression checks for published benchmark comparisons."""
import unittest
from pathlib import Path

from merge_results import emit_markdown, progress, snapshot


class ProgressTests(unittest.TestCase):
    def setUp(self):
        self.old = {"schema_version": 1, "suites": {"S": {"blaster": {
            "gained": "FAIL", "lost": "OK", "same": "OK", "edited": "OK"}}},
            "statements": {"S": {k: k for k in ("gained", "lost", "same", "edited")}}}

    def test_only_identical_goals_are_compared(self):
        now = {"schema_version": 1, "suites": {"S": {"blaster": {
            "gained": "OK", "lost": "TIMEOUT", "same": "OK", "edited": "FAIL",
            "new": "OK"}}}, "statements": {"S": {
                "gained": "gained", "lost": "lost", "same": "same",
                "edited": "changed statement", "new": "new"}}}
        self.assertEqual(progress(now, self.old)[("S", "blaster")], (1, 1, 3, 2))

    def test_new_suite_has_no_comparable_goals(self):
        now = {"schema_version": 1, "suites": {"New": {"auto": {"a": "OK"}}},
               "statements": {"New": {"a": "True"}}}
        self.assertEqual(progress(now, self.old)[("New", "auto")], (0, 0, 0, 1))

    def test_snapshot_records_status_and_statement(self):
        s = snapshot({"S": {"auto": {"a": ("1", "OK", "True")}}}, ["auto"], {})
        self.assertEqual(s["suites"]["S"]["auto"]["a"], "OK")
        self.assertEqual(s["statements"]["S"]["a"], "True")

    def test_readme_shows_each_home_category(self):
        data = {"NNG4": {"auto": {"x": ("1", "OK", "True")}},
                "AutoHome": {"auto": {"a": ("1", "OK", "True")}},
                "SmtHome": {"auto": {"b": ("1", "FAIL", "False")}}}
        md = emit_markdown(data, ["auto"], {})
        self.assertIn("### Shared benchmarks", md)
        self.assertIn("### Home turf · 50 goals per source", md)
        self.assertIn("| Tactic | lean-auto | lean-smt | **Home solved** | **All solved** |", md)
        self.assertIn("| `auto` | 1/1 | 0/1 | **1/2** | **2/3** |", md)

    def test_home_turf_corpus_has_five_source_linked_categories(self):
        root = Path(__file__).resolve().parents[1] / "BlasterBenchmarks" / "Home"
        for category in ("Blaster", "Smt", "Auto", "Aesop", "Hammer"):
            goals = sorted((root / category).glob("*.lean"))
            self.assertEqual(len(goals), 50, category)
            for goal in goals:
                source = goal.read_text(encoding="utf-8")
                self.assertIn("https://github.com/", source, goal.name)
                self.assertEqual(source.count("theorem "), 1, goal.name)


if __name__ == "__main__":
    unittest.main()
