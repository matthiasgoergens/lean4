/-
POST loop on one Client: sends a small JSON body (`{"n": 1}`) to http://127.0.0.1:<port>/echo, one
request after another, so all of them share one kept-alive connection, and reads each response's
status and body.  Timeouts are 900 s.  One untimed request comes first; then `calls` timed ones.

Usage: postloop <port> <calls> <reportEvery> [nodelay: 0|1]
Prints a line every `reportEvery` calls: calls done, elapsed wall ms, process CPU ms, RSS kB and open
file descriptors, and at the end the mean wall time per request in microseconds.

With `nodelay` = 1 the Client uses `tcpNoDelay` below, a copy of `Connector.tcp` that also calls
`socket.noDelay` after connecting; nothing else differs.
-/
import Std.Http
import Std.Async.DNS
open Std Http Async Client

def readProc (path : String) : IO String := IO.FS.readFile path

def rssKb : IO Nat := do
  let s ← readProc "/proc/self/status"
  for line in s.splitOn "\n" do
    if line.startsWith "VmRSS:" then
      return ((line.drop 6).trimAscii.toString.takeWhile Char.isDigit).toNat!
  return 0

/-- utime+stime of this process in clock ticks (100 Hz), from /proc/self/stat. -/
def cpuTicks : IO Nat := do
  let s ← readProc "/proc/self/stat"
  -- fields after the ")" of comm: state is field 3; utime is 14, stime 15
  let rest := (s.splitOn ") ").getLast!
  let fs := rest.splitOn " "
  return fs[11]!.toNat! + fs[12]!.toNat!

def fdCount : IO Nat := do
  return (← System.FilePath.readDir "/proc/self/fd").size

def body : String := "{\"n\": 1}"

def callOnce (client : Client) (origin : URI.Origin) : Async (Nat × String) := do
  let req ← Request.post (.originForm (URI.Path.parse? "/echo").get! none)
    |>.json body
  let resp ← client.send origin req
  let text ← resp.text
  return (resp.line.status.toCode.toNat, text)

/-- `Connector.tcp` with one change: TCP_NODELAY set on the socket after connecting. -/
def tcpNoDelay : Connector := fun origin config => do
  let addrs ← try DNS.getAddrInfo (toString origin.host) (toString origin.port)
    catch err => return .error (.connect (toString err))
  let mut lastErr : Error := .connect "no address"
  for ipAddr in addrs do
    let socketAddr : Std.Net.SocketAddress := match ipAddr with
      | .v4 ip => .v4 ⟨ip, origin.port⟩
      | .v6 ip => .v6 ⟨ip, origin.port⟩
    try
      let socket ← TCP.Socket.Client.mk
      socket.connect socketAddr
      socket.noDelay
      return .ok (← Connection.new socket origin config)
    catch err =>
      lastErr := .connect (toString err)
  return .error lastErr

def main (args : List String) : IO Unit := do
  let port := args[0]!.toNat!.toUInt16
  let noDelay := args.getD 3 "0" == "1"
  let calls := args[1]!.toNat!
  let every := args[2]!.toNat!
  let origin : URI.Origin :=
    { scheme := URI.Scheme.ofString! "http", host := .ipv4 (Net.IPv4Addr.ofParts 127 0 0 1), port }
  let t : Timeout := ⟨900000, by decide⟩
  let action : Async Unit := do
    let client ← Client.new { readTimeout := t, requestTimeout := t }
      (connect := if noDelay then tcpNoDelay else Connector.tcp)
    let (st, text) ← callOnce client origin
    IO.println s!"nodelay={if noDelay then 1 else 0} first call: status={st} body={text}"
    let t0 ← IO.monoMsNow
    let c0 ← cpuTicks
    IO.println s!"calls wall_ms cpu_ms rss_kb fds"
    IO.println s!"0 0 0 {← rssKb} {← fdCount}"
    for i in [1:calls+1] do
      let (st, _) ← callOnce client origin
      unless st == 200 do
        throw <| IO.userError s!"call {i}: status {st}"
      if i % every == 0 then
        let t1 ← IO.monoMsNow
        let c1 ← cpuTicks
        IO.println s!"{i} {t1 - t0} {(c1 - c0) * 10} {← rssKb} {← fdCount}"
    let t1 ← IO.monoMsNow
    IO.println s!"mean wall time per request: {(t1 - t0) * 1000 / max calls 1} us"
  try action.block catch e => IO.eprintln s!"error: {e}"; IO.Process.exit 1
