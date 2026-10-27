/-!
When `fdopen` fails, `IO.FS.Handle.mk` closes the descriptor it opened, and `IO.FS.createTempFile`
returns the error instead of a handle without a stream, closing the descriptor and removing the
file (#16009). `16009.lean.init.sh` makes every `fdopen` fail with `ENOMEM` and points `TMPDIR` at
a directory of this test's own.
-/

/-- Open descriptors, from `/proc` (fault injection runs on Linux only). -/
def openFds : IO Nat := return (← System.FilePath.readDir "/proc/self/fd").size

def main : IO Unit := do
  -- A failed run, such as a crash in `createTempFile`, leaves the directory behind.
  if ← System.FilePath.pathExists "_tmp_16009" then IO.FS.removeDirAll "_tmp_16009"
  IO.FS.createDirAll "_tmp_16009"
  let before ← openFds
  for _ in [0:100] do
    try
      discard <| IO.FS.Handle.mk "16009.lean" .read
      IO.println "Handle.mk: unexpected success"
    catch _ => pure ()
  try
    discard <| IO.FS.createTempFile
    IO.println "createTempFile: unexpected success"
  catch e => IO.println s!"createTempFile: {e}"
  IO.println s!"descriptors left open: {(← openFds) - before}"
  IO.println s!"files left in TMPDIR: {(← System.FilePath.readDir "_tmp_16009").size}"
  IO.FS.removeDirAll "_tmp_16009"
