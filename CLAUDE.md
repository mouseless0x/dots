# CLAUDE.md - Dotfiles Repository Guide

## Commands
- Install all configs: `just common` (or `just linux` or `just osx`)
- Install specific config: `just nvim`, `just fish`, `just tmux`, etc.
- Install Claude MCP servers: `just claude`
- Neovim formatter: `<leader>f` (format current buffer)

## Claude MCP Setup

### Prerequisites
1. Create `.env` file in `config/common/claude/` with your GitHub token:
   ```
   GITHUB_PERSONAL_ACCESS_TOKEN=your_github_pat_here
   ```

### Installation
Run `just claude` to configure the following MCP servers:
- **GitHub MCP**: Access to GitHub repositories and issues
- **Filesystem MCP**: Access to `/Users/mous/Work/mev`, `/Users/mous/Work/pimlico`, and `/Users/mous/Projects`
- **Git MCP**: Git operations in allowed directories
- **Fetch MCP**: Web fetching capabilities

## Code Style Guidelines
- **Indentation**: 4 spaces default, 2 spaces for .tsx, .sql files
- **Line Endings**: Trim trailing whitespace on save (automatic)
- **Lua Linting**: Using stylua for formatting
- **Format on Save**: Enabled for supported file types via null-ls
- **Naming**: Use snake_case for variable and function names in lua
- **Comments**: Descriptive comments for config sections
- **Line Length**: Avoid excessive line wrapping (wrap=false)
- Don't tag yourself in commit messages

## Neovim Setup

### Plugin Manager
- **Lazy.nvim** - Modern plugin manager with lazy loading and automatic installation
- Plugin lock file: `lazy-lock.json` for version consistency

### Key Bindings
- **Leader**: Space
- **Exit insert mode**: `jk` (ESC mapped to backtick)
- **Window management**: `s` prefix (`sh`/`sv` for splits, `s+hjkl` for navigation)
- **File navigation**: `;f` (find files), `;r` (live grep), `;b` (buffers)
- **File explorer**: `-` (opens Oil.nvim in parent directory)
- **Format**: `<leader>f` (format current buffer)
- **LSP**: `gd` (definition), `gr` (references), `K` (hover), `gl` (code actions)

### Core Plugins
- **Navigation**: Telescope (fuzzy finder), Harpoon2 (bookmarks), Oil.nvim (file explorer)
- **LSP/Completion**: blink.cmp, conform.nvim (formatting)
- **Language-specific**: typescript-tools.nvim, rustaceanvim
- **UI**: tokyonight theme, lualine statusline, neo-tree sidebar
- **AI Assistants**: avante.nvim (Claude chat), claude-code, super-maven
- **Git**: gitsigns, lazygit integration

### LSP Configuration
- **Enabled servers**: lua_ls, bashls, solidity_ls_nomicfoundation, marksman
- **Formatters**: stylua (Lua), biome (JS/TS), forge_fmt (Solidity), taplo (TOML)
- **Features**: Inlay hints, code actions, diagnostics, auto-format on save

### Editor Settings
- **Indentation**: 4 spaces default, 2 spaces for .tsx/.sql
- **Line numbers**: Relative + absolute hybrid
- **Persistent undo**: Stored in `~/.cache/nvim/undodir`
- **Auto-save**: All buffers when saving any buffer
- **Trim whitespace**: Automatic on save

## Structure
- `/config/common/` - Cross-platform configurations (nvim, fish, tmux, etc.)
- `/config/linux/` - Linux-specific configs (hyprland, waybar)
- `/config/osx/` - macOS-specific configs (yabai, skhd)
- `/bin/` - Custom shell scripts
