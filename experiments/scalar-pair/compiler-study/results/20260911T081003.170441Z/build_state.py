"""Admission marker and persistent diagnostics for serial build attempts."""
import hashlib
import json
import time


def begin(build):
    build.mkdir(parents=True, exist_ok=True)
    # Invalidate admission before touching any shared build output.
    (build / "success.json").unlink(missing_ok=True)
    attempt = build / "attempts" / str(time.time_ns())
    attempt.mkdir(parents=True)
    return attempt


def record(build, attempt, commands):
    data = json.dumps(commands, indent=2) + "\n"
    (attempt / "commands.json").write_text(data)
    (build / "commands.json").write_text(data)


def publish(root, build, attempt, paths):
    manifest = {"status": "complete", "attempt": str(attempt.relative_to(root)),
                "artifacts": {str(p.relative_to(root)): hashlib.sha256(p.read_bytes()).hexdigest()
                              for p in paths}}
    data = json.dumps(manifest, indent=2) + "\n"
    (attempt / "success.json").write_text(data)
    temporary = build / "success.pending.json"
    temporary.write_text(data)
    temporary.replace(build / "success.json")


def validate(root, build):
    path = build / "success.json"
    if not path.exists():
        raise RuntimeError("no completed build admission marker; rebuild first")
    manifest = json.loads(path.read_text())
    if manifest.get("status") != "complete" or not manifest.get("artifacts"):
        raise RuntimeError("invalid build admission marker")
    for relative, expected in manifest["artifacts"].items():
        path = root / relative
        if not path.is_file() or hashlib.sha256(path.read_bytes()).hexdigest() != expected:
            raise RuntimeError(f"completed build artefact changed: {relative}; rebuild first")
    return manifest
