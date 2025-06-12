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