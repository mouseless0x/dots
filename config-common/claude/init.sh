#!/bin/bash

# Enable notifs
claude config set --global preferredNotifChannel terminal_bell

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
