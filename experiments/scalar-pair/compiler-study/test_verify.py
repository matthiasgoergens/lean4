import hashlib
import json
import tempfile
import unittest
from pathlib import Path

import measure
import verify


class VerifierCorruptionTests(unittest.TestCase):
    def test_stored_timed_fields_must_match_stdout(self):
        errors = []
        verify.parsed_timed(
            {"stdout": "10 20 30\n", "elapsed_ns": 11, "checksum": 20,
             "warmup_checksum": 30},
            errors, "row")
        self.assertTrue(any("stored elapsed_ns" in error for error in errors))

    def test_compiler_panic_is_rejected_even_with_zero_status(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "commands.json").write_text(json.dumps([{
                "command": ["lean", "Kernels.lean"],
                "status": 0,
                "stdout": "PANIC: unexpected compiler failure",
                "stderr": "",
            }]))
            errors = []
            verify.check_commands(root, errors)
            self.assertTrue(any("panic or uncaught exception" in error for error in errors))

    def test_missing_and_tampered_snapshots_are_rejected(self):
        digest = hashlib.sha256(b"expected").hexdigest()
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            metadata = {"snapshot_hashes": {"missing.txt": digest}, "build_hashes": {}}
            errors = []
            verify.check_snapshots(root, metadata, errors)
            self.assertTrue(any("missing archived snapshot" in error for error in errors))

        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "snapshot.txt").write_text("tampered")
            metadata = {"snapshot_hashes": {"snapshot.txt": digest}, "build_hashes": {}}
            errors = []
            verify.check_snapshots(root, metadata, errors)
            self.assertTrue(any("snapshot hash mismatch" in error for error in errors))

    def test_wrong_schedule_is_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            metadata = {"args": {"kind": "scalar", "blocks": 1, "rng_seed": 7},
                        "schedule_scheme": "independent-complete-blocks"}
            (root / "schedule.json").write_text(json.dumps([[["wrong", "baseline"]]]))
            errors = []
            verify.check_schedule(root, metadata, measure.SCALAR, errors)
            self.assertTrue(any("schedule does not match" in error for error in errors))

    def test_missing_control_and_measurement_rows_are_rejected(self):
        metadata = {"args": {"kind": "scalar", "n": 0, "rounds": 0,
                              "value_seed": 0}}
        control_errors = []
        verify.check_controls([], "scalar", measure.SCALAR, metadata, control_errors)
        self.assertTrue(any("control grid" in error for error in control_errors))
        self.assertTrue(any("control process count" in error for error in control_errors))

        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            metadata["args"]["blocks"] = 1
            observation_errors = []
            verify.check_observations(root, metadata, measure.SCALAR,
                                      verify.schedule(measure.SCALAR, 1, 7), [],
                                      observation_errors)
            self.assertTrue(any("measurement positions" in error
                                for error in observation_errors))
            self.assertTrue(any("measurement process count" in error
                                for error in observation_errors))

    def test_old_box_source_reports_preliminary_negative_control_limitation(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            (root / "Semantics.lean").write_text(
                "namespace CompilerStudy\n\nstructure Box where\n  value : UInt64\n")
            errors = []
            unavailable, exceptions = verify.check_coverage(
                root, {"args": {"kind": "scalar"}, "transformed_workers": {}},
                "scalar", errors)
            self.assertIn("semantics", unavailable)
            self.assertTrue(any("only a UInt64 field" in exception for exception in exceptions))
            self.assertEqual(errors, [])


if __name__ == "__main__":
    unittest.main()
