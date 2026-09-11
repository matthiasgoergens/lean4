import json
from pathlib import Path
import tempfile
import unittest

import build_state


class BuildAdmissionTests(unittest.TestCase):
    def test_failed_retry_invalidates_old_binaries_and_keeps_diagnostics(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            build = root / "build"
            first = build_state.begin(build)
            binary = build / "binary"
            binary.write_bytes(b"old executable")
            build_state.record(build, first, [{"status": 0}])
            build_state.publish(root, build, first, [binary, build / "commands.json"])
            build_state.validate(root, build)
            second = build_state.begin(build)
            build_state.record(build, second, [{"status": 1, "stderr": "failed rebuild"}])
            with self.assertRaisesRegex(RuntimeError, "no completed build"):
                build_state.validate(root, build)
            self.assertEqual(json.loads((first / "commands.json").read_text()), [{"status": 0}])
            self.assertEqual(binary.read_bytes(), b"old executable")
            third = build_state.begin(build)
            self.assertNotEqual(second, third)
            self.assertIn("failed rebuild", (second / "commands.json").read_text())

    def test_changed_binary_trace_or_commands_revokes_admission(self):
        for name in ("binary", "trace", "commands.json"):
            with self.subTest(name=name), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                build = root / "build"
                attempt = build_state.begin(build)
                paths = [build / part for part in ("binary", "trace", "commands.json")]
                for path in paths:
                    path.write_bytes(b"verified")
                build_state.publish(root, build, attempt, paths)
                (build / name).write_bytes(b"changed")
                with self.assertRaisesRegex(RuntimeError, "artefact changed"):
                    build_state.validate(root, build)


if __name__ == "__main__":
    unittest.main()
