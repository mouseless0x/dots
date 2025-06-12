# Install everything
# install-all: tmux alacritty starship bin yabai nvim fish

common: tmux alacritty ghostty starship fish bin nvim lazygit
# Define OS-specific variable
os := `uname`

linux: common fonts-linux hyprland waybar xdg keyd anyrun #linux-remap
osx: common fonts-osx yabai sketchybar

# /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
# /*                       COMMON                               */
# /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

# Install tmux configuration
tmux:
  cp -r ./config/common/tmux ~/.config
  if [ "{{os}}" = "Darwin" ]; then echo "Using macOS tmux plugin path"; else echo "Using Linux tmux plugin path"; fi

# Install alacritty configuration
alacritty:
  cp -r ./config/common/alacritty ~/.config

# Install ghostty configuration
ghostty:
  mkdir -p ~/.config/ghostty
  cp ./config/common/ghostty/config ~/.config/ghostty/

# Install starship.rs configuration
starship:
  cp ./config/common/starship.toml ~/.config/starship.toml

# Install fish
# rm -rf ~/.config/fish
fish:
  rm -rf ~/.config/fish
  cp -r ./config/common/fish ~/.config

# Install custom shell scripts
bin:
  rm -rf ~/.local/bin
  cp -r ./bin ~/.local/

# Install the nvim configuration
nvim:
  rm -rf ~/.config/nvim
  cp -R ./config/common/nvim ~/.config

# Install lazygit configuration
lazygit:
  if [ "{{os}}" = "Darwin" ]; then \
    mkdir -p ~/Library/Application\ Support/lazygit && \
    cp ./config/common/lazygit/config.yml ~/Library/Application\ Support/lazygit/; \
  else \
    mkdir -p ~/.config/lazygit && \
    cp ./config/common/lazygit/config.yml ~/.config/lazygit/; \
  fi

# Install claude configuration
claude:
  set -a; source ./config/common/claude/.env; set +a; bash ./config/common/claude/init.sh

# /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
# /*                        LINUX                               */
# /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

fonts-linux:
    rm -rf ~/.local/share/fonts
    cp -R ./config/fonts ~/.local/share/fonts

hyprland:
    rm -rf ~/.config/hypr
    cp -R ./config/linux/hypr/ ~/.config/
    hyprctl reload || echo "Hyprland not running, skipping reload"

waybar:
    rm -rf ~/.config/waybar
    cp -R ./config/linux/waybar ~/.config
    pkill waybar || echo "Waybar not running, skipping kill"
    waybar &

xdg:
    rm -rf ~/.config/user-dirs.dirs
    cp -R ./config/linux/user-dirs.dirs ~/.config

keyd:
    sudo mkdir -p /etc/keyd
    sudo cp -R ./config/linux/keyd/default.conf /etc/keyd/
    sudo systemctl enable --now keyd || echo "keyd service already running"
    echo "Caps Lock has been remapped to Alt"

anyrun:
    mkdir -p ~/.config/anyrun
    cp -R ./config/linux/anyrun/* ~/.config/anyrun/
    # Ensure file permissions are correct
    chmod 644 ~/.config/anyrun/style.css
    chmod 644 ~/.config/anyrun/config.ron
    echo "Anyrun configuration installed"

linux-remap:
    cp -R ./config/linux/input-remapper-2/presets/wilba.tech\ wilba.tech\ WT80-A/remap_caps.json ./config/input-remapper-2/presets/wilba.tech\ wilba.tech\ WT80-A/

# /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
# /*                         OSX                                */
# /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

fonts-osx:
    rm -rf ~/Library/Fonts
    cp -R ./config/fonts ~/Library/Fonts

# yabai + skhd
yabai:
  cp -r ./config/osx/yabai ~/.config
  cp -r ./config/osx/skhd ~/.config

# sketchybar
sketchybar:
  rm -rf ~/config/sketchybar
  cp -r ./config/osx/sketchybar ~/.config
