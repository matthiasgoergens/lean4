/- Prints what Std.Async.DNS.getAddrInfo returns, as Connector.tcp calls it (host, port string, no
family hint).  Usage: dns <host> [<host> ...] -/
import Std.Async.DNS
open Std Async

def main (args : List String) : IO Unit := do
  for h in args do
    let r ← (do
      let addrs ← DNS.getAddrInfo h "18080"
      pure (toString (addrs.toList.map fun
        | .v4 a => s!"v4 {a}" | .v6 a => s!"v6 {a}"))
      : Async String).block
    IO.println s!"{h}: {r}"
