#!/bin/bash

# Load environment
source /etc/profile
[ -f ~/.bashrc ] && source ~/.bashrc

cd /root/ || exit 1

set -euo pipefail

# ==============================
# Requirements
# ==============================
require() {
  command -v "$1" >/dev/null 2>&1 || { echo "Error: '$1' not found. Please install it."; exit 1; }
}

require screen

# ==============================
# Cleanup old miner sessions
# ==============================
echo "Cleaning up old miner_* screen sessions…"
OLD_SESSIONS=$(screen -ls | awk '/miner_/ {print $1}' || true)

if [[ -n "$OLD_SESSIONS" ]]; then
  for s in $OLD_SESSIONS; do
    echo "Attempting to kill $s"
    screen -S "$s" -X quit || true
  done
fi

screen -wipe >/dev/null || true

# Kill any miner processes outside screen
echo "Killing stray miner processes…"
pkill miner || true

# ==============================
# Start gpuminer in screen
# ==============================
SESSION_NAME="GPU_restarted"
MINER_CMD="./miner --pool stratum+tcp://ru1.alphapool.tech:5566 --address prl1pv6yzn7r43jt6yxd7hezg5jez8xh33madelmgcmsdmctqcgm6074s2w54qf --worker $(hostname)"

echo "Starting gpuminer in screen session: $SESSION_NAME"
screen -dmS "$SESSION_NAME" bash -lc "$MINER_CMD"

echo "✅ gpuminer is running now in screen session '$SESSION_NAME'"
