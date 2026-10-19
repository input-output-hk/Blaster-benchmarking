"""Small regression checks for published benchmark comparisons."""
import unittest

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

    def test_readme_groups_home_suites(self):
        data = {"NNG4": {"auto": {"x": ("1", "OK", "True")}},
                "AutoHome": {"auto": {"a": ("1", "OK", "True")}},
                "SmtHome": {"auto": {"b": ("1", "FAIL", "False")}}}
        md = emit_markdown(data, ["auto"], {})
        self.assertIn("| NNG4 | Home turf | **Solved** |", md)
        self.assertIn("| 1/1 | 1/2 | **2/3** |", md)


if __name__ == "__main__":
    unittest.main()
