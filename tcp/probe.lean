/-
General probe client for Std.Http.Client over real TCP.

Usage: probe url=http://host:port/path [key=value ...]
  method=GET|POST|HEAD|PUT|...     body=<string> (sent as application/json via Request.Builder.json)
  authz=<Authorization value>      cookie=<Cookie value>    hdr=<name:value> (one extra header)
  readbody=1|0|close|stream (read it whole, leave it, close it unread, stream and discard)
  n=<repeat count>          gap=<ms sleep between repeats>
  readTimeout= requestTimeout= connectTimeout= keepAliveTimeout= (ms)
  maxRetries= maxRedirects= maxBodySize= maxRecvChunkSize=
  linger=<ms to sleep at the end before printing fd/thread counts>
  watch=<s>: after the calls, print fds/threads/TCP states every 10 s for s seconds
  report=<k>: print fds, threads, RSS and client-side TCP states every k calls
  quiet=1: no per-call output (errors only)   closeEach=1: Client.close after every call
  concurrent=<k>: run k copies of the call at once on the same Client (each copy runs n calls)
  cancelAfter=<ms>: run the call in a task and, after ms, IO.cancel it (cancelMode=io) or call
    Client.close (cancelMode=close); then make one more call on the same Client
  showfds=1: list the targets of the open file descriptors at the end
Each call prints elapsed ms and the typed result.
-/
import Std.Http
open Std Http Async Client

def fdCount : IO Nat := do
  return (← System.FilePath.readDir "/proc/self/fd").size

def threadCount : IO Nat := do
  return (← System.FilePath.readDir "/proc/self/task").size

def fdTargets : IO (List String) := do
  let mut out := []
  for e in ← System.FilePath.readDir "/proc/self/fd" do
    try
      let t ← IO.FS.realPath e.path
      out := t.toString :: out
    catch _ => out := s!"{e.fileName}:?" :: out
  return out

/-- utime+stime of this process in ms (clock ticks of 10 ms), from /proc/self/stat. -/
def cpuMs : IO Nat := do
  let s ← IO.FS.readFile "/proc/self/stat"
  let fs := ((s.splitOn ") ").getLast!).splitOn " "
  return (fs[11]!.toNat! + fs[12]!.toNat!) * 10

def rssKb : IO Nat := do
  let s ← IO.FS.readFile "/proc/self/status"
  for line in s.splitOn "\n" do
    if line.startsWith "VmRSS:" then
      return ((line.drop 6).trimAscii.toString.takeWhile Char.isDigit).toNat!
  return 0

/-- TCP state names as in include/net/tcp_states.h. -/
def tcpStateName : String → String
  | "01" => "ESTABLISHED" | "02" => "SYN_SENT" | "03" => "SYN_RECV" | "04" => "FIN_WAIT1"
  | "05" => "FIN_WAIT2" | "06" => "TIME_WAIT" | "07" => "CLOSE" | "08" => "CLOSE_WAIT"
  | "09" => "LAST_ACK" | "0A" => "LISTEN" | "0B" => "CLOSING" | s => s

/-- Client-side sockets in this network namespace whose remote port is `port`, counted by state
(read from /proc/net/tcp and tcp6, so they include sockets of other processes in the same network
namespace). -/
def tcpStates (port : Nat) : IO String := do
  let hex := (String.ofList (Nat.toDigits 16 port)).toUpper
  let hex := "".pushn '0' (4 - hex.length) ++ hex
  let mut counts : List (String × Nat) := []
  for f in ["/proc/net/tcp", "/proc/net/tcp6"] do
    let s ← IO.FS.readFile f
    for line in (s.splitOn "\n").drop 1 do
      let fs := (line.splitOn " ").filter (· ≠ "")
      if fs.length > 3 then
        let rem := fs[2]!
        if rem.endsWith (":" ++ hex) then
          let st := tcpStateName fs[3]!
          counts := match counts.find? (·.1 == st) with
            | some _ => counts.map fun (k, v) => if k == st then (k, v + 1) else (k, v)
            | none => (st, 1) :: counts
  return toString counts

/-- Print a line and flush, so a hang leaves its trail in the log. -/
def say (s : String) : IO Unit := do
  let out ← IO.getStdout
  out.putStrLn s
  out.flush

structure Opts where
  kv : List (String × String)

def Opts.get (o : Opts) (k : String) (d : String) : String :=
  (o.kv.find? (·.1 == k)).map (·.2) |>.getD d

def Opts.nat (o : Opts) (k : String) (d : Nat) : Nat := (o.get k (toString d)).toNat!

def Opts.has (o : Opts) (k : String) : Bool := o.kv.any (·.1 == k)

def mkTimeout (ms : Nat) : Timeout :=
  let x : Time.Millisecond.Offset := .ofNat ms
  if h : 0 < x then ⟨x, h⟩ else ⟨1, by decide⟩

def errStr : Error → String
  | .connect m => s!"connect {m.quote}"
  | .timeout => "timeout"
  | .closed m => s!"closed {m.quote}"
  | .protocol e => s!"protocol {toString e}"
  | .bodyLimitExceeded => "bodyLimitExceeded"
  | .invalidRequest m => s!"invalidRequest {m.quote}"
  | .io e => s!"io {(toString e).quote}"

def parseMethod : String → Method
  | "POST" => .post | "HEAD" => .head | "PUT" => .put | "DELETE" => .delete
  | "PATCH" => .patch | "OPTIONS" => .options | _ => .get

def trunc (s : String) (n : Nat := 300) : String :=
  if s.length ≤ n then s else (s.take n).toString ++ s!"...(+{s.length - n} chars)"

def now : IO Nat := IO.monoMsNow

def oneCall (o : Opts) (client : Client) (origin : URI.Origin) (target : RequestTarget)
    (tag : String) : Async Unit := do
  let t0 ← now
  let method := parseMethod (o.get "method" "GET")
  let mut b := Request.new |>.method method |>.uri target
  if o.has "authz" then b := b.header! "Authorization" (o.get "authz" "")
  if o.has "cookie" then b := b.header! "Cookie" (o.get "cookie" "")
  if o.has "hdr" then
    let h := o.get "hdr" ""
    match h.splitOn ":" with
    | k :: v => b := b.header! k (":".intercalate v)
    | _ => pure ()
  let req ← if o.has "body" then b.json (o.get "body" "") else b.fromBytes ByteArray.empty
  let r ← client.trySend origin req
  let t1 ← now
  match r with
  | .error e =>
    say s!"{tag} ms={t1 - t0} ERROR [{errStr e}] retryable={e.isRetryable}"
  | .ok resp =>
    let hs := resp.line.headers.toArray.toList.map (fun (k, v) => s!"{k}: {trunc (toString v) 60}")
    let ks ← Body.getKnownSize resp.body
    say s!"{tag} ms={t1 - t0} status={resp.line.status.toCode} version={repr resp.line.version} knownSize={repr ks} headers={hs.length}: {trunc (toString hs) 400}"
    if o.get "readbody" "1" == "1" then
      try
        let bytes ← resp.bytes
        let t2 ← now
        let s := String.fromUTF8? bytes |>.getD s!"<{bytes.size} non-UTF8 bytes>"
        say s!"{tag}   body ms={t2 - t0} len={bytes.size} text={(trunc s 200).quote}"
      catch e =>
        let t2 ← now
        say s!"{tag}   body ms={t2 - t0} BODY-ERROR {e}"
    else if o.get "readbody" "1" == "close" then
      resp.body.close
      say s!"{tag}   body closed unread"
    else if o.get "readbody" "1" == "stream" then
      let mut total := 0
      let mut chunks := 0
      repeat
        match ← resp.body.recv with
        | some c => total := total + c.data.size; chunks := chunks + 1
        | none => break
      say s!"{tag}   body streamed ms={(← now) - t0} len={total} chunks={chunks} rss_kb={← rssKb}"
    else
      say s!"{tag}   body not read"

def main (args : List String) : IO Unit := do
  let o : Opts := ⟨args.filterMap fun a => match a.splitOn "=" with
    | k :: v => some (k, "=".intercalate v) | [] => none⟩
  let url := o.get "url" "http://127.0.0.1:18080/ok"
  let some uri := URI.parse? url | IO.eprintln s!"bad url {url}"; IO.Process.exit 2
  let some (scheme, host, port, target) := uri.toOriginRequest?
    | IO.eprintln s!"url has no host {url}"; IO.Process.exit 2
  let origin : URI.Origin := { scheme, host, port }
  let d : Client.Config := {}
  let cfg : Client.Config := { d with
    readTimeout := mkTimeout (o.nat "readTimeout" 30000)
    requestTimeout := mkTimeout (o.nat "requestTimeout" 120000)
    connectTimeout := mkTimeout (o.nat "connectTimeout" 30000)
    keepAliveTimeout := mkTimeout (o.nat "keepAliveTimeout" 4000)
    maxRedirects := o.nat "maxRedirects" 10
    maxRecvChunkSize := o.nat "maxRecvChunkSize" 16384
    maxResponseBodySize := if o.has "maxBodySize" then some (o.nat "maxBodySize" 0) else none }
  say s!"probe {url} fds={← fdCount} threads={← threadCount}"
  let action : Async Unit := do
    let client ← Client.new cfg (maxRetries := o.nat "maxRetries" 1)
    let n := o.nat "n" 1
    let k := o.nat "concurrent" 1
    let report := o.nat "report" 0
    let quiet := o.get "quiet" "0" == "1"
    let runSeq (who : String) : Async Unit := do
      for i in [0:n] do
        if i > 0 && o.has "gap" then IO.sleep (o.nat "gap" 0).toUInt32
        if quiet then
          let req ← Request.new |>.method (parseMethod (o.get "method" "GET")) |>.uri target
            |>.fromBytes ByteArray.empty
          match ← client.trySend origin req with
          | .ok resp =>
            if o.get "readbody" "1" == "1" then discard resp.bytes
            else if o.get "readbody" "1" == "close" then resp.body.close
          | .error e => say s!"[{who}call{i}] ERROR [{errStr e}]"
        else
          oneCall o client origin target s!"[{who}call{i}]"
        if o.get "closeEach" "0" == "1" then client.close
        if report > 0 && (i + 1) % report == 0 then
          say s!"after {i + 1} calls: fds={← fdCount} threads={← threadCount} rss_kb={← rssKb} tcp={← tcpStates port.toNat}"
    if o.has "cancelAfter" then
      let t0 ← now
      let task ← (runSeq "c").asTask
      IO.sleep (o.nat "cancelAfter" 0).toUInt32
      if o.get "cancelMode" "io" == "close" then
        client.close
        say s!"client.close called at ms={(← now) - t0}"
      else
        IO.cancel (show Task (Except IO.Error Unit) from task)
        say s!"IO.cancel called at ms={(← now) - t0}"
      let r ← try await task; pure "ok" catch e => pure s!"error {e}"
      say s!"task ended at ms={(← now) - t0} result={r}"
      oneCall o client origin target "[after-cancel]"
    else if k > 1 then
      let t0 ← now
      let tasks ← (List.range k).mapM fun j => (runSeq s!"t{j}.").asTask
      for t in tasks do
        try await t catch e => say s!"task error {e}"
      say s!"all {k} tasks done ms={(← now) - t0}"
    else
      runSeq ""
    if o.has "linger" then
      IO.sleep (o.nat "linger" 0).toUInt32
    if o.has "watch" then
      let t0 ← now
      for _ in [0:o.nat "watch" 0 / 10] do
        IO.sleep 10000
        say s!"watch t+{((← now) - t0) / 1000}s: fds={← fdCount} threads={← threadCount} tcp={← tcpStates port.toNat}"
    say s!"end fds={← fdCount} threads={← threadCount} rss_kb={← rssKb} cpu_ms={← cpuMs} tcp={← tcpStates port.toNat}"
    if o.get "showfds" "0" == "1" then
      say s!"fd targets: {← fdTargets}"
  try action.block catch e => IO.eprintln s!"uncaught: {e}"; IO.Process.exit 1
  say "main returning"
