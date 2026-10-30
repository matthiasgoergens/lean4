#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Runs a round of PLAN.md as parallel shards (adapted from the research harness b629463: run.py sits next to this script), then merges them into one run directory.

    shards.py ROUND OUT_DIR BLOCKS_PER_SHARD CPU...

Each shard is one `run.py` over the round's cells (from `cells.py ROUND CPU`), pinned to its
own CPU, so every block still runs every cell once, in a fresh random order, on one CPU; pick CPUs
on distinct physical cores.  The shards write OUT_DIR/shard-CPU/; then OUT_DIR/runs.tsv gets all
their rows, block `b` of the `s`-th shard renumbered `(b - 1) * shards + s`, with a `cpu` column.
Run it from this directory on the benchmark machine.
"""

import csv
import subprocess
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
BENCH = HERE


def main(round: int, out_dir: str, blocks: int, cpus: list[int]) -> None:
    out = Path(out_dir).resolve()
    out.mkdir(parents=True, exist_ok=False)
    procs = []
    for cpu in cpus:
        cells = out / f"cells-{cpu}.json"
        cells.write_text(subprocess.run([str(HERE / "cells.py"), str(round), str(cpu)], check=True,
                                        capture_output=True, text=True).stdout)
        log = open(out / f"shard-{cpu}.err", "w")
        procs.append(subprocess.Popen([str(BENCH / "run.py"), str(cells), str(out / f"shard-{cpu}"),
                                       str(blocks)], cwd=BENCH, stdout=log, stderr=subprocess.STDOUT))
    failed = [cpu for cpu, p in zip(cpus, procs) if p.wait() != 0]
    if failed:
        sys.exit(f"shards on CPUs {failed} failed; see their shard-CPU.err")
    with open(out / "runs.tsv", "w", newline="") as f:
        writer = None
        for s, cpu in enumerate(cpus, start=1):
            with open(out / f"shard-{cpu}" / "runs.tsv") as g:
                for row in csv.DictReader(g, delimiter="\t"):
                    row["block"] = str((int(row["block"]) - 1) * len(cpus) + s)
                    row["cpu"] = str(cpu)
                    if writer is None:
                        writer = csv.DictWriter(f, fieldnames=list(row), delimiter="\t")
                        writer.writeheader()
                    writer.writerow(row)


if __name__ == "__main__":
    main(int(sys.argv[1]), sys.argv[2], int(sys.argv[3]), [int(c) for c in sys.argv[4:]])
