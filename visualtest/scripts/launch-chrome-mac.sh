#!/bin/bash
# Launch Google Chrome with remote debugging on port 9222 for visual testing on macOS
TARGET_URL="${1:-http://localhost:3000}"
PROFILE_DIR="$HOME/.chrome-automation"
mkdir -p "$PROFILE_DIR"

"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --remote-debugging-port=9222 \
  --user-data-dir="$PROFILE_DIR" \
  "$TARGET_URL" >/dev/null 2>&1 &

sleep 2
curl -s http://127.0.0.1:9222/json/version && echo "Chrome remote debugging active on port 9222"
