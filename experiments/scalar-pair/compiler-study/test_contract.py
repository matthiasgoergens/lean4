"""Compile positive and deliberately broken must_split_prod contracts."""
import hashlib
import json
import os
from pathlib import Path
import subprocess

import build_state

ROOT = Path(__file__).resolve().parent
BUILD = ROOT / "build"
LEAN = Path.home() / ".elan/toolchains/leanprover--lean4---v4.33.1/bin/lean"
PAIR = """partial def work (n : USize) (s : USize × UInt64) : USize × UInt64 :=
  if s.1 < n then work n (s.1 + 1, s.2 + 7) else s
attribute [must_split_prod] work
"""
WHILE = """@[must_split_prod] def work (n : USize) (seed : UInt64) : UInt64 := Id.run do
  let mut i : USize := 0
  let mut x := seed
  while i < n do
    x := x + i.toUInt64
    i := i + 1
  return x
"""
CASES = {
    "pair": (True, PAIR),
    "while": (True, WHILE),
    "nested": (True, """@[must_split_prod] def work (n : USize) (seed : UInt64) : UInt64 := Id.run do
  let mut i : USize := 0
  let mut x := seed
  while i < n do
    let mut j : USize := 0
    while j < i do
      x := x + j.toUInt64
      j := j + 1
    i := i + 1
  return x
"""),
    "disabled": (False, PAIR),
    "nat_index": (False, WHILE.replace("let mut i : USize", "let mut i : Nat")
                  .replace("while i < n", "while i < n.toNat")),
    "nonrecursive": (False, "@[must_split_prod] def work (x : UInt64) := x + 1\n"),
    "three_fields": (False, """@[must_split_prod] partial def work (n : USize)
    (s : USize × UInt64 × UInt64) : UInt64 :=
  if s.1 < n then work n (s.1 + 1, s.2.1 + 1, s.2.2 + 2) else s.2.1
"""),
    "mixed_object": (False, """@[must_split_prod] partial def work (n : USize)
    (s : String × UInt64) : UInt64 :=
  if n == 0 then s.1.utf8ByteSize.toUInt64 + s.2
  else work (n - 1) (s.1 ++ "a", s.2 + 1)
"""),
    "two_pairs": (False, """@[must_split_prod] partial def work (n : USize)
    (a : USize × UInt64) (b : USize × UInt64) : UInt64 :=
  if a.1 < n then work n (a.1 + 1, a.2 + 1) (b.1 + 1, b.2 + 3)
  else a.2 + b.1.toUInt64 + b.2
"""),
    "unrelated_success": (False, PAIR.replace("work", "other")
                          + "@[must_split_prod] def work (n : USize) := other n (0, 1)\n"),
    "fake_suffix": (False, """namespace work
partial def _splitProd (n : USize) (x : UInt64) : UInt64 :=
  if n == 0 then x else _splitProd (n - 1) (x + 1)
end work
@[must_split_prod] def work (n : USize) := work._splitProd n 0
"""),
    "one_missed_loop": (False, """@[must_split_prod] def work (n : USize) (seed : UInt64) : UInt64 := Id.run do
  let mut i : USize := 0
  let mut x := seed
  while i < n do
    x := x + i.toUInt64
    i := i + 1
  let mut j : Nat := 0
  while j < n.toNat do
    x := x + j.toUInt64
    j := j + 1
  return x
"""),
    "noncomputable": (False, "@[must_split_prod] noncomputable def work : UInt64 := Classical.choice (inferInstance : Nonempty UInt64)\n"),
    "theorem": (False, "@[must_split_prod] theorem work : True := True.intro\n"),
    "imported": (False, "attribute [must_split_prod] Nat.add\n"),
    "prefix_partial": (False, PAIR.replace("partial def", "@[must_split_prod] partial def")
                       .replace("attribute [must_split_prod] work\n", "")),
    "module_deferred": (False, WHILE),
    "private_while": (True, WHILE.replace("] def work", "] private def work")),
    "sync_while": (True, "set_option Elab.async false\n" + WHILE),
}


def main():
    manifest = build_state.validate(ROOT, BUILD)
    env = os.environ.copy()
    env["LEAN_PATH"] = str(ROOT)
    out = BUILD / "contract-tests"
    out.mkdir(exist_ok=True)
    records = []

    def run(command, source=None):
        p = subprocess.run(list(map(str, command)), env=env, capture_output=True,
                           text=True, timeout=60)
        row = {"command": list(map(str, command)), "status": p.returncode,
               "stdout": p.stdout, "stderr": p.stderr, "source": source}
        records.append(row)
        (ROOT / "contract-validation.json").write_text(json.dumps(records, indent=2) + "\n")
        assert "PANIC" not in p.stdout + p.stderr, row
        return row

    module = ROOT / "MustSplitProd.lean"
    row = run([LEAN, f"--o={ROOT / 'MustSplitProd.olean'}", module], module.read_text())
    row["completed_build"] = manifest
    row["test_driver_sha256"] = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    assert row["status"] == 0, row
    for name, (succeeds, source) in CASES.items():
        if name != "prefix_partial" and "@[must_split_prod] partial def" in source:
            source = source.replace("@[must_split_prod] partial def", "partial def")
            source += "\nattribute [must_split_prod] work\n"
        text = ("module\n" if name == "module_deferred" else "") + "import MustSplitProd\n"
        if name != "disabled":
            text += "set_option compiler.splitProd true\n"
        text += source
        path = out / (name + ".lean")
        path.write_text(text)
        row = run([LEAN, "-Dcompiler.check=true", f"--c={out / (name + '.c')}", path], text)
        row["case"] = name
        row["expected_success"] = succeeds
        if succeeds:
            assert row["status"] == 0, row
            row["c_sha256"] = hashlib.sha256((out / (name + ".c")).read_bytes()).hexdigest()
        else:
            expected_error = "cannot import non-`module`" if name == "module_deferred" else "[must_split_prod]"
            assert row["status"] != 0 and expected_error in row["stdout"] + row["stderr"], row
            if name in ("nat_index", "three_fields", "mixed_object", "two_pairs", "one_missed_loop"):
                assert "was not split" in row["stdout"], row
        (ROOT / "contract-validation.json").write_text(json.dumps(records, indent=2) + "\n")
    print(f"{len(CASES)} compiler contract cases passed")


if __name__ == "__main__":
    main()
