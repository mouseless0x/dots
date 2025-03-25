# Dotfiles

My cross-platform development environment configuration files.

# Dependencies

## Cross-Platform

### Terminal

- [alacritty](https://github.com/alacritty/alacritty) - GPU-accelerated terminal emulator
- [fish](https://fishshell.com/) - User-friendly shell
    - [fisher](https://github.com/jorgebucaran/fisher) - Plugin manager
- [starship.rs](https://starship.rs/) - Cross-shell prompt
- [tmux](https://github.com/tmux/tmux/wiki) - Terminal multiplexer
    - [tpm](https://github.com/tmux-plugins/tpm) - Plugin manager
- [fzf](https://github.com/junegunn/fzf) - Command-line fuzzy finder

### Editor

- [neovim](https://github.com/neovim/neovim) - Hyperextensible Vim-based editor

### CLI Tools

- [lazygit](https://github.com/jesseduffield/lazygit) - Terminal UI for git
- [just](https://github.com/casey/just) - Command runner

### Development

- [foundry](https://github.com/foundry-rs) - Ethereum development toolkit
- [huff-rs](https://github.com/huff-language/huff-rs) - Low-level Ethereum programming language

## macOS Specific

- [yabai](https://github.com/koekeishiya/yabai) - Tiling window manager
- [skhd](https://github.com/koekeishiya/skhd) - Hotkey daemon

## Linux Specific

- [hyprland](https://hyprland.org/) - Dynamic tiling Wayland compositor
- [waybar](https://github.com/Alexays/Waybar) - Wayland bar
- [anyrun](https://github.com/Kirottu/anyrun) - Wayland launcher
- [keyd](https://github.com/rvaiya/keyd) - Key remapping daemon

# Installation

## Full Installation

Cross-platform configs:
```bash
just common
```

OS-specific configs:
```bash
# Linux
just linux

# macOS
just osx
```

## Individual Components

Install specific configs:
```bash
just nvim
just fish
just tmux
just alacritty
# etc.
```

# Acknowledgement

- [clabby/dots](https://github.com/clabby/dots/tree/main), goated configs
