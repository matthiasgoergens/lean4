module

import Std.Http.Test.Helpers

/-!
Reproducers for defects in the HTTP client (#14546, #14547, #14548), written in the style of
`tests/elab/async_http_client_*.lean`.  Each test asserts the behaviour I would expect, so on the
stack's head (3e6f42a58a) each one fails with a message naming what went wrong.
-/

open Std.Async
open Std Http Internal
open Test.ClientHelpers

namespace ClientReviewRepros

private def originOf (host : String) : IO URI.Origin := do
  let some d := URI.DomainName.ofString? host | throw (IO.userError "DomainName parse failed")
  pure { scheme := URI.Scheme.ofString! "http", host := .name d, port := 80 }

/-- A connector that hands out the given mock transports in order, one per connection opened, and
counts the connections. -/
private def connectorOf (transports : Array Mock.Server) (opened : IO.Ref Nat) : Client.Connector :=
  fun origin config => do
    let n ← opened.modifyGet fun n => (n, n + 1)
    match transports[n]? with
    | some t => return .ok (← Client.Connection.new t origin config)
    | none => throw (IO.userError s!"connection {n + 1} was not expected")

/-- Sends in the background; resolves with the status and the body read to its end, or the error. -/
private def sendReading {β : Type} [Coe β Body.Any] (client : Client) (origin : URI.Origin)
    (request : Request β) : Async (IO.Promise (Except String (Nat × String))) := do
  let p ← IO.Promise.new
  background do
    let r ← try
        let resp ← client.send origin request
        let body : String ← resp.body.readAll
        pure (Except.ok (resp.line.status.toCode.toNat, body))
      catch e => pure (Except.error (toString e))
    discard <| p.resolve r
  pure p

/-- Answers the next request on `peer` with `resp`, if one arrives, recording that it did. -/
private def answerNext (peer : Mock.Client) (resp : ByteArray) (seen : IO.Ref Bool) : Async Unit :=
  background do
    if let some _ ← peer.recv? then
      seen.set true
      try peer.send resp catch _ => pure ()

-- 1. A cross-origin redirect of one caller aborts another caller's request on the same connection:
--    the redirect path retires the shared connection with `Connection.close`, which cancels the
--    exchange in flight, rather than with the graceful `retire`.
#eval show IO _ from runWithTimeout "a neighbour's redirect does not abort my POST" 6000 <|
  Async.block do
  let (peerA, transportA) ← Mock.new
  let (peerB, transportB) ← Mock.new
  let opened ← IO.mkRef 0
  let connect : Client.Connector := fun origin config => do
    discard <| opened.modifyGet fun n => (n, n + 1)
    let t := if toString origin.host == "other.example" then transportB else transportA
    return .ok (← Client.Connection.new t origin config)
  let client ← Client.new {} connect (maxRetries := 0)
  let a ← originOf "example.com"
  let reqX ← Request.new |>.method .get |>.uri! "/x" |>.header! "Host" "example.com" |>.empty
  let reqY ← Request.new |>.method .post |>.uri! "/y" |>.header! "Host" "example.com" |>.text "payload"
  let x ← sendReading client a reqX
  let _ ← drainRequest peerA
  let y ← sendReading client a reqY   -- queues behind X on the same connection
  IO.sleep 50
  peerA.send (rawResp "302 Found"
    #[("Location", "http://other.example/z"), ("Content-Length", "0"), ("Connection", "keep-alive")] "")
  -- Y goes on the wire once X's exchange is complete; the server answers it after a short delay.
  background do
    if let some _ ← peerA.recv? then
      IO.sleep 300
      try peerA.send (rawResp "200 OK" #[("Content-Length", "2")] "ok") catch _ => pure ()
  let _ ← drainRequest peerB
  peerB.send (rawResp "200 OK" #[("Content-Length", "1"), ("Connection", "close")] "z")
  let rx ← await x.result!
  let ry ← await y.result!
  unless ry matches .ok (200, _) do
    throw (IO.userError s!"POST /y failed because GET /x was redirected: Y = {ry}, X = {rx}")

-- 2. `Client.close` while a GET is in flight: the abort is classed as retryable, so `send` re-sends
--    the GET on a new connection and the server receives it twice.
#eval show IO _ from runWithTimeout "Client.close does not re-send an in-flight GET" 4000 <|
  Async.block do
  let (peer1, transport1) ← Mock.new
  let (peer2, transport2) ← Mock.new
  let opened ← IO.mkRef 0
  let client ← Client.new {} (connectorOf #[transport1, transport2] opened)   -- default maxRetries
  let a ← originOf "example.com"
  let req ← Request.new |>.method .get |>.uri! "/slow" |>.header! "Host" "example.com" |>.empty
  let r ← sendReading client a req
  let _ ← drainRequest peer1
  client.close
  let resent ← IO.mkRef false
  answerNext peer2 (rawResp "200 OK" #[("Content-Length", "2")] "ok") resent
  let result ← await r.result!
  if ← resent.get then
    throw (IO.userError s!"after Client.close the GET went out again on a new connection; the caller got {result}")

-- 3. Bytes that arrive while the connection is idle are parsed as the next request's response.
--    Here a server sends a second, unsolicited response after answering request 1; request 2 is
--    then answered with it, although the server never received request 2.
#eval show IO _ from runWithTimeout "an unsolicited response is not delivered to the next request" 4000 <|
  Async.block do
  let (peer1, transport1) ← Mock.new
  let (peer2, transport2) ← Mock.new
  let opened ← IO.mkRef 0
  let client ← Client.new {} (connectorOf #[transport1, transport2] opened) (maxRetries := 0)
  let a ← originOf "example.com"
  let req1 ← Request.new |>.method .get |>.uri! "/one" |>.header! "Host" "example.com" |>.empty
  let r1 ← sendReading client a req1
  let _ ← drainRequest peer1
  peer1.send (rawResp "200 OK" #[("Content-Length", "2")] "ok")
  let _ ← await r1.result!
  peer1.send (rawResp "200 OK" #[("Content-Length", "4")] "evil")   -- nobody asked for this
  IO.sleep 100
  -- Whichever connection request 2 goes out on, the server answers it with "two".
  let seen1 ← IO.mkRef false
  let seen2 ← IO.mkRef false
  answerNext peer1 (rawResp "200 OK" #[("Content-Length", "3")] "two") seen1
  answerNext peer2 (rawResp "200 OK" #[("Content-Length", "3")] "two") seen2
  let req2 ← Request.new |>.method .get |>.uri! "/two" |>.header! "Host" "example.com" |>.empty
  let r2 ← await (← sendReading client a req2).result!
  unless r2 matches .ok (_, "two") do
    throw (IO.userError
      s!"request 2 got {r2}; the server received it: {(← seen1.get) || (← seen2.get)}")

-- 4. A response body that the caller neither reads nor closes holds the connection, and with it
--    every later request on the client, until the first request's `requestTimeout`.  The read
--    timeout is off while the connection waits for the caller, and nothing opens a second
--    connection.  Here request 2 cannot complete before request 1's 3 s timeout.
#eval show IO _ from runWithTimeout "an unread body does not block the next request" 8000 <|
  Async.block do
  let (peer1, transport1) ← Mock.new
  let (peer2, transport2) ← Mock.new
  let opened ← IO.mkRef 0
  let client ← Client.new { requestTimeout := ⟨3000, by decide⟩ }
    (connectorOf #[transport1, transport2] opened) (maxRetries := 0)
  let a ← originOf "example.com"
  let req1 ← Request.new |>.method .get |>.uri! "/one" |>.header! "Host" "example.com" |>.empty
  let p1 ← IO.Promise.new
  background do
    let resp ← client.send a req1   -- the caller keeps the response and never touches its body
    discard <| p1.resolve resp.line.status.toCode.toNat
  let _ ← drainRequest peer1
  peer1.send (rawResp "200 OK" #[("Content-Length", "5")] "hello")
  let _ ← await p1.result!
  let seen1 ← IO.mkRef false
  let seen2 ← IO.mkRef false
  answerNext peer1 (rawResp "200 OK" #[("Content-Length", "3")] "two") seen1
  answerNext peer2 (rawResp "200 OK" #[("Content-Length", "3")] "two") seen2
  let start ← IO.monoMsNow
  let req2 ← Request.new |>.method .post |>.uri! "/two" |>.header! "Host" "example.com" |>.text "{}"
  let r2 ← await (← sendReading client a req2).result!
  let ms := (← IO.monoMsNow) - start
  unless r2 matches .ok (200, "two") && ms < 1000 do
    throw (IO.userError s!"request 2 took {ms} ms and got {r2}, behind request 1's unread 5-byte body")

-- 5. Post/Redirect/Get to the same path: POST /items → 303 See Other, Location: /items.
--    Cycle detection keys on (origin, path and query) and ignores the method, so the GET is never
--    sent and the caller receives the 303.
#eval show IO _ from runWithTimeout "303 to the request's own path is followed with GET" 4000 <|
  Async.block do
  let (peer, transport) ← Mock.new
  let client ← mkClient transport
  let request ← Request.new |>.method .post |>.uri! "/items"
    |>.header! "Host" "example.com" |>.text "name=x"
  let result ← sendInBackground client request
  let _ ← drainRequest peer
  peer.send (rawResp "303 See Other"
    #[("Location", "/items"), ("Content-Length", "0"), ("Connection", "keep-alive")] "")
  let followed ← IO.mkRef false
  answerNext peer (rawResp "200 OK" #[("Content-Length", "2")] "ok") followed
  match ← await result.result! with
  | .error e => throw (IO.userError s!"client error: {e}")
  | .ok resp =>
    resp.body.close
    unless ← followed.get do
      throw (IO.userError s!"the GET after 303 was never sent; the caller got {resp.line.status.toCode}")

end ClientReviewRepros
