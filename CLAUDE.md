# CLAUDE.md - Dotfiles Repository Guide

## Commands
- Install all configs: `just common` (or `just linux` or `just osx`)
- Install specific config: `just nvim`, `just fish`, `just tmux`, etc.
- Neovim formatter: `<leader>f` (format current buffer)

## Code Style Guidelines
- **Indentation**: 4 spaces default, 2 spaces for .tsx, .sql files
- **Line Endings**: Trim trailing whitespace on save (automatic)
- **Lua Linting**: Using stylua for formatting
- **Format on Save**: Enabled for supported file types via null-ls
- **Naming**: Use snake_case for variable and function names in lua
- **Comments**: Descriptive comments for config sections
- **Line Length**: Avoid excessive line wrapping (wrap=false)

## Structure
- `/config/common/` - Cross-platform configurations (nvim, fish, tmux, etc.)
- `/config/linux/` - Linux-specific configs (hyprland, waybar)
- `/config/osx/` - macOS-specific configs (yabai, skhd)
- `/bin/` - Custom shell scripts