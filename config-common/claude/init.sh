#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy notify script
mkdir -p ~/.claude
cp "$SCRIPT_DIR/notify.sh" ~/.claude/notify.sh
chmod +x ~/.claude/notify.sh

# Set up hooks in settings.json
SETTINGS="$HOME/.claude/settings.json"
HOOKS='{
    "UserPromptSubmit": [{"hooks": [{"type": "command", "command": "~/.claude/notify.sh UserPromptSubmit"}]}],
    "Stop": [{"hooks": [{"type": "command", "command": "~/.claude/notify.sh Stop"}]}],
    "Notification": [{"hooks": [{"type": "command", "command": "~/.claude/notify.sh Notification"}]}]
}'

if [ -f "$SETTINGS" ] && command -v jq &> /dev/null; then
    jq --argjson h "$HOOKS" '.hooks = $h' "$SETTINGS" > "$SETTINGS.tmp" && mv "$SETTINGS.tmp" "$SETTINGS"
else
    mkdir -p "$(dirname "$SETTINGS")"
    echo "{\"hooks\": $HOOKS}" > "$SETTINGS"
fi

echo "Configured Claude Code notification hooks"

# Configure allowed tools in ~/.claude/settings.json
#SETTINGS="$HOME/.claude/settings.json"
#TOOLS='[
#  "Read(**)",
#  "Glob(**)",
#  "Grep(**)",
#  "LS(**)",
#  "WebSearch(**)",
#  "WebFetch(**)",
#  "TodoRead()",
#  "Task(**)",
#  "Bash(git status*)",
#  "Bash(git log*)",
#  "Bash(git diff*)",
#  "Bash(git show*)",
#  "Bash(git blame*)",
#  "Bash(git branch*)",
#  "Bash(git remote -v*)",
#  "Bash(git config --get*)",
#  "Bash(ls*)",
#  "Bash(cat *)",
#  "Bash(head*)",
#  "Bash(tail*)",
#  "Bash(grep*)",
#  "Bash(find*)",
#  "Bash(tree*)",
#  "Bash(pwd*)",
#  "Bash(wc*)",
#  "Bash(diff *)",
#  "Bash(jq*)",
#  "Bash(which *)",
#  "Bash(echo *)",
#  "Bash(* | grep*)",
#  "Bash(* | jq*)",
#  "Bash(* | head*)",
#  "Bash(* | tail*)"
#]'
#
#if [ -f "$SETTINGS" ] && command -v jq &> /dev/null; then
#    jq --argjson t "$TOOLS" '.permissions.allow = ((.permissions.allow // []) + $t | unique)' "$SETTINGS" > "$SETTINGS.tmp" && mv "$SETTINGS.tmp" "$SETTINGS"
#else
#    echo '{"permissions": {"allow": '$TOOLS', "deny": []}}' > "$SETTINGS"
#fi
#
#echo "Configured allowed tools in ~/.claude/settings.json"
