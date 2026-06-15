#!/bin/bash
# YouTube 埋め込みを正しく動かすためのローカルサーバー起動スクリプト
# 使い方: ./serve.sh
# YouTube の埋め込みは file:// プロトコルから拒否されるため (Error 153)、
# ローカル HTTP サーバー経由で開く必要があります。

PORT=8765
DIR="$(cd "$(dirname "$0")" && pwd)"
URL="http://localhost:${PORT}/世界のリング演出まとめ.html"

echo "📡 サーバー起動: $URL"
echo "🛑 終了は Ctrl+C"
echo ""

# ブラウザを自動で開く（2秒待ってから）
( sleep 1.5 && open "$URL" ) &

cd "$DIR"
python3 -m http.server $PORT
