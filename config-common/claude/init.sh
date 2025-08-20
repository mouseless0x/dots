#!/bin/bash

# Enable notifs
claude config set --global preferredNotifChannel terminal_bell

# Setup Github MCP
claude mcp remove --scope user github
claude mcp add-json --scope user github '{"type": "stdio", "command": "github-mcp-server", "args": ["stdio"], "env": {"GITHUB_PERSONAL_ACCESS_TOKEN":"'$GITHUB_PERSONAL_ACCESS_TOKEN'"}}'

# Setup filesystem MCP
claude mcp remove --scope user filesystem
claude mcp add-json --scope user filesystem '{"type": "stdio", "command": "npx", "args": ["-y", "@modelcontextprotocol/server-filesystem", "/Users/mous/Work/mev", "/Users/mous/Work/pimlico", "/Users/mous/Projects"]}'

# Setup Git MCP
claude mcp remove --scope user git
claude mcp add-json --scope user git '{"type": "stdio", "command": "uvx", "args": ["mcp-server-git"]}'

# Setup Fetch MCP
claude mcp remove --scope user fetch
claude mcp add-json --scope user fetch '{"type": "stdio", "command": "uvx", "args": ["mcp-server-fetch"]}'

# Setup Context7 MCP
claude mcp remove --scope user context7
claude mcp add-json --scope user context7 '{"type": "stdio", "command": "npx", "args": ["-y", "@upstash/context7-mcp"]}'

# Setup Playwright MCP
claude mcp remove --scope user playwright
claude mcp add --scope user playwright npx @playwright/mcp@latest

# Configure allowed tools in ~/.claude/settings.json
SETTINGS="$HOME/.claude/settings.json"
TOOLS='[
  "Read(**)",
  "Glob(**)",
  "Grep(**)",
  "LS(**)",
  "WebSearch(**)",
  "WebFetch(**)",
  "TodoRead()",
  "Task(**)",
  "Bash(git status*)",
  "Bash(git log*)",
  "Bash(git diff*)",
  "Bash(git show*)",
  "Bash(git blame*)",
  "Bash(git branch*)",
  "Bash(git remote -v*)",
  "Bash(git config --get*)",
  "Bash(ls*)",
  "Bash(cat *)",
  "Bash(head*)",
  "Bash(tail*)",
  "Bash(grep*)",
  "Bash(find*)",
  "Bash(tree*)",
  "Bash(pwd*)",
  "Bash(wc*)",
  "Bash(diff *)",
  "Bash(jq*)",
  "Bash(which *)",
  "Bash(echo *)",
  "Bash(* | grep*)",
  "Bash(* | jq*)",
  "Bash(* | head*)",
  "Bash(* | tail*)"
]'

if [ -f "$SETTINGS" ] && command -v jq &> /dev/null; then
    jq --argjson t "$TOOLS" '.permissions.allow = ((.permissions.allow // []) + $t | unique)' "$SETTINGS" > "$SETTINGS.tmp" && mv "$SETTINGS.tmp" "$SETTINGS"
else
    echo '{"permissions": {"allow": '$TOOLS', "deny": []}}' > "$SETTINGS"
fi

echo "Configured allowed tools in ~/.claude/settings.json"
