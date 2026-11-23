#!/usr/bin/env python3

import argparse
import json
import os
import resource
import subprocess
import sys
import tempfile
import time
from dataclasses import dataclass
from pathlib import Path


@dataclass
class PerfMetric:
    event: str
    factor: float = 1
    unit: str | None = None


@dataclass
class RusageMetric:
    name: str
    factor: float = 1
    unit: str | None = None


@dataclass
class Result:
    category: str
    value: float
    unit: str | None

    def fmt(self, topic: str) -> str:
        data = {"metric": f"{topic}//{self.category}", "value": self.value}
        if self.unit is not None:
            data["unit"] = self.unit
        return json.dumps(data)


PERF_METRICS = {
    "task-clock": PerfMetric("task-clock", factor=1e-9, unit="s"),
    "instructions": PerfMetric("instructions:u"),
    "cycles": PerfMetric("cycles:u"),
}

PERF_UNITS = {
    "msec": 1e-3,
    "ns": 1e-9,
}

RUSAGE_METRICS = {
    "maxrss": RusageMetric("ru_maxrss", factor=1024, unit="B"),  # KiB on linux
}

# Measured around the command instead of via perf's `duration_time` event, which `perf stat -j`
# reports as 0 in some perf versions (e.g. 7.2.6).
TIME_METRICS = {"wall-clock"}

ALL_METRICS = {**PERF_METRICS, **RUSAGE_METRICS, **{m: None for m in TIME_METRICS}}
DEFAULT_METRICS = set(ALL_METRICS.keys())


def resolve_metrics(metrics: set[str]) -> tuple[set[str], set[str], set[str]]:
    perf = set()
    rusage = set()
    timed = set()
    unknown = set()

    for metric in metrics:
        if metric in PERF_METRICS:
            perf.add(metric)
        elif metric in RUSAGE_METRICS:
            rusage.add(metric)
        elif metric in TIME_METRICS:
            timed.add(metric)
        else:
            unknown.add(metric)

    if unknown:
        raise SystemExit(f"unknown metrics: {', '.join(unknown)}")

    return perf, rusage, timed


@dataclass
class PerfResult:
    value: float
    unit: str


type PerfResults = dict[str, PerfResult]


@dataclass
class MeasureResult:
    perf: PerfResults
    wall_clock: float
    stdout: str
    stderr: str


def is_hybrid_cpu() -> bool:
    """Whether the CPU has several core types, each with its own PMU."""
    devices = Path("/sys/bus/event_source/devices")
    if not devices.is_dir():
        return False
    return sum(1 for pmu in devices.iterdir() if (pmu / "cpus").exists()) > 1


def normalize_hybrid_event(event: str) -> str:
    """
    On a hybrid CPU, perf counts a hardware event once per PMU and reports it as
    `cpu_core/instructions/u`, `cpu_atom/instructions/u` and so on. Map these names
    back to the requested event (`instructions:u`) so that the counts are added up.
    """
    parts = event.split("/")
    if len(parts) != 3:
        return event
    _, name, modifiers = parts
    return f"{name}:{modifiers}" if modifiers else name


def measure_perf(
    cmd: list[str], events: set[str], capture: bool, allow_failure: bool = False
) -> MeasureResult:
    with tempfile.NamedTemporaryFile() as tmp:
        env = os.environ.copy()
        env["LC_ALL"] = "C"  # or perf may output syntactically invalid JSON

        # On NixOS, perf effectively prepends /usr/bin to the PATH, but in this
        # test suite, we often use the PATH to specify the binaries under test.
        # Hence, we reset the PATH inside of perf using env.
        cmd = [
            *("perf", "stat", "-j", "-o", tmp.name),
            # On a hybrid CPU, each PMU counts only while the command runs on its core
            # type, and perf would extrapolate those partial counts to the whole run.
            *(["--no-scale"] if is_hybrid_cpu() else []),
            *(arg for event in sorted(events) for arg in ["-e", event]),
            "--",
            *("env", f"PATH={env['PATH']}"),
            *cmd,
        ]

        # Execute command
        start = time.perf_counter()
        result = subprocess.run(
            cmd, env=env, capture_output=capture, encoding="utf-8", check=False
        )
        wall_clock = time.perf_counter() - start
        if result.returncode != 0 and not allow_failure:
            if capture:
                print(result.stdout, end="", file=sys.stdout)
                print(result.stderr, end="", file=sys.stderr)
            raise SystemExit(result.returncode)

        # Collect results
        perf: PerfResults = {}
        for line in tmp:
            data = json.loads(line)
            if "event" in data and "counter-value" in data:
                # A PMU the command never ran on reports "<not counted>".
                try:
                    value = float(data["counter-value"])
                except ValueError:
                    continue
                event = normalize_hybrid_event(data["event"])
                if event in perf:
                    perf[event].value += value
                else:
                    perf[event] = PerfResult(value=value, unit=data["unit"])

        return MeasureResult(
            perf=perf,
            wall_clock=wall_clock,
            stdout=result.stdout or "",
            stderr=result.stderr or "",
        )


def get_perf_result(perf: PerfResults, metric: str) -> Result:
    info = PERF_METRICS[metric]
    if info.event in perf:
        result = perf[info.event]
    else:
        # Without the corresponding permissions,
        # we only get access to the userspace versions of the counters.
        result = perf[f"{info.event}:u"]

    value = result.value * PERF_UNITS.get(result.unit, info.factor)
    return Result(category=metric, value=value, unit=info.unit)


def get_rusage_result(rusage: resource.struct_rusage, metric: str) -> Result:
    info = RUSAGE_METRICS[metric]
    value = getattr(rusage, info.name) * info.factor
    return Result(category=metric, value=value, unit=info.unit)


def main(
    cmd: list[str],
    output: Path,
    topics: list[str],
    metrics: set[str],
    append: bool = True,
    capture: bool = False,
    allow_failure: bool = False,
) -> tuple[str, str]:
    perf_metrics, rusage_metrics, timed_metrics = resolve_metrics(metrics)
    perf_events = {PERF_METRICS[metric].event for metric in perf_metrics}

    measured = measure_perf(
        cmd, perf_events, capture=capture, allow_failure=allow_failure
    )
    perf = measured.perf
    rusage = resource.getrusage(resource.RUSAGE_CHILDREN)

    results = []
    for metric in perf_metrics:
        results.append(get_perf_result(perf, metric))
    for metric in rusage_metrics:
        results.append(get_rusage_result(rusage, metric))
    if "wall-clock" in timed_metrics:
        results.append(Result(category="wall-clock", value=measured.wall_clock, unit="s"))

    with open(output, "a" if append else "w") as f:
        for result in results:
            f.writelines(f"{result.fmt(topic)}\n" for topic in topics)

    return measured.stdout, measured.stderr


class Args:
    topic: list[str]
    metric: list[str]
    default_metrics: bool
    output: Path
    append: bool
    allow_failure: bool
    cmd: str
    args: list[str]


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Measure resource usage of a command using perf and rusage.",
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    parser.add_argument(
        "--topic",
        "-t",
        action="append",
        default=[],
        help="topic prefix for the metrics",
    )
    parser.add_argument(
        "--metric",
        "-m",
        action="append",
        default=[],
        help=f"metrics to measure. Can be specified multiple times. Available metrics: {', '.join(sorted(ALL_METRICS))}",
    )
    parser.add_argument(
        "--default-metrics",
        "-d",
        action="store_true",
        help=f"measure a default set of metrics: {', '.join(sorted(DEFAULT_METRICS))}",
    )
    parser.add_argument(
        "--output",
        "-o",
        type=Path,
        default=Path() / "measurements.jsonl",
        help="output file to write measurements to, in the JSON Lines format",
    )
    parser.add_argument(
        "--append",
        "-a",
        action="store_true",
        help="append to the output file instead of overwriting it",
    )
    parser.add_argument(
        "--allow-failure",
        "-F",
        action="store_true",
        help="record measurements even if the measured command exits with a non-zero status",
    )
    parser.add_argument(
        "cmd",
        help="command to measure the resource usage of",
    )
    parser.add_argument(
        "args",
        nargs="*",
        default=[],
        help="arguments to pass to the command",
    )
    args = parser.parse_args(namespace=Args())

    metrics = set(args.metric)
    if args.default_metrics:
        metrics |= DEFAULT_METRICS

    main(
        cmd=[args.cmd] + args.args,
        output=args.output,
        topics=args.topic,
        metrics=metrics,
        append=args.append,
        allow_failure=args.allow_failure,
    )
