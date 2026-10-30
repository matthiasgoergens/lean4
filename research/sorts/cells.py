#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.12"
# ///
"""Writes the cells of a round of PLAN.md, for bench/run.py, to standard output.

    cells.py ROUND CPU
"""

import json
import sys

PATTERNS = ["random", "dups4", "dupsqrt", "constant", "sorted", "reversed", "organ", "nearly",
            "tripledesc", "pathological", "runs2", "runs16", "sortedtail"]
ALGOS = ["core", "threeway", "merge", "pdq"]
LEAN = "../sorts/.lake/build/bin/sorts"
GO = "../sorts/go/sortref"


def main(round: int, cpu: int) -> None:
    cells = []

    def add(workload: str, impl: str, argv: list[str]) -> None:
        cells.append({"workload": workload, "impl": impl, "argv": argv, "cpus": [cpu]})

    if round in (2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 101, 102, 103, 104):
        {2: round2, 3: round3, 4: round4, 5: round5, 6: round6, 7: round7, 8: round8,
         9: round9, 10: round10, 11: round11, 12: round12, 101: partition1,
         102: partition2, 103: partition3,
         104: partition4}[round](add)
        json.dump(cells, sys.stdout, indent=1)
        return
    for typ in ["nat", "str", "u64"]:
        for pat in PATTERNS:
            for algo in ALGOS:
                add(f"{typ}-{pat}-100000", algo, [LEAN, algo, typ, pat, "100000"])
    for typ in ["nat", "str"]:
        for algo in ALGOS:
            add(f"{typ}-random-1000000", algo, [LEAN, algo, typ, "random", "1000000"])
    for algo in ALGOS:
        add("u64-random-6250000", algo, [LEAN, algo, "u64", "random", "6250000"])
    for pat in PATTERNS:
        add(f"nat-{pat}-100000", "go", [GO, "pdq", "nat", pat, "100000"])
    json.dump(cells, sys.stdout, indent=1)


RUNS = ["runs4", "runs64", "runs256", "blocks2", "blocks16", "blocks256", "headsqrt"]


def round2(add) -> None:
    """The adaptive front end against pdqsort alone, with core's merge sort for reference.  Current
    `qsort` is left out except at the gate: it is quadratic on several of these patterns."""
    algos = ["pdq", "adaptive", "merge"]
    for typ in ["nat", "str"]:
        for pat in PATTERNS + RUNS:
            for algo in algos:
                add(f"{typ}-{pat}-100000", algo, [LEAN, algo, typ, pat, "100000"])
        for pat in ["random", "runs2", "runs16", "sortedtail", "nearly", "organ"] + RUNS:
            for algo in algos:
                add(f"{typ}-{pat}-1000000", algo, [LEAN, algo, typ, pat, "1000000"])
    for algo in ["core", "pdq", "adaptive"]:
        add("u64-random-6250000", algo, [LEAN, algo, "u64", "random", "6250000"])


def round3(add) -> None:
    """Fresh data for the run-count limits drawn from round two, over more types, sizes and small
    arrays.  Current `qsort` only where it is not quadratic."""
    algos = ["pdq", "onerun", "fewruns4", "fewruns8", "adaptive", "merge"]
    patterns = PATTERNS + RUNS + ["ninther"]
    for typ in ["nat", "str", "rec", "u64"]:
        for pat in patterns:
            for algo in algos:
                add(f"{typ}-{pat}-100000", algo, [LEAN, algo, typ, pat, "100000"])
        add(f"{typ}-random-100000", "core", [LEAN, "core", typ, "random", "100000"])
    for typ in ["nat", "rec"]:
        for pat in ["random", "dups4", "sorted", "nearly", "runs2", "runs4", "runs16", "blocks2",
                    "blocks16", "blocks256", "sortedtail", "organ", "headsqrt"]:
            for algo in algos:
                add(f"{typ}-{pat}-1000000", algo, [LEAN, algo, typ, pat, "1000000"])
    for chunk in ["8", "32", "256", "4096"]:
        for pat in ["random", "sorted", "dups4"]:
            for algo in ["core", "pdq", "onerun", "fewruns4", "merge"]:
                add(f"nat-{pat}-1000000-chunk{chunk}", algo, [LEAN, algo, "nat", pat, "1000000", chunk])
    for algo in ["core", "pdq", "onerun", "fewruns4"]:
        add("nat-random-10000000", algo, [LEAN, algo, "nat", "random", "10000000"])
        add("u64-random-6250000", algo, [LEAN, algo, "u64", "random", "6250000"])


def round4(add) -> None:
    """Why pdq loses wall time to core on random keys: the lab variants of `PdqLab`, unchecked
    (hashes are compared across algorithms instead)."""
    for algo in ["core", "pdq", "lab-base", "lab-c24", "lab-lomuto", "lab-lomuto-c24"]:
        add("u64-random-6250000", algo, [LEAN, algo, "u64", "random", "6250000", "0", "nocheck"])
        add("nat-random-1000000", algo, [LEAN, algo, "nat", "random", "1000000", "0", "nocheck"])
        add("rec-random-1000000", algo, [LEAN, algo, "rec", "random", "1000000", "0", "nocheck"])


def round5(add) -> None:
    """Regressions of the one-directional partition with a cutoff of 24 against pdq, on every
    pattern; the cutoff alone separates the two changes.  Unchecked runs (hashes compared)."""
    algos = ["pdq", "lab-lomuto-c24", "lab-c24"]
    patterns = PATTERNS + RUNS + ["ninther"]
    nc = ["0", "nocheck"]
    for typ in ["nat", "str", "rec", "u64"]:
        for pat in patterns:
            for algo in algos:
                add(f"{typ}-{pat}-100000", algo, [LEAN, algo, typ, pat, "100000"] + nc)
    for typ in ["nat", "rec"]:
        for pat in ["random", "dups4", "sorted", "nearly", "organ", "runs16", "sortedtail", "blocks16"]:
            for algo in algos:
                add(f"{typ}-{pat}-1000000", algo, [LEAN, algo, typ, pat, "1000000"] + nc)
    for chunk in ["8", "32", "256"]:
        for pat in ["random", "sorted"]:
            for algo in algos + ["core"]:
                add(f"nat-{pat}-1000000-chunk{chunk}", algo, [LEAN, algo, "nat", pat, "1000000", chunk, "nocheck"])
    for algo in algos + ["core"]:
        add("u64-random-6250000", algo, [LEAN, algo, "u64", "random", "6250000"] + nc)


SHUFFLED = ["../sorts/shuffled.sh", "../sorts-bins/current"]


def round6(add) -> None:
    """Round four's and five's main comparisons with code layout sampled: every run picks one of
    the shuffled builds in sorts-bins/current at random.  Unchecked runs (hashes compared)."""
    nc = ["0", "nocheck"]
    for algo in ["core", "pdq", "lab-c24", "lab-lomuto-c24"]:
        add("u64-random-6250000", algo, SHUFFLED + [algo, "u64", "random", "6250000"] + nc)
        add("nat-random-1000000", algo, SHUFFLED + [algo, "nat", "random", "1000000"] + nc)
        add("rec-random-1000000", algo, SHUFFLED + [algo, "rec", "random", "1000000"] + nc)
        add("str-random-100000", algo, SHUFFLED + [algo, "str", "random", "100000"] + nc)
    for algo in ["pdq", "lab-c24", "lab-lomuto-c24"]:
        for typ, pat in [("u64", "sorted"), ("u64", "constant"), ("nat", "runs16"), ("nat", "nearly")]:
            add(f"{typ}-{pat}-100000", algo, SHUFFLED + [algo, typ, pat, "100000"] + nc)


def round7(add) -> None:
    """The insertion-sort cutoff, swept with code layout sampled.  Unchecked runs."""
    nc = ["0", "nocheck"]
    algos = ["core", "pdq"] + [f"lab-c{c}" for c in (16, 20, 24, 32, 48)]
    for algo in algos:
        add("u64-random-6250000", algo, SHUFFLED + [algo, "u64", "random", "6250000"] + nc)
        add("nat-random-1000000", algo, SHUFFLED + [algo, "nat", "random", "1000000"] + nc)
        add("rec-random-1000000", algo, SHUFFLED + [algo, "rec", "random", "1000000"] + nc)
        add("str-random-100000", algo, SHUFFLED + [algo, "str", "random", "100000"] + nc)
        add("nat-random-1000000-chunk32", algo, SHUFFLED + [algo, "nat", "random", "1000000", "32", "nocheck"])
    for algo in algos[1:]:
        for typ, pat in [("nat", "runs16"), ("nat", "nearly"), ("nat", "dups4"), ("rec", "organ")]:
            add(f"{typ}-{pat}-100000", algo, SHUFFLED + [algo, typ, pat, "100000"] + nc)


def round8(add) -> None:
    """Why pdq is slower than core on random keys, by CPU time (analyse_cpu.py): lab variants that
    each change one suspect, with `none` as the per-block baseline, layout sampled."""
    nc = ["0", "nocheck"]
    algos = ["none", "core", "pdq", "lab-c24", "lab:m3", "lab:nochild", "lab:c24,m3,nochild",
             "lab-lomuto", "lab-lomuto-c24"]
    for algo in algos:
        add("u64-random-6250000", algo, SHUFFLED + [algo, "u64", "random", "6250000"] + nc)
        add("nat-random-1000000", algo, SHUFFLED + [algo, "nat", "random", "1000000"] + nc)
        add("rec-random-1000000", algo, SHUFFLED + [algo, "rec", "random", "1000000"] + nc)


def round9(add) -> None:
    """The hybrid partition choice against pdq, the one-directional partition and core: random keys
    and the shapes where the one-directional partition lost.  `none` in every workload, so both
    wall time (analyse.py) and CPU time (analyse_cpu.py) can be analysed; layout sampled."""
    nc = ["0", "nocheck"]
    algos = ["none", "core", "pdq", "lab:hyb", "lab:hyb,c24", "lab-lomuto-c24"]
    for algo in algos:
        add("u64-random-6250000", algo, SHUFFLED + [algo, "u64", "random", "6250000"] + nc)
        add("nat-random-1000000", algo, SHUFFLED + [algo, "nat", "random", "1000000"] + nc)
        add("rec-random-1000000", algo, SHUFFLED + [algo, "rec", "random", "1000000"] + nc)
    for algo in [a for a in algos if a != "core"]:
        for typ in ["nat", "rec"]:
            for pat in ["runs4", "runs16", "runs64", "nearly", "organ", "sortedtail", "sorted",
                        "reversed", "blocks16", "dups4", "ninther"]:
                add(f"{typ}-{pat}-100000", algo, SHUFFLED + [algo, typ, pat, "100000"] + nc)


def round10(add) -> None:
    """The partition candidates against each other, all with cutoff 24: pdq's scalar two-ended
    scan, the one-directional loop with and without branches, the block partition, and the hybrid
    with the branch-free loop.  `none` in every workload; layout sampled."""
    nc = ["0", "nocheck"]
    algos = ["none", "pdq", "lab-c24", "lab:lomuto,c24", "lab:lomuto,bl,c24", "lab:block,c24",
             "lab:hyb,bl,c24"]
    for algo in algos + ["core"]:
        add("u64-random-6250000", algo, SHUFFLED + [algo, "u64", "random", "6250000"] + nc)
        add("nat-random-1000000", algo, SHUFFLED + [algo, "nat", "random", "1000000"] + nc)
        add("rec-random-1000000", algo, SHUFFLED + [algo, "rec", "random", "1000000"] + nc)
    for algo in algos:
        for typ in ["nat", "rec"]:
            for pat in ["runs4", "runs16", "runs64", "nearly", "organ", "sortedtail", "ninther"]:
                add(f"{typ}-{pat}-100000", algo, SHUFFLED + [algo, typ, pat, "100000"] + nc)


def round11(add) -> None:
    """Production pdq (cutoff 24) against core on random keys, layout sampled; `none` for the CPU
    analysis.  Confirmatory."""
    nc = ["0", "nocheck"]
    for algo in ["none", "core", "pdq"]:
        add("u64-random-6250000", algo, SHUFFLED + [algo, "u64", "random", "6250000"] + nc)
        add("nat-random-1000000", algo, SHUFFLED + [algo, "nat", "random", "1000000"] + nc)
        add("rec-random-1000000", algo, SHUFFLED + [algo, "rec", "random", "1000000"] + nc)
        add("str-random-1000000", algo, SHUFFLED + [algo, "str", "random", "1000000"] + nc)


def partition1(add) -> None:
    """Partition round one (research/partition/NOTES.md): the branch-free
    one-directional loop with breakPatterns over all three ninther groups, alone and in the hybrid,
    against pdq, its scan with cutoff 24, the plain branch-free loop, and core on random keys.
    `none` in every workload; layout sampled."""
    nc = ["0", "nocheck"]
    algos = ["none", "pdq", "lab-c24", "lab:lomuto,bl,c24", "lab:lomuto,bl,c24,brk9",
             "lab:hyb,bl,c24,brk9"]
    for algo in algos + ["core"]:
        add("u64-random-6250000", algo, SHUFFLED + [algo, "u64", "random", "6250000"] + nc)
        add("nat-random-1000000", algo, SHUFFLED + [algo, "nat", "random", "1000000"] + nc)
        add("rec-random-1000000", algo, SHUFFLED + [algo, "rec", "random", "1000000"] + nc)
    for algo in algos:
        for typ in ["nat", "rec"]:
            for pat in ["runs4", "runs5", "runs16", "runs64", "nearly", "organ", "sortedtail",
                        "ninther"]:
                add(f"{typ}-{pat}-100000", algo, SHUFFLED + [algo, typ, pat, "100000"] + nc)


def partition2(add) -> None:
    """Partition round two: pdq's scans from both ends with the branch-free loop between
    (`ends`), with breakPatterns over all three ninther groups, with and without C++ pdqsort's
    rule for the partial insertion sort (`nochild`), against round one's hybrid, pdq, its scan
    with cutoff 24, and core on random keys.  `none` in every workload; layout sampled."""
    nc = ["0", "nocheck"]
    algos = ["none", "pdq", "lab-c24", "lab:hyb,bl,c24,brk9", "lab:lomuto,ends,c24,brk9",
             "lab:lomuto,ends,c24,brk9,nochild"]
    for algo in algos + ["core"]:
        add("u64-random-6250000", algo, SHUFFLED + [algo, "u64", "random", "6250000"] + nc)
        add("nat-random-1000000", algo, SHUFFLED + [algo, "nat", "random", "1000000"] + nc)
        add("rec-random-1000000", algo, SHUFFLED + [algo, "rec", "random", "1000000"] + nc)
    for algo in algos:
        for typ in ["nat", "rec"]:
            for pat in ["runs4", "runs5", "runs16", "runs64", "nearly", "organ", "sortedtail",
                        "ninther"]:
                add(f"{typ}-{pat}-100000", algo, SHUFFLED + [algo, typ, pat, "100000"] + nc)
        for pat in ["nearly", "ninther", "runs5"]:
            add(f"nat-{pat}-1000000", algo, SHUFFLED + [algo, "nat", pat, "1000000"] + nc)


def round12(add) -> None:
    """Confirmatory: the partition research's two candidates against pdq (cutoff 24) and core, on
    every pattern, four types, small arrays and the gate case.  Layout sampled; `none` in the
    random-key workloads for the CPU analysis."""
    nc = ["0", "nocheck"]
    cands = ["lab:lomuto,ends,c24,brk9", "lab:lomuto,ends,c24,brk9,nochild"]
    patterns = PATTERNS + RUNS + ["ninther", "runs5", "runs6", "runs8", "runs12"]
    for algo in ["none", "core", "pdq"] + cands:
        add("u64-random-6250000", algo, SHUFFLED + [algo, "u64", "random", "6250000"] + nc)
        for typ in ["nat", "rec", "str"]:
            add(f"{typ}-random-1000000", algo, SHUFFLED + [algo, typ, "random", "1000000"] + nc)
    for algo in ["pdq"] + cands:
        for typ in ["nat", "rec", "u64", "str"]:
            for pat in patterns:
                add(f"{typ}-{pat}-100000", algo, SHUFFLED + [algo, typ, pat, "100000"] + nc)
        for pat in ["nearly", "ninther", "runs5", "runs16", "organ", "sortedtail"]:
            add(f"nat-{pat}-1000000", algo, SHUFFLED + [algo, "nat", pat, "1000000"] + nc)
    for algo in ["core", "pdq"] + cands:
        for chunk in ["8", "32", "256"]:
            add(f"nat-random-1000000-chunk{chunk}", algo,
                SHUFFLED + [algo, "nat", "random", "1000000", chunk, "nocheck"])


def partition3(add) -> None:
    """Partition round three: round twelve's workloads for pdq, core and two variants of the end-scan
    candidate with the partial insertion sort's early exit at block boundaries (`pisx`), one also
    with the flip-count choice of pdq's loop for blocky middles (`pred`), plus small odd run
    counts.  Layout sampled; `none` in the random-key workloads."""
    nc = ["0", "nocheck"]
    cands = ["lab:lomuto,ends,c24,brk9,pisx", "lab:lomuto,ends,c24,brk9,pisx,pred"]
    patterns = PATTERNS + RUNS + ["ninther", "runs5", "runs6", "runs8", "runs12", "runs3", "runs7",
                                  "runs9", "runs11"]
    for algo in ["none", "core", "pdq"] + cands:
        add("u64-random-6250000", algo, SHUFFLED + [algo, "u64", "random", "6250000"] + nc)
        for typ in ["nat", "rec", "str"]:
            add(f"{typ}-random-1000000", algo, SHUFFLED + [algo, typ, "random", "1000000"] + nc)
    for algo in ["pdq"] + cands:
        for typ in ["nat", "rec", "u64", "str"]:
            for pat in patterns:
                add(f"{typ}-{pat}-100000", algo, SHUFFLED + [algo, typ, pat, "100000"] + nc)
        for pat in ["nearly", "ninther", "runs5", "runs16", "organ", "sortedtail", "runs3", "runs9"]:
            add(f"nat-{pat}-1000000", algo, SHUFFLED + [algo, "nat", pat, "1000000"] + nc)
    for algo in ["core", "pdq"] + cands:
        for chunk in ["8", "32", "256"]:
            add(f"nat-random-1000000-chunk{chunk}", algo,
                SHUFFLED + [algo, "nat", "random", "1000000", chunk, "nocheck"])


def partition4(add) -> None:
    """Partition round four: as round three, with the six-element test of the partial insertion
    sort's early exit (`pisx6`) and the flip threshold at 6 or 8, plus the break-it review's nearly
    sorted inputs with more swaps (`nearlyK`)."""
    nc = ["0", "nocheck"]
    cands = ["lab:lomuto,ends,c24,brk9,pisx6,pred6", "lab:lomuto,ends,c24,brk9,pisx6,pred8"]
    patterns = PATTERNS + RUNS + ["ninther", "runs5", "runs6", "runs8", "runs12", "runs3", "runs7",
                                  "runs9", "runs11", "nearly100", "nearly500", "nearly2000",
                                  "nearly5000"]
    for algo in ["none", "core", "pdq"] + cands:
        add("u64-random-6250000", algo, SHUFFLED + [algo, "u64", "random", "6250000"] + nc)
        for typ in ["nat", "rec", "str"]:
            add(f"{typ}-random-1000000", algo, SHUFFLED + [algo, typ, "random", "1000000"] + nc)
    for algo in ["pdq"] + cands:
        for typ in ["nat", "rec", "u64", "str"]:
            for pat in patterns:
                add(f"{typ}-{pat}-100000", algo, SHUFFLED + [algo, typ, pat, "100000"] + nc)
        for pat in ["nearly", "ninther", "runs5", "runs16", "organ", "sortedtail", "runs3", "runs9",
                    "nearly2000"]:
            add(f"nat-{pat}-1000000", algo, SHUFFLED + [algo, "nat", pat, "1000000"] + nc)
    for algo in ["core", "pdq"] + cands:
        for chunk in ["8", "32", "256"]:
            add(f"nat-random-1000000-chunk{chunk}", algo,
                SHUFFLED + [algo, "nat", "random", "1000000", chunk, "nocheck"])


if __name__ == "__main__":
    main(int(sys.argv[1]), int(sys.argv[2]))
