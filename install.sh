#!/bin/sh
set -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
CLAUDE_DIR="$HOME/.claude"
SETTINGS="$CLAUDE_DIR/settings.json"

mkdir -p "$CLAUDE_DIR"
cp "$SCRIPT_DIR/statusline-command.sh" "$CLAUDE_DIR/statusline-command.sh"
chmod +x "$CLAUDE_DIR/statusline-command.sh"

if ! command -v jq >/dev/null 2>&1; then
  echo "jq is required but not found on this machine. Install it (e.g. 'brew install jq' or 'sudo apt install jq') and re-run." >&2
  exit 1
fi

if [ -f "$SETTINGS" ]; then
  tmp=$(mktemp)
  jq '.statusLine = {"type":"command","command":"sh ~/.claude/statusline-command.sh","padding":0}' "$SETTINGS" > "$tmp"
  mv "$tmp" "$SETTINGS"
else
  printf '{\n  "statusLine": {\n    "type": "command",\n    "command": "sh ~/.claude/statusline-command.sh",\n    "padding": 0\n  }\n}\n' > "$SETTINGS"
fi

echo "Installed statusline-command.sh to $CLAUDE_DIR"
echo "settings.json statusLine entry updated (other keys left untouched)."
