import io
import json
import unittest
from unittest.mock import Mock, patch

import measure


class Measurement(unittest.TestCase):
    def test_worker_names_require_complete_components(self):
        self.assertFalse(measure.matches_worker("LoopStudy.tailPair", "LoopStudy.tailPairReturn"))
        self.assertTrue(measure.matches_worker("LoopStudy.tailPair", "LoopStudy.tailPair"))
        self.assertTrue(measure.matches_worker(
            "LoopStudy.idWhile",
            "_private.Init.While.0.repeatM.erased._at_.LoopStudy.idWhile.spec_0._redArg"))

    def test_independent_blocks_have_stable_prefix_and_complete_treatments(self):
        short = measure.schedule(measure.BYTE, 3, 1234)
        self.assertEqual(short, measure.schedule(measure.BYTE, 17, 1234)[:3])
        expected = {(v, m) for v in measure.BYTE for m in ("baseline", "split")}
        for block in short:
            self.assertEqual(set(block), expected)
            self.assertEqual(len(block), len(expected))

    def test_checksum_failure_preserves_raw_evidence(self):
        log = io.StringIO()
        p = Mock(pid=12, returncode=0)
        p.communicate.return_value = ("10 2 1", "")
        with patch.object(measure.subprocess, "Popen", return_value=p):
            with self.assertRaises(RuntimeError):
                measure.timed("scalar", "id-while", "split", 0, 0, 1, (1, 1), log)
        self.assertEqual(json.loads(log.getvalue())["stdout"], "10 2 1")

    def test_nonzero_process_preserves_diagnostic(self):
        log = io.StringIO()
        p = Mock(pid=12, returncode=5)
        p.communicate.return_value = ("", "failure")
        with patch.object(measure.subprocess, "Popen", return_value=p):
            with self.assertRaises(RuntimeError):
                measure.invoke(["missing"], log)
        self.assertEqual(json.loads(log.getvalue())["stderr"], "failure")

    def test_zero_rounds_and_empty_buffer_still_have_distinct_semantics(self):
        seed = measure.MASK
        self.assertEqual(measure.expected_checksums("byte", 256, 0, seed), (seed, seed))
        one_round = seed ^ (seed >> 33)
        self.assertEqual(measure.expected_checksums("byte", 0, 1, seed), (one_round, seed))


if __name__ == "__main__":
    unittest.main()
