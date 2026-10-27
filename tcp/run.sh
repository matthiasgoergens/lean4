#!/usr/bin/env bash
# Builds the Lean programs in this directory and runs one reproducer over loopback TCP: starts the
# server it needs on a free port, runs the client, prints the client's output and the server's log,
# and stops the server.  Needs `lean` and `leanc` from the toolchain under test on PATH, and python3.
#
# Usage: ./run.sh build | 3 | 5 | 6a | 6b | 6c | 7
#   build  compile probe, postloop and dns into build/ (every other case does this first)
#   3      a 408 sent before an idle connection is closed becomes the next request's response
#   5      POST loop without and with TCP_NODELAY against a server that answers in one write
#   6a     getaddrinfo results: each address three times
#   6b     the connector tries each address three times (counts connect() calls; needs strace)
#   6c     a first address that drops SYNs keeps the second from being tried (needs /etc/hosts setup)
#   7      an IPv6 literal URL does not connect
# Each step is checked explicitly; the script stops at the first failure.

here=$(cd "$(dirname "$0")" && pwd) || exit 1
build=$here/build
py=${PYTHON:-python3}

die() { echo "run.sh: $*" >&2; exit 1; }

pids=()
cleanup() {
  for p in "${pids[@]}"; do kill "$p" 2>/dev/null; done
  for p in "${pids[@]}"; do wait "$p" 2>/dev/null; done
}
trap cleanup EXIT

check_tools() {
  command -v lean >/dev/null || die "lean is not on PATH"
  command -v leanc >/dev/null || die "leanc is not on PATH"
  command -v "$py" >/dev/null || die "$py is not on PATH"
}

build_one() {
  local name=$1
  if [ ! -x "$build/bin/$name" ] || [ "$here/$name.lean" -nt "$build/bin/$name" ]; then
    echo "### building $name"
    lean -c "$build/c/$name.c" "$here/$name.lean" || die "lean -c $name.lean failed"
    leanc -O3 -o "$build/bin/$name" "$build/c/$name.c" || die "leanc $name failed"
  fi
}

build_all() {
  check_tools
  mkdir -p "$build/bin" "$build/c" || die "cannot create $build"
  echo "### $(lean --version)"
  for n in probe postloop dns; do build_one "$n"; done
}

# A loopback port that is free on 127.0.0.1 and, with "both", also on ::1.
free_port() {
  "$py" -I - "$1" <<'EOF'
import socket, sys
both = sys.argv[1] == "both"
for _ in range(100):
    s = socket.socket()
    s.bind(("127.0.0.1", 0))
    port = s.getsockname()[1]
    ok = True
    if both:
        t = socket.socket(socket.AF_INET6)
        try:
            t.bind(("::1", port))
        except OSError:
            ok = False
        t.close()
    s.close()
    if ok:
        print(port)
        sys.exit(0)
sys.exit(1)
EOF
}

# wait_for <file> <text>: wait up to 10 s for a server to write <text> to <file>.
wait_for() {
  for _ in $(seq 100); do
    grep --quiet --fixed-strings "$2" "$1" 2>/dev/null && return 0
    sleep 0.1
  done
  echo "--- $1:" >&2; cat "$1" >&2
  die "server did not report '$2'"
}

start_evil() {  # start_evil <log> <evil.py args...>
  local log=$1; shift
  "$py" -I "$here/evil.py" --log "$log" "$@" &
  pids+=($!)
  wait_for "$log" "listening on"
}

show_log() {
  echo "### server log"
  cat "$1"
}

case_3() {
  local port log
  port=$(free_port v4) || die "no free port"
  log=$tmp/evil.log
  start_evil "$log" --port "$port"
  echo "### client"
  "$build/bin/probe" "url=http://127.0.0.1:$port/idle-408?ms=200&linger=2000" n=2 gap=500 \
    || die "probe failed"
  sleep 2.5  # the server keeps the connection open for 2 s after its 408 (linger=2000)
  show_log "$log"
}

case_5() {
  local calls=${CALLS:-200} nd port log
  for nd in 0 1; do
    port=$(free_port v4) || die "no free port"
    log=$tmp/onewrite-$nd.log
    "$py" -I "$here/onewrite.py" --port "$port" --log "$log" > "$tmp/onewrite-$nd.out" &
    pids+=($!)
    wait_for "$tmp/onewrite-$nd.out" "listening on"
    echo "### client, nodelay=$nd"
    "$build/bin/postloop" "$port" "$calls" "$calls" "$nd" || die "postloop failed"
    echo "### server: requests by number of recv() calls they took, and their mean first-to-last-byte gap"
    awk '{ n[$1]++; g[$1] += $2 }
         END { for (k in n) printf "  %d recv: %d requests, mean gap %.1f ms\n", k, n[k], g[k] / n[k] }' \
      "$log" | sort || die "awk failed"
  done
}

case_6a() {
  echo "### DNS.getAddrInfo, called as Connector.tcp calls it"
  "$build/bin/dns" 127.0.0.1 localhost || die "dns failed"
}

case_6b() {
  command -v strace >/dev/null || die "strace is not on PATH (this case counts connect() calls with it)"
  local port
  port=$(free_port v4) || die "no free port"
  echo "### probe to 127.0.0.1:$port, where nothing listens, with retries off, under strace"
  strace -f -e trace=connect -o "$tmp/strace.txt" \
    "$build/bin/probe" "url=http://127.0.0.1:$port/" maxRetries=0 || die "strace or probe failed"
  echo "### connect() calls to port $port: $(grep --count "htons($port)" "$tmp/strace.txt")"
  grep "htons($port)" "$tmp/strace.txt" | sed 's/^[0-9]* *//'
}

case_6c() {
  local name=${DUAL_NAME:-dual.test} out port log
  out=$("$build/bin/dns" "$name" 2>&1) || die "$name does not resolve; add it to /etc/hosts as the README says"
  echo "### $out"
  case $out in
    "$name: [v6 ::1"*"v4 127.0.0.1"*) ;;
    *) die "$name must resolve to ::1 first and to 127.0.0.1 after it; see the README" ;;
  esac
  port=$(free_port both) || die "no port free on both 127.0.0.1 and ::1"
  "$py" -I "$here/blackhole.py" ::1 "$port" > "$tmp/blackhole.out" &
  pids+=($!)
  wait_for "$tmp/blackhole.out" "blackhole"
  cat "$tmp/blackhole.out"
  grep --quiet "ok (connect timed out)" "$tmp/blackhole.out" || die "the blackhole on ::1 does not work"
  log=$tmp/evil.log
  start_evil "$log" --port "$port"
  echo "### control: the server on 127.0.0.1:$port answers"
  "$build/bin/probe" "url=http://127.0.0.1:$port/ok" n=1 || die "probe failed"
  echo "### client: http://$name:$port/ok, connectTimeout=3000, default retries (1)"
  "$build/bin/probe" "url=http://$name:$port/ok" connectTimeout=3000 n=2 || die "probe failed"
  sleep 0.3
  show_log "$log"
}

case_7() {
  local port log out
  port=$(free_port both) || die "no port free on both 127.0.0.1 and ::1"
  log=$tmp/evil.log
  start_evil "$log" --port "$port" --host ::1 --v6
  echo "### client: http://[::1]:$port/echo"
  "$build/bin/probe" "url=http://[::1]:$port/echo" n=1 || die "probe failed"
  out=$("$build/bin/dns" ip6-localhost) || die "dns failed"
  case $out in
    "ip6-localhost: [v6 ::1"*)
      echo "### control: ip6-localhost resolves to ::1, and the same server answers by that name"
      "$build/bin/probe" "url=http://ip6-localhost:$port/echo" n=1 || die "probe failed" ;;
    *) echo "### (no control: ip6-localhost does not resolve to ::1 here)" ;;
  esac
  sleep 0.3
  show_log "$log"
}

[ $# -eq 1 ] || die "usage: ./run.sh build | 3 | 5 | 6a | 6b | 6c | 7"
build_all
tmp=$(mktemp -d "$build/run.XXXXXX") || die "mktemp failed"
case $1 in
  build) ;;
  3) case_3 ;;
  5) case_5 ;;
  6a) case_6a ;;
  6b) case_6b ;;
  6c) case_6c ;;
  7) case_7 ;;
  *) die "unknown case $1" ;;
esac
