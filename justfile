# Install everything
# install-all: tmux alacritty starship bin yabai nvim fish

common: tmux alacritty ghostty starship fish bin nvim lazygit
# Define OS-specific variable
os := `uname`

linux: ensure-packages common fonts-linux hyprland waybar xdg keyd walker #linux-remap
osx: common fonts-osx yabai sketchybar

# /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
# /*                       COMMON                               */
# /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

# Install tmux configuration
tmux:
  cp -r ./config-common/tmux ~/.config
  if [ "{{os}}" = "Darwin" ]; then echo "Using macOS tmux plugin path"; else echo "Using Linux tmux plugin path"; fi

# Install alacritty configuration
alacritty:
  cp -r ./config-common/alacritty ~/.config

# Install ghostty configuration
ghostty:
  mkdir -p ~/.config/ghostty
  cp ./config-common/ghostty/config ~/.config/ghostty/

# Install starship.rs configuration
starship:
  cp ./config-common/starship.toml ~/.config/starship.toml

# Install fish
# rm -rf ~/.config/fish
fish:
  rm -rf ~/.config/fish
  cp -r ./config-common/fish ~/.config

# Install custom shell scripts
bin:
  cp -r ./bin ~/.local/

# Install the nvim configuration
nvim:
  rm -rf ~/.config/nvim
  cp -R ./config-common/nvim ~/.config

# Install lazygit configuration
lazygit:
  if [ "{{os}}" = "Darwin" ]; then \
    mkdir -p ~/Library/Application\ Support/lazygit && \
    cp ./config-common/lazygit/config.yml ~/Library/Application\ Support/lazygit/; \
  else \
    mkdir -p ~/.config/lazygit && \
    cp ./config-common/lazygit/config.yml ~/.config/lazygit/; \
  fi

# Install claude configuration
claude:
  set -a; source ./config-common/claude/.env; set +a; bash ./config-common/claude/init.sh
  mkdir -p ~/.claude/commands
  cp -r ./config-common/claude/commands/* ~/.claude/commands/ 2>/dev/null || true

# /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
# /*                        LINUX                               */
# /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

# Ensure required packages are installed
ensure-packages:
    @bash ./config-linux/ensure-packages.sh

fonts-linux:
    rm -rf ~/.local/share/fonts
    cp -R ./fonts ~/.local/share/fonts

hyprland:
    rm -rf ~/.config/hypr
    cp -R ./config-linux/hypr/ ~/.config/
    rm -rf ~/.config/wallpapers
    cp -R ./config-linux/wallpapers ~/.config/
    hyprctl reload || echo "Hyprland not running, skipping reload"

waybar:
    rm -rf ~/.config/waybar
    cp -R ./config-linux/waybar ~/.config
    pkill waybar || echo "Waybar not running, skipping kill"
    waybar &

xdg:
    rm -rf ~/.config/user-dirs.dirs
    cp -R ./config-linux/user-dirs.dirs ~/.config

keyd:
    sudo mkdir -p /etc/keyd
    sudo cp -R ./config-linux/keyd/default.conf /etc/keyd/
    sudo systemctl enable --now keyd
    echo "Caps Lock has been remapped to Alt"

walker:
    elephant service enable
    systemctl --user enable elephant.service
    echo "Walker configuration installed"

ssh:
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    cp ./config-linux/ssh/authorized_keys ~/.ssh/
    chmod 600 ~/.ssh/authorized_keys
    sudo cp ./config-linux/ssh/sshd_config /etc/ssh/sshd_config
    sudo systemctl enable --now sshd
    echo "SSH configured with public key authentication"

linux-remap:
    cp -R ./config-linux/input-remapper-2/presets/wilba.tech\ wilba.tech\ WT80-A/remap_caps.json ./config/input-remapper-2/presets/wilba.tech\ wilba.tech\ WT80-A/

# /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
# /*                         OSX                                */
# /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

fonts-osx:
    rm -rf ~/Library/Fonts
    cp -R ./fonts ~/Library/Fonts

# yabai + skhd
yabai:
  cp -r ./config-osx/yabai ~/.config
  cp -r ./config-osx/skhd ~/.config

# sketchybar
sketchybar:
  rm -rf ~/config/sketchybar
  cp -r ./config-osx/sketchybar ~/.config
