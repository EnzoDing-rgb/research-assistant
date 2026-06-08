#!/usr/bin/env bash
# 在远程起静态服务，用 Cursor Ports 或 ssh -L 在 Mac Chrome 打开
cd "$(dirname "$0")"
PORT="${1:-8765}"
echo "Deck: http://127.0.0.1:${PORT}/index.html"
echo "Mac: Cursor → Ports → ${PORT} → Open in Browser"
exec python3 -m http.server "$PORT"
