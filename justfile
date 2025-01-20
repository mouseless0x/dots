# Install everything
install-all: tmux alacritty starship bin yabai nvim fish

arch: install-all fonts-linux
osx: install-all fonts-osx

# Install tmux configuration
tmux:
  cp -r ./config/tmux ~/.config

# Install alacritty configuration
alacritty:
  cp -r ./config/alacritty ~/.config

# Install starship.rs configuration
starship:
  cp ./config/starship.toml ~/.config/starship.toml

# Install fish
# rm -rf ~/.config/fish
fish:
  rm -rf ~/.config/fish
  cp -r ./config/fish ~/.config

# Install custom shell scripts
bin:
  cp -r ./bin ~/.local/bin

# Install yabai + skhd
yabai:
  cp -r ./config/yabai ~/.config/yabai
  cp -r ./config/skhd ~/.config/skhd

# Install the nvim configuration
nvim:
  rm -rf ~/.config/nvim
  cp -R ./config/nvim ~/.config

fonts-linux:
    rm -rf /usr/share/fonts

fonts-osx:
    rm -rf ~/Library/Fonts
    cp -R ./config/fonts ~/Library/Fonts
