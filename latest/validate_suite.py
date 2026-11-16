#!/usr/bin/env python3
"""Reject missing/partial/malformed suite CSVs before reporting or caching success."""
import csv
import re
import sys
from pathlib import Path


def validate(csv_path, suite, source, mode, tactics):
    source = Path(source)
    if mode == 'taskdir':
        expected = {p.stem for p in source.glob('*.lean')}
    else:
        # Match benchmark_utils.sh:get_all_theorems, including its name boundaries.
        expected = set(re.findall(r'^\s*theorem\s+([^\s:({]+)', source.read_text(), re.M))
    if not expected:
        raise ValueError('no source goals')
    with Path(csv_path).open(newline='') as f:
        reader = csv.DictReader(f)
        headers = ['Benchmark', 'Theorem', 'Statement']
        for tactic in tactics.split(';'):
            headers += [f'{tactic}_time', f'{tactic}_status']
        if reader.fieldnames != headers:
            raise ValueError('unexpected CSV columns')
        seen = set()
        for row in reader:
            name = row['Theorem']
            if None in row or any(value is None for value in row.values()):
                raise ValueError('malformed CSV row')
            if row['Benchmark'] != suite or name not in expected or name in seen:
                raise ValueError(f'unexpected/duplicate goal: {name}')
            seen.add(name)
            for tactic in tactics.split(';'):
                status, time = row[f'{tactic}_status'], row[f'{tactic}_time']
                valid = (status == 'OK' and time.isdigit()) or (status, time) in {
                    ('FAIL', 'fail'), ('TIMEOUT', 'timeout'), ('ENV', 'env')}
                if not valid:
                    raise ValueError(f'invalid result for {name}/{tactic}: {time}|{status}')
        if seen != expected:
            raise ValueError(f'missing {len(expected - seen)} goal(s)')


if __name__ == '__main__':
    try:
        validate(*sys.argv[1:])
    except (OSError, ValueError, csv.Error) as error:
        print(f'Invalid suite output {sys.argv[1]}: {error}', file=sys.stderr)
        sys.exit(1)
