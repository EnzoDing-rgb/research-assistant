#!/usr/bin/env bash
# 每次启动：杀光旧进程 → 等端口释放 → no-cache 起服务
set -euo pipefail
cd "$(dirname "$0")"
PORT="${1:-8765}"

port_busy() {
  ss -tln 2>/dev/null | grep -q ":${PORT} "
}

kill_port() {
  local i pids
  for i in 1 2 3 4 5 6 7 8; do
    port_busy || return 0

    if command -v fuser >/dev/null 2>&1; then
      fuser -k "${PORT}/tcp" >/dev/null 2>&1 || true
    fi

    pids=$(lsof -t -iTCP:"${PORT}" -sTCP:LISTEN 2>/dev/null || true)
    if [ -n "$pids" ]; then
      kill -9 $pids >/dev/null 2>&1 || true
    fi

    sleep 0.25
  done

  if port_busy; then
    echo "ERROR: port ${PORT} still in use after kill retries" >&2
    ss -tlnp 2>/dev/null | grep ":${PORT} " >&2 || true
    exit 1
  fi
}

kill_port

SLIDES=$(python3 -c "import re; h=open('index.html').read(); print(len(re.findall(r'file:\s*\"', h)))")
BUILD=$(python3 -c "import re; h=open('index.html').read(); m=re.search(r'DECK_BUILD\\s*=\\s*\"([^\"]+)\"', h); print(m.group(1) if m else 'unknown')")

echo "Serving: $(pwd)"
echo "Slides:  ${SLIDES} pages (expect 9)"
echo "Build:   ${BUILD}"
echo "URL:     http://127.0.0.1:${PORT}/index.html"
echo "Mac:     Cursor → Ports → ${PORT} → Open in Browser"
export PORT

exec python3 - <<'PY'
import http.server
import os
import socket
import socketserver

PORT = int(os.environ.get("PORT", "8765"))

class NoCacheHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0")
        self.send_header("Pragma", "no-cache")
        self.send_header("Expires", "0")
        super().end_headers()

class ReuseTCPServer(socketserver.TCPServer):
    allow_reuse_address = True

    def server_bind(self):
        self.socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        super().server_bind()

with ReuseTCPServer(("", PORT), NoCacheHandler) as httpd:
    print(f"No-cache HTTP server on 0.0.0.0:{PORT}", flush=True)
    httpd.serve_forever()
PY
