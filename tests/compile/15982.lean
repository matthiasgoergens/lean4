/-!
`IO.getRandomBytes` does not open `/dev/urandom` for a size it rejects, so a rejected call no
longer leaks a file descriptor (#15982). `15982.lean.init.sh` lowers the descriptor limit far
enough that such a leak would exhaust it, and the last call, which opens `/dev/urandom`, would fail.
-/

def main : IO Unit := do
  for _ in [0:1000] do
    try
      discard <| IO.getRandomBytes (USize.ofNat (USize.size - 1))
      IO.println "unexpected success"
    catch _ => pure ()
  IO.println s!"random bytes after rejected sizes: {(← IO.getRandomBytes 8).size}"
