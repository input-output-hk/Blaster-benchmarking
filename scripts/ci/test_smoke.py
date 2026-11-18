import csv
from pathlib import Path
import tempfile
import unittest

from run_smoke import THEOREMS, validate_results


class SmokeTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.csv = Path(self.tmp.name) / 'results.csv'
        self.rows = [[name, '1', 'OK', '2', 'OK'] for name in sorted(THEOREMS)]

    def write(self):
        with self.csv.open('w', newline='') as dest:
            writer = csv.writer(dest)
            writer.writerow(['Theorem', 'omega_time', 'omega_status', 'blaster_time', 'blaster_status'])
            writer.writerows(self.rows)

    def test_valid(self):
        self.write()
        self.assertEqual(len(validate_results(self.csv)), 3)

    def test_each_non_success_and_invalid_timing_is_rejected(self):
        for status, elapsed in [('FAIL', 'fail'), ('ENV', 'env'), ('TIMEOUT', 'timeout'),
                                ('DRY_RUN', '0'), ('OK', 'nan'), ('OK', '-1')]:
            with self.subTest(status=status, elapsed=elapsed):
                self.rows[0][3:] = [elapsed, status]
                self.write()
                with self.assertRaises(ValueError):
                    validate_results(self.csv)

    def test_missing_duplicate_extra_rows_are_rejected(self):
        good = self.rows[:]
        for rows in [good[:-1], [good[0]] * 3, good + [good[0]], []]:
            self.rows = rows
            self.write()
            with self.assertRaises(ValueError):
                validate_results(self.csv)


if __name__ == '__main__':
    unittest.main()
