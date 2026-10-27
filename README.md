# Reproducers for the HTTP/1.1 client in leanprover/lean4#14548

These are reproducers for the problems reported in a review of the HTTP/1.1 client for `Std.Http` proposed in leanprover/lean4#14546, #14547 and #14548, at the head of that stack, 3e6f42a58a955f7fd9a6df4213f3be4bb68e3e3b.  `mock/` holds tests in the style of the stack's `tests/elab/async_http_client_*.lean`, on its mock transport; each asserts the expected behaviour and fails on that head.  `tcp/` holds small programs that use the client over real TCP on loopback, against local Python servers that misbehave in controlled ways.  Everything below was run on x86-64 Linux, in an Ubuntu 24.04 container with no network apart from loopback, and the outputs shown are from that run.

## Requirements

- **The toolchain built from the PR.**  With [elan](https://github.com/leanprover/elan), run `elan toolchain install leanprover/lean4-pr-releases:pr-release-14548`; the `lean-toolchain` file at the root of this tree then selects it for every command run inside the tree.  Without elan, download `lean-4.35.0-pre-linux.tar.zst` from https://github.com/leanprover/lean4-pr-releases/releases/tag/pr-release-14548, unpack it and put its `bin/` directory on `PATH`.  Either way, `lean --version` should name commit 3e6f42a58a955f7fd9a6df4213f3be4bb68e3e3b.  That release is rebuilt whenever the PR moves, so a later download may be of a later head, where the results can differ.
- **Python 3**, standard library only, as `python3` on `PATH` (set `PYTHON` to use another interpreter).
- **Linux.**  The TCP programs read `/proc`.  Problem 6 also needs `strace` for one step, and root (or a throwaway container) to add a name to `/etc/hosts` for another.

## How to run

`mock/run.sh` elaborates `mock/ClientReviewRepros.lean` with the same options as the Lean repository's `tests/elab/run_test.sh`.  It takes about five seconds, prints one error per failing test and exits with status 1.

`tcp/run.sh <case>` first compiles `probe.lean`, `postloop.lean` and `dns.lean` into `tcp/build/` with `lean -c` and `leanc`, then starts the server the case needs on a free loopback port, runs the client against it, prints the client's output and the server's log, and stops the server.  `tcp/run.sh build` only compiles.  Ports are picked at random, so the port numbers in the output differ from run to run, as do timings in the last digits.

The programs can also be used directly.  `tcp/probe.lean` is a general client whose header lists its options (method, body, timeouts, retries, repeats, concurrency, cancellation, leaving the body unread); `tcp/evil.py` is a server whose behaviour is chosen by the request path (see `route` in it), and logs every connection and request it sees.

### Output of the mock tests

On 3e6f42a58a, `mock/run.sh` prints:

```
### Lean (version 4.35.0-pre, x86_64-unknown-linux-gnu, commit 3e6f42a58a955f7fd9a6df4213f3be4bb68e3e3b, Release)
ClientReviewRepros.lean:53:0-53:5: error: POST /y failed because GET /x was redirected: Y = error: connection shutdown, X = ok: (200, z)
ClientReviewRepros.lean:86:0-86:5: error: after Client.close the GET went out again on a new connection; the caller got ok: (200, ok)
ClientReviewRepros.lean:106:0-106:5: error: request 2 got ok: (200, evil); the server received it: true
ClientReviewRepros.lean:135:0-135:5: error: request 2 took 3001 ms and got error: connection closed, behind request 1's unread 5-byte body
ClientReviewRepros.lean:165:0-165:5: error: the GET after 303 was never sent; the caller got 303
### exit status 1
```

The first line's error is `connection shutdown` or `connection closed`, depending on timing.  A test that passes prints nothing.

## The problems

### 1. A redirect of one request aborts another request on the same connection

Mock test at line 53.  A GET and a POST to the same origin share one connection; the POST is queued behind the GET.  The server redirects the GET to another origin.  The client retires the shared connection by closing it, which fails the POST with `connection shutdown` or `connection closed`, while the GET follows its redirect and succeeds (`X = ok: (200, z)`).

### 2. `Client.close` re-sends an in-flight GET

Mock test at line 86.  `Client.close` is called while a GET is waiting for its response.  The client treats the abort as retryable, sends the GET again on a new connection, and returns that second response to the caller (`ok: (200, ok)`), so the server receives the request twice.

### 3. Bytes that arrive on an idle connection become the next response

Mock test at line 106.  After answering request 1, the server sends a second response that nobody asked for.  Request 2 receives it (`(200, evil)`), although the server also received request 2 and answered it with `two`.

The same over TCP: `tcp/run.sh 3`.  The server answers request 1, and after 200 ms of idleness sends `408 Request Timeout` with `Connection: close`, keeping the socket open for another 2 s before closing it.  The probe sends request 2 after 500 ms.  On 3e6f42a58a it prints:

```
### client
probe http://127.0.0.1:43547/idle-408?ms=200&linger=2000 fds=10 threads=3
[call0] ms=4 status=200 version=Std.Http.Version.v11 knownSize=some (Std.Http.Body.Length.fixed 2) headers=1: [Content-Length: 2]
[call0]   body ms=4 len=2 text="ok"
[call1] ms=0 status=408 version=Std.Http.Version.v11 knownSize=some (Std.Http.Body.Length.fixed 0) headers=2: [Connection: close, Content-Length: 0]
[call1]   body ms=0 len=0 text=""
end fds=11 threads=17 rss_kb=17616 cpu_ms=0 tcp=[(FIN_WAIT1, 1)]
main returning
### server log
       2.4 listening on 127.0.0.1:43547
      92.8 conn1 accepted from ('127.0.0.1', 43580)
      93.5 conn1 req1 GET /idle-408?ms=200&linger=2000 {'host': ['127.0.0.1:43547']} body=0B
     293.8 conn1 sent 408
    2294.0 conn1 closed by server
```

The second call returns the 408 as its response, although the server never read request 2 (its log has no `req2`): it had sent the 408 before request 2 was written, and was only waiting to close the connection.

### 4. A response body that is neither read nor closed blocks the next request

Mock test at line 135.  The caller keeps the response to request 1 but never reads or closes its 5-byte body.  Request 2 on the same client waits until request 1's `requestTimeout` (3 s in the test) runs out, and then fails with `connection closed`.  The time printed is about 3000 ms.

### 5. No `TCP_NODELAY` on client sockets

`tcp/run.sh 5`.  `tcp/postloop.lean` sends one untimed and then 200 timed POST requests with the body `{"n": 1}`, one after another on one client, to `tcp/onewrite.py`, a server that answers each request in a single write.  It runs twice: with `Connector.tcp` as shipped (`nodelay=0`), and with a copy of it that also calls `socket.noDelay` after connecting (`nodelay=1`).  The server logs, for each request, how many `recv` calls it took and the time between its first and its last byte.  Set `CALLS` to change the number of requests.  On 3e6f42a58a:

```
### client, nodelay=0
nodelay=0 first call: status=200 body={"ok": true}
calls wall_ms cpu_ms rss_kb fds
0 0 0 15348 12
200 8264 310 23608 12
mean wall time per request: 41325 us
### server: requests by number of recv() calls they took, and their mean first-to-last-byte gap
  2 recv: 201 requests, mean gap 40.4 ms
### client, nodelay=1
nodelay=1 first call: status=200 body={"ok": true}
calls wall_ms cpu_ms rss_kb fds
0 0 0 15172 12
200 114 230 25488 12
mean wall time per request: 575 us
### server: requests by number of recv() calls they took, and their mean first-to-last-byte gap
  2 recv: 201 requests, mean gap 0.1 ms
```

Without `TCP_NODELAY`, each request's body reaches the server about 40 ms after its head: Nagle's algorithm holds the body back until the server acknowledges the head, and the server delays that acknowledgement (40 ms is Linux's minimum delayed-ACK time).  With `TCP_NODELAY` a request takes well under a millisecond.

### 6. Address handling in `Connector.tcp`

**Each address is returned three times.**  `tcp/run.sh 6a` prints what `Std.Async.DNS.getAddrInfo` returns for the arguments `Connector.tcp` passes it:

```
### DNS.getAddrInfo, called as Connector.tcp calls it
127.0.0.1: [v4 127.0.0.1, v4 127.0.0.1, v4 127.0.0.1]
localhost: [v4 127.0.0.1, v4 127.0.0.1, v4 127.0.0.1]
```

(The `localhost` line depends on the system's `/etc/hosts`.)

**So each address is tried three times.**  `tcp/run.sh 6b` (needs `strace`) runs the probe with retries off against a loopback port where nothing listens, and counts its `connect` calls:

```
### probe to 127.0.0.1:54553, where nothing listens, with retries off, under strace
probe http://127.0.0.1:54553/ fds=10 threads=3
[call0] ms=3 ERROR [connect "no such thing (error code: 111, connection refused)"] retryable=true
end fds=11 threads=12 rss_kb=13260 cpu_ms=0 tcp=[]
main returning
### connect() calls to port 54553: 3
connect(10, {sa_family=AF_INET, sin_port=htons(54553), sin_addr=inet_addr("127.0.0.1")}, 16) = -1 EINPROGRESS (Operation now in progress)
connect(10, {sa_family=AF_INET, sin_port=htons(54553), sin_addr=inet_addr("127.0.0.1")}, 16) = -1 EINPROGRESS (Operation now in progress)
connect(10, {sa_family=AF_INET, sin_port=htons(54553), sin_addr=inet_addr("127.0.0.1")}, 16) = -1 EINPROGRESS (Operation now in progress)
```

**A first address that drops connection attempts keeps the second from being tried.**  This needs a name that resolves to `::1` first and to `127.0.0.1` after it.  As root, preferably in a throwaway container since it changes the system's name resolution, add it to `/etc/hosts`:

```
printf '::1 dual.test\n127.0.0.1 dual.test\n' >> /etc/hosts
```

(`DUAL_NAME` selects another name.)  Then `tcp/run.sh 6c` starts `tcp/blackhole.py` on `[::1]:<port>`, a listener whose accept queue is full, so that the kernel drops further SYNs as a firewall would, and `tcp/evil.py` on `127.0.0.1:<port>`.  It checks that the server answers on `127.0.0.1`, then requests `http://dual.test:<port>/ok` twice with `connectTimeout=3000`:

```
### dual.test: [v6 ::1, v6 ::1, v6 ::1, v4 127.0.0.1, v4 127.0.0.1, v4 127.0.0.1]
blackhole ::1:44625: ok (connect timed out)
### control: the server on 127.0.0.1:44625 answers
probe http://127.0.0.1:44625/ok fds=10 threads=3
[call0] ms=2 status=200 version=Std.Http.Version.v11 knownSize=some (Std.Http.Body.Length.fixed 5) headers=1: [Content-Length: 5]
[call0]   body ms=2 len=5 text="hello"
end fds=12 threads=17 rss_kb=15444 cpu_ms=0 tcp=[(SYN_SENT, 3), (ESTABLISHED, 2)]
main returning
### client: http://dual.test:44625/ok, connectTimeout=3000, default retries (1)
probe http://dual.test:44625/ok fds=10 threads=3
[call0] ms=6006 ERROR [connect "connecting to dual.test:44625 timed out after 3000ms"] retryable=true
[call1] ms=6005 ERROR [connect "connecting to dual.test:44625 timed out after 3000ms"] retryable=true
end fds=15 threads=14 rss_kb=15500 cpu_ms=0 tcp=[(SYN_SENT, 7), (ESTABLISHED, 1), (TIME_WAIT, 1)]
main returning
### server log
       2.8 listening on 127.0.0.1:44625
      87.4 conn1 accepted from ('127.0.0.1', 50264)
      88.2 conn1 req1 GET /ok {'host': ['127.0.0.1:44625']} body=0B
      91.8 conn1 EOF from client after 1 requests
      91.9 conn1 closed by server
```

Every request to `dual.test` fails after twice `connectTimeout` (the connect error is retryable, and the probe allows one retry), and the server on `127.0.0.1` sees only the control request.  The `tcp=` counts are of all client sockets to that port, including the blackhole's own.

### 7. An IPv6 literal URL does not connect

`tcp/run.sh 7` starts `tcp/evil.py` on `[::1]:<port>` and requests `http://[::1]:<port>/echo`.  Where `ip6-localhost` resolves to `::1`, as in Debian and Ubuntu, it then requests the same server by that name as a control:

```
### client: http://[::1]:37317/echo
probe http://[::1]:37317/echo fds=10 threads=3
[call0] ms=1 ERROR [connect "invalid argument (error code: 22, name is not ASCII)"] retryable=true
end fds=10 threads=13 rss_kb=13148 cpu_ms=0 tcp=[]
main returning
### control: ip6-localhost resolves to ::1, and the same server answers by that name
probe http://ip6-localhost:37317/echo fds=10 threads=3
[call0] ms=2 status=200 version=Std.Http.Version.v11 knownSize=some (Std.Http.Body.Length.fixed 68) headers=1: [Content-Length: 68]
[call0]   body ms=2 len=68 text="GET /echo auth=None cookie=None host=['ip6-localhost:37317'] body=''"
end fds=12 threads=14 rss_kb=15540 cpu_ms=0 tcp=[(ESTABLISHED, 1)]
main returning
### server log
       2.8 listening on ::1:37317
     102.6 conn1 accepted from ('::1', 43566, 0, 0)
     103.1 conn1 req1 GET /echo {'host': ['ip6-localhost:37317']} body=0B
     107.4 conn1 EOF from client after 1 requests
     107.5 conn1 closed by server
```

### Redirect to the request's own URL

Mock test at line 165.  `POST /items` is answered with `303 See Other` and `Location: /items`.  The client does not send the `GET /items` that a 303 calls for, and returns the 303 to the caller.
