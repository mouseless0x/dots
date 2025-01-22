# Install everything
# install-all: tmux alacritty starship bin yabai nvim fish

common: tmux alacritty starship fish bin nvim
linux: common fonts-linux hyprland waybar
osx: common fonts-osx yabai

# /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
# /*                       COMMON                               */
# /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

# Install tmux configuration
tmux:
  cp -r ./config/common/tmux ~/.config

# Install alacritty configuration
alacritty:
  cp -r ./config/common/alacritty ~/.config

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

# /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
# /*                        LINUX                               */
# /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

fonts-linux:
    rm -rf ~/.local/share/fonts
    cp -R ./config/fonts ~/.local/share/fonts

hyprland:
    rm -rf ~/.config/hypr
    cp -R ./config/linux/hypr/ ~/.config/

waybar:
    rm -rf ~/.config/waybar
    cp -R ./config/linux/waybar ~/.config

# /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
# /*                         OSX                                */
# /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/

fonts-osx:
    rm -rf ~/Library/Fonts
    cp -R ./config/fonts ~/Library/Fonts

# yabai + skhd
yabai:
  cp -r ./config/osx/yabai ~/.config/yabai
  cp -r ./config/osx/skhd ~/.config/skhd
