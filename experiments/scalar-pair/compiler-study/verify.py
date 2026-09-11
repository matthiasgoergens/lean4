"""Verify compiler-study result archives without rerunning their workloads."""
import hashlib
import json
import math
import re
import sys
from pathlib import Path

from measure import BYTE, SCALAR, SEEDS, expected_checksums, schedule, summarise

ROOT = Path(__file__).resolve().parent
MODES = ("baseline", "split")
SEMANTIC_NS = (0, 1, 2, 3, 6, 7, 8, 17, 50)
CONTROL_SCALAR_NS = (0, 1, 2, 17, 1000)
CONTROL_BYTE_NS = (0, 1, 17, 256)
CONTROL_BYTE_ROUNDS = (0, 1, 2, 3)
TRANSFORM_MARKER = "splitProd transformed "

TRACE_EXPECTATIONS = {
    "scalar": {
        "positive": ("LoopStudy.idWhile", "LoopStudy.ioWhile", "LoopStudy.tailPair"),
        "negative": ("LoopStudy.tailScalar", "LoopStudy.forUSize", "LoopStudy.whileStruct"),
    },
    "semantics": {
        "positive": ("CompilerStudy.nonTailPair", "CompilerStudy.effectPair",
                      "CompilerStudy.escapingPair", "CompilerStudy.whileBreakContinue",
                      "CompilerStudy.nestedLoops", "CompilerStudy.pair32", "CompilerStudy.pair8"),
        "negative": ("CompilerStudy.mixedObjectPair", "CompilerStudy.multiplePairs",
                      "CompilerStudy.whileEarlyReturn"),
    },
    "byte": {
        "positive": ("CompilerStudy.ByteWork.usizeWhile",),
        "negative": ("CompilerStudy.ByteWork.natWhile", "CompilerStudy.ByteWork.usizeFor",
                      "CompilerStudy.ByteWork.stateWhile"),
    },
}


def close(a, b):
    return math.isclose(a, b, rel_tol=1e-12, abs_tol=1e-12)


def read_json(path):
    return json.loads(path.read_text())


def read_jsonl(path):
    if not path.exists():
        return []
    return [json.loads(line) for line in path.read_text().splitlines()]


def archive_file(root, name):
    candidates = (root / name, root / Path(name).name)
    return next((path for path in candidates if path.is_file()), None)


def parsed_timed(row, errors, label):
    fields = row.get("stdout", "").split()
    if len(fields) != 3:
        errors.append(f"{label}: timed stdout has {len(fields)} fields")
        return dict(row)
    try:
        elapsed, checksum, warmup = map(int, fields)
    except ValueError:
        errors.append(f"{label}: timed stdout is not three integers")
        return dict(row)
    for field, value in (("elapsed_ns", elapsed), ("checksum", checksum),
                         ("warmup_checksum", warmup)):
        if field in row and row[field] != value:
            errors.append(f"{label}: stored {field} disagrees with stdout")
    result = dict(row)
    result.update(elapsed_ns=elapsed, checksum=checksum, warmup_checksum=warmup)
    return result


def check_process_rows(rows, errors, label):
    for index, row in enumerate(rows):
        where = f"{label}[{index}]"
        if row.get("status") != 0:
            errors.append(f"{where}: status is {row.get('status')}")
        if not isinstance(row.get("pid"), int) or row["pid"] <= 0:
            errors.append(f"{where}: invalid pid")
        if not isinstance(row.get("process_wall_ns"), int) or row["process_wall_ns"] < 0:
            errors.append(f"{where}: invalid process wall time")
        if not isinstance(row.get("command"), list) or not row["command"]:
            errors.append(f"{where}: missing command")
        if not isinstance(row.get("stdout"), str) or not isinstance(row.get("stderr"), str):
            errors.append(f"{where}: missing process streams")


def expected_control_keys(kind, variants):
    if kind == "scalar":
        inputs = ((n, 0) for n in CONTROL_SCALAR_NS)
    else:
        inputs = ((n, rounds) for n in CONTROL_BYTE_NS for rounds in CONTROL_BYTE_ROUNDS)
    return {(n, rounds, seed, variant, mode)
            for n, rounds in inputs for seed in SEEDS
            for variant in variants for mode in MODES}


def expected_semantic_keys():
    return {(n, seed, mode) for n in SEMANTIC_NS for seed in SEEDS for mode in MODES}


def compare_key_set(actual, expected, label, errors):
    missing = expected - actual
    extra = actual - expected
    if missing:
        errors.append(f"{label}: missing {len(missing)} rows, e.g. {sorted(missing)[:3]}")
    if extra:
        errors.append(f"{label}: unexpected {len(extra)} rows, e.g. {sorted(extra)[:3]}")


def check_semantics(rows, errors):
    semantic = [row for row in rows if row.get("phase") == "semantics"]
    check_process_rows(semantic, errors, "semantic")
    expected_keys = expected_semantic_keys()
    actual = {(row.get("n"), row.get("seed"), row.get("mode")) for row in semantic}
    compare_key_set(actual, expected_keys, "semantic grid", errors)
    if len(semantic) != len(expected_keys):
        errors.append("semantic process count is incomplete or duplicated")
    grouped = {}
    for row in semantic:
        grouped.setdefault((row.get("n"), row.get("seed")), {})[row.get("mode")] = row
    for key, modes in grouped.items():
        if set(modes) != set(MODES):
            continue
        if modes["baseline"].get("stdout") != modes["split"].get("stdout"):
            errors.append(f"semantic stdout differs for n={key[0]} seed={key[1]}")
    return semantic


def check_controls(rows, kind, variants, metadata, errors):
    controls = [row for row in rows if row.get("phase") == "control"]
    check_process_rows(controls, errors, "control")
    parsed = [parsed_timed(row, errors, f"control[{index}]")
              for index, row in enumerate(controls)]
    expected_keys = expected_control_keys(kind, variants)
    actual = {(row.get("n"), row.get("rounds"), row.get("seed"),
               row.get("variant"), row.get("mode")) for row in parsed}
    compare_key_set(actual, expected_keys, "control grid", errors)
    if len(parsed) != len(expected_keys):
        errors.append("control process count is incomplete or duplicated")
    for index, row in enumerate(parsed):
        if row.get("kind") != kind:
            errors.append(f"control[{index}]: wrong kind")
        if row.get("status") == 0:
            expected = expected_checksums(kind, row.get("n"), row.get("rounds"), row.get("seed"))
            actual_checksum = (row.get("checksum"), row.get("warmup_checksum"))
            if actual_checksum != expected:
                errors.append(f"control[{index}]: checksum mismatch")
            if row.get("elapsed_ns", -1) < 0:
                errors.append(f"control[{index}]: negative elapsed time")
    expected = expected_checksums(kind, metadata["args"]["n"], metadata["args"]["rounds"],
                                  metadata["args"]["value_seed"])
    if tuple(metadata.get("expected_checksums", ())) != expected:
        errors.append("metadata expected_checksums disagrees with the independent oracle")
    return parsed


def check_schedule(root, metadata, variants, errors):
    args = metadata.get("args", {})
    blocks = args.get("blocks")
    seed = args.get("rng_seed")
    if metadata.get("schedule_scheme") != "independent-complete-blocks":
        errors.append(f"unknown schedule scheme: {metadata.get('schedule_scheme')}")
    if not isinstance(blocks, int) or blocks < 1:
        errors.append("invalid block count in metadata")
        return []
    schedule_path = root / "schedule.json"
    if not schedule_path.exists():
        errors.append("missing schedule.json")
        return []
    actual = read_json(schedule_path)
    expected = [[list(pair) for pair in block] for block in schedule(variants, blocks, seed)]
    if actual != expected:
        errors.append("schedule does not match independent shuffles from metadata seed")
    treatments = {(variant, mode) for variant in variants for mode in MODES}
    if len(actual) != blocks:
        errors.append(f"schedule has {len(actual)} blocks, expected {blocks}")
    for index, block in enumerate(actual):
        if set(map(tuple, block)) != treatments or len(block) != len(treatments):
            errors.append(f"schedule block {index} is not one complete treatment permutation")
    return actual


def check_observations(root, metadata, variants, schedule_rows, invocations, errors):
    args = metadata["args"]
    kind = args["kind"]
    blocks = args["blocks"]
    treatments = len(variants) * len(MODES)
    raw = [parsed_timed(row, errors, f"measurement raw[{index}]")
           for index, row in enumerate(invocations) if row.get("phase") == "measurement"]
    observation_rows = read_jsonl(root / "observations.jsonl")
    observations = [parsed_timed(row, errors, f"observation[{index}]")
                    for index, row in enumerate(observation_rows)]
    expected_keys = {(block, position) for block in range(blocks) for position in range(treatments)}
    raw_keys = {(row.get("block"), row.get("position")) for row in raw}
    observation_keys = {(row.get("block"), row.get("position")) for row in observations}
    compare_key_set(raw_keys, expected_keys, "raw measurement positions", errors)
    compare_key_set(observation_keys, expected_keys, "observation positions", errors)
    if len(raw) != blocks * treatments or len(observations) != blocks * treatments:
        errors.append("measurement process count is incomplete")
    check_process_rows(raw, errors, "measurement raw")
    check_process_rows(observations, errors, "observation")
    raw_by_key = {(row.get("block"), row.get("position")): row for row in raw}
    observation_by_key = {(row.get("block"), row.get("position")): row
                          for row in observations}
    compare_fields = ("command", "kind", "variant", "mode", "n", "rounds", "seed", "phase",
                      "block", "position", "pid", "stdout", "stderr", "status",
                      "process_wall_ns", "timed_out", "launch_error")
    for key in expected_keys & raw_by_key.keys() & observation_by_key.keys():
        raw_row = raw_by_key[key]
        observation = observation_by_key[key]
        for field in compare_fields:
            if raw_row.get(field) != observation.get(field):
                errors.append(f"raw/observation mismatch at {key}: {field}")
        for field in ("elapsed_ns", "checksum", "warmup_checksum"):
            if raw_row.get(field) != observation.get(field):
                errors.append(f"parsed raw/observation mismatch at {key}: {field}")
    expected_checksum = expected_checksums(kind, args["n"], args["rounds"], args["value_seed"])
    for index, row in enumerate(observations):
        if row.get("kind") != kind or row.get("n") != args["n"]:
            errors.append(f"observation[{index}]: input does not match metadata")
        if row.get("rounds") != args["rounds"] or row.get("seed") != args["value_seed"]:
            errors.append(f"observation[{index}]: rounds/seed do not match metadata")
        if row.get("status") != 0 or row.get("elapsed_ns", 0) <= 0:
            errors.append(f"observation[{index}]: failed status or non-positive elapsed time")
        if (row.get("checksum"), row.get("warmup_checksum")) != expected_checksum:
            errors.append(f"observation[{index}]: checksum mismatch")
        if row.get("excluded") or row.get("include") is False:
            errors.append(f"observation[{index}]: explicit exclusion found")
        block = row.get("block")
        position = row.get("position")
        if isinstance(block, int) and isinstance(position, int) and block < len(schedule_rows):
            expected_treatment = schedule_rows[block][position] if position < len(schedule_rows[block]) else None
            if expected_treatment != [row.get("variant"), row.get("mode")]:
                errors.append(f"observation[{index}]: schedule treatment mismatch")
    return observations


def compare_summary(actual, expected, errors):
    if set(actual) != set(expected):
        errors.append("summary variants differ from the measurement variants")
        return
    for variant in expected:
        got = actual[variant]
        want = expected[variant]
        if set(got) != set(want):
            errors.append(f"summary fields differ for {variant}")
            continue
        for mode in MODES:
            if not close(got["median_ms"][mode], want["median_ms"][mode]):
                errors.append(f"summary median differs for {variant}/{mode}")
        if len(got["ratios"]) != len(want["ratios"]):
            errors.append(f"summary ratio count differs for {variant}")
        elif any(not close(a, b) for a, b in zip(got["ratios"], want["ratios"])):
            errors.append(f"summary ratios differ for {variant}")
        if not close(got["median_ratio"], want["median_ratio"]):
            errors.append(f"summary median ratio differs for {variant}")
        if len(got["descriptive_95pct"]) != 2 or any(
                not close(a, b) for a, b in zip(got["descriptive_95pct"], want["descriptive_95pct"])):
            errors.append(f"summary bootstrap interval differs for {variant}")


def check_snapshots(root, metadata, errors):
    completed = metadata.get("completed_build")
    if completed is not None:
        success = root / "success.json"
        if not success.exists() or read_json(success) != completed:
            errors.append("completed build manifest differs from archived success marker")
        if completed.get("status") != "complete" or not completed.get("artifacts"):
            errors.append("invalid completed build manifest")
        for name, digest in completed.get("artifacts", {}).items():
            path = archive_file(root, name)
            if path is not None and hashlib.sha256(path.read_bytes()).hexdigest() != digest:
                errors.append(f"completed build hash differs from archived artefact: {name}")
            if name in metadata.get("build_hashes", {}) and metadata["build_hashes"][name] != digest:
                errors.append(f"completed build manifest disagrees with build hash: {name}")
    archived = 0
    for name, digest in metadata.get("snapshot_hashes", {}).items():
        path = archive_file(root, name)
        if path is None:
            errors.append(f"missing archived snapshot: {name}")
            continue
        archived += 1
        actual = hashlib.sha256(path.read_bytes()).hexdigest()
        if actual != digest:
            errors.append(f"snapshot hash mismatch: {name}")

    build_verified = []
    missing_live_binaries = []
    available_live_binary_paths = []
    for name, digest in metadata.get("build_hashes", {}).items():
        path = archive_file(root, name)
        if path is not None:
            actual = hashlib.sha256(path.read_bytes()).hexdigest()
            if actual != digest:
                errors.append(f"build hash does not match archived snapshot: {name}")
            else:
                build_verified.append(name)
            continue
        if name.startswith("build/") and Path(name).suffix not in (".lean", ".py"):
            live = ROOT / name
            if live.exists():
                available_live_binary_paths.append(name)
            else:
                missing_live_binaries.append(name)
            continue
        errors.append(f"missing archived build-input snapshot: {name}")
    return archived, build_verified, available_live_binary_paths, missing_live_binaries


def trace_names(text):
    return [line.split(TRANSFORM_MARKER, 1)[1].strip()
            for line in text.splitlines() if TRANSFORM_MARKER in line]


def preliminary_negative_control_exception(root):
    source = archive_file(root, "Semantics.lean")
    if source is None:
        return None
    fields = re.search(r"structure Box where\n((?:  .*\n)+)", source.read_text())
    if fields is None:
        return None
    declarations = tuple(re.findall(r"^  (\w+)\s*:\s*(.+)$", fields.group(1), re.MULTILINE))
    if declarations == (("value", "UInt64"),):
        return "archived Box has only a UInt64 field, so mixedObjectPair is not an object/scalar negative control"
    return None


def check_coverage(root, metadata, kind, errors):
    unavailable = []
    exceptions = []
    mixed_object_exception = preliminary_negative_control_exception(root)
    if mixed_object_exception:
        exceptions.append(mixed_object_exception)
    trace_kinds = ["semantics", kind]
    seen = set()
    for trace_kind in trace_kinds:
        if trace_kind in seen:
            continue
        seen.add(trace_kind)
        suffix = "" if trace_kind == "scalar" else "-semantics" if trace_kind == "semantics" else "-byte"
        baseline_name = f"baseline{suffix}-mono.txt"
        split_name = f"split{suffix}-mono.txt"
        baseline = archive_file(root, baseline_name)
        split = archive_file(root, split_name)
        if baseline is None or split is None:
            unavailable.append(trace_kind)
            continue
        baseline_transformed = trace_names(baseline.read_text())
        split_transformed = trace_names(split.read_text())
        if baseline_transformed:
            errors.append(f"baseline {trace_kind} trace contains transformations")
        requirements = TRACE_EXPECTATIONS[trace_kind]
        for name in requirements["positive"]:
            if not any(name in actual for actual in split_transformed):
                errors.append(f"expected transformation absent: {name}")
        for name in requirements["negative"]:
            if any(name in actual for actual in split_transformed):
                if name == "CompilerStudy.mixedObjectPair" and mixed_object_exception:
                    exceptions.append(mixed_object_exception)
                else:
                    errors.append(f"negative control transformed: {name}")
    reported = metadata.get("transformed_workers")
    if reported:
        for trace_kind, requirements in TRACE_EXPECTATIONS.items():
            actual = reported.get(trace_kind)
            if actual is None:
                continue
            for name in requirements["positive"]:
                if not any(name in worker for worker in actual):
                    errors.append(f"metadata missing transformation: {name}")
            for name in requirements["negative"]:
                if any(name in worker for worker in actual):
                    if name == "CompilerStudy.mixedObjectPair" and mixed_object_exception:
                        exceptions.append(mixed_object_exception)
                    else:
                        errors.append(f"metadata negative control transformed: {name}")
    return unavailable, sorted(set(exceptions))


def check_commands(root, errors):
    path = root / "commands.json"
    if not path.exists():
        errors.append("missing commands.json")
        return
    commands = read_json(path)
    for index, row in enumerate(commands):
        if row.get("status") != 0:
            errors.append(f"compiler command {index} failed")
        diagnostics = f"{row.get('stdout', '')}\n{row.get('stderr', '')}"
        if re.search(r"\bpanic\b|uncaught exception", diagnostics, re.IGNORECASE):
            errors.append(f"compiler command {index} reported panic or uncaught exception")
        command = [str(part) for part in row.get("command", [])]
        source_files = [part for part in command if part.endswith(".lean")]
        executable = Path(command[0]).name if command else ""
        if executable == "lean" and source_files and Path(source_files[-1]).name != "SplitProd.lean":
            if "-Dcompiler.check=true" not in command:
                errors.append(f"compiler command {index} lacks compiler.check=true")


def verify(root):
    errors = []
    if not root.is_dir():
        return {"path": str(root), "errors": ["result directory does not exist"]}
    metadata_path = root / "metadata.json"
    if not metadata_path.exists():
        return {"path": str(root), "errors": ["missing metadata.json"]}
    metadata = read_json(metadata_path)
    args = metadata.get("args", {})
    kind = args.get("kind")
    variants = SCALAR if kind == "scalar" else BYTE if kind == "byte" else []
    if not variants:
        errors.append(f"unknown campaign kind: {kind}")
    invocations = read_jsonl(root / "invocations.jsonl")
    check_process_rows(invocations, errors, "invocation")
    check_commands(root, errors)
    schedule_rows = check_schedule(root, metadata, variants, errors) if variants else []
    check_semantics(invocations, errors)
    if variants:
        check_controls(invocations, kind, variants, metadata, errors)
    observations = []
    if args.get("controls_only"):
        if (root / "observations.jsonl").exists() or (root / "summary.json").exists():
            errors.append("controls-only archive unexpectedly contains measurements")
    elif variants:
        observations = check_observations(root, metadata, variants, schedule_rows, invocations, errors)
        summary_path = root / "summary.json"
        if not summary_path.exists():
            errors.append("missing summary.json")
        elif not errors:
            expected = summarise(observations, variants, args["rng_seed"] + 100)
            compare_summary(read_json(summary_path), expected, errors)
    archived_snapshots, build_verified, available_live_binary_paths, missing_live_binaries = check_snapshots(
        root, metadata, errors)
    unavailable_coverage, coverage_exceptions = check_coverage(
        root, metadata, kind, errors) if variants else ([], [])
    return {"path": str(root), "kind": kind, "controls_only": bool(args.get("controls_only")),
            "invocations": len(invocations), "observations": len(observations),
            "blocks": args.get("blocks"), "archived_snapshots": archived_snapshots,
            "build_hashes_verified": build_verified,
            "available_live_binary_paths": available_live_binary_paths,
            "missing_live_binaries": missing_live_binaries,
            "coverage_unavailable": unavailable_coverage,
            "coverage_exceptions": coverage_exceptions, "errors": errors}


def main(argv):
    paths = [Path(arg) for arg in argv]
    if not paths:
        paths = sorted(path for path in (ROOT / "results").iterdir() if path.is_dir())
    results = [verify(path) for path in paths]
    print(json.dumps(results, indent=2))
    return 1 if any(result["errors"] for result in results) else 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
