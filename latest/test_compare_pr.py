"""Regression checks for PR-to-weekly comparisons."""

import unittest
from unittest.mock import patch

from compare_pr import comparison


class ComparePRTests(unittest.TestCase):
    def setUp(self):
        self.weekly = {
            "schema_version": 1,
            "run": {"url": "https://github.com/example/repo/actions/runs/1"},
            "versions": {"blaster": {"toolchain": "leanprover/lean4:v4.24.0",
                                      "resolved_commit": "old"}},
            "suites": {"Home": {"blaster": {"gain": "FAIL", "loss": "OK",
                                                "same": "OK", "edited": "OK"}}},
            "statements": {"Home": {g: g for g in ("gain", "loss", "same", "edited")}},
        }
        self.current = {
            "schema_version": 1,
            "versions": {"blaster": {"toolchain": "leanprover/lean4:v4.25.0",
                                      "resolved_commit": "new", "build_status": "OK"}},
            "suites": {"Home": {"blaster": {"gain": "OK", "loss": "TIMEOUT",
                                                "same": "OK", "edited": "FAIL", "new": "OK"}}},
            "statements": {"Home": {"gain": "gain", "loss": "loss", "same": "same",
                                    "edited": "changed", "new": "new"}},
        }

    def test_counts_only_matching_goals_and_reports_transitions(self):
        md = comparison(self.current, self.weekly, ("blaster",))
        self.assertIn("| Home | 3 | 2 | 2 | +1 | −1 | 1 |", md)
        self.assertIn("2 goal IDs were omitted", md)
        self.assertIn("+`gain`", md)
        self.assertIn("−`loss`", md)
        self.assertIn("toolchains differ", md)

    def test_incomplete_suite_cannot_look_like_a_regression(self):
        self.current["suites"] = {}
        with self.assertRaisesRegex(ValueError, "Missing blaster suites: Home"):
            comparison(self.current, self.weekly, ("blaster",))

    def test_failed_build_cannot_be_compared(self):
        self.current["versions"]["blaster"]["build_status"] = "BUILD_FAIL"
        with self.assertRaisesRegex(ValueError, "did not build"):
            comparison(self.current, self.weekly, ("blaster",))

    def test_result_must_be_from_requested_pr_commit(self):
        with patch.dict("os.environ", {"PR_HEAD_SHA": "a" * 40}):
            with self.assertRaisesRegex(ValueError, "not from the requested PR head"):
                comparison(self.current, self.weekly, ("blaster",))


if __name__ == "__main__":
    unittest.main()
