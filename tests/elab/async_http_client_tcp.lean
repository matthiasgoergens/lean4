module

import Std.Http.Test.Helpers

/-!
Tests of `Client.Connector.tcp` over loopback sockets. The other client tests run over mock
transports and supply their own connector, so they never reach this one.
-/

open Std.Async
open Std Http Internal Net
open Test.ClientHelpers

namespace ClientTcpTests

/--
Accepts one connection on `server`, reads one request head from it, answers with a 200 carrying
`body`, and resolves `head` with the request head it read.
-/
private def answerOnce (server : TCP.Socket.Server) (body : String) (head : IO.Promise String) :
    Async Unit := do
  let peer ← server.accept
  let mut received := ByteArray.empty
  while !(String.fromUTF8! received).contains "\r\n\r\n" do
    let some chunk ← peer.recv? 4096 | break
    received := received ++ chunk
  discard <| head.resolve (String.fromUTF8! received)
  peer.send (rawResp "200 OK"
    #[("Content-Length", toString body.toUTF8.size), ("Connection", "close")] body)
  peer.shutdown

/--
Listens on `addr` (port 0 picks a free one), sends `GET /` through `Connector.tcp` to the origin
with `host` and the port the listener got, and returns the response body together with the request
head the listener read. Returns `none` when nothing can listen on `addr`.
-/
private def getOverLoopback (addr : SocketAddress) (host : URI.Host) :
    Async (Option (String × String)) := do
  let server ← TCP.Socket.Server.mk
  try server.bind addr catch _ => return none
  server.listen 1
  let port := (← server.getSockName).port
  let head ← IO.Promise.new
  background (answerOnce server "ok" head)
  let client ← Client.new {}
  let origin : URI.Origin := { scheme := URI.Scheme.ofString! "http", host, port }
  let request ← Request.new |>.method .get |>.uri! "/" |>.empty
  let result ← client.trySend origin request
  match result with
  | .error e =>
    client.close
    throw (IO.userError s!"GET http://{origin.hostHeader}/ failed: {e}")
  | .ok response =>
    let body : String ← response.body.readAll
    client.close
    return some (body, ← await head.result!)

-- Control: an IPv4 literal, which `getaddrinfo` takes as it is written in the URI.
#eval show IO _ from runWithTimeout "connect to an IPv4 literal" 4000 <| Async.block do
  let loopback := IPv4Addr.ofParts 127 0 0 1
  let some (body, head) ← getOverLoopback (.v4 ⟨loopback, 0⟩) (.ipv4 loopback)
    | throw (IO.userError "could not listen on 127.0.0.1")
  unless body == "ok" do
    throw (IO.userError s!"unexpected body {body.quote}")
  unless head.startsWith "GET / HTTP/1.1\r\n" do
    throw (IO.userError s!"unexpected request head {head.quote}")

-- An IPv6 literal is written in brackets in a URI and in the `Host` header, but the address handed
-- to the resolver must not have them. Skipped on a host without IPv6 loopback.
#eval show IO _ from runWithTimeout "connect to an IPv6 literal" 4000 <| Async.block do
  let loopback := IPv6Addr.ofParts 0 0 0 0 0 0 0 1
  let some (body, head) ← getOverLoopback (.v6 ⟨loopback, 0⟩) (.ipv6 loopback)
    | return
  unless body == "ok" do
    throw (IO.userError s!"unexpected body {body.quote}")
  unless (head.splitOn "\r\n").any (·.toLower.startsWith "host: [::1]:") do
    throw (IO.userError s!"the Host header does not name [::1]: {head.quote}")

end ClientTcpTests
