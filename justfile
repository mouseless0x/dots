# Install everything
install-all: tmux alacritty starship bin yabai nvim

# Install tmux configuration
tmux:
  cp -r ./config/tmux ~/.config

# Install alacritty configuration
alacritty:
  cp -r ./config/alacritty ~/.config

# Install starship.rs configuration
starship:
  cp ./config/starship.toml ~/.config/starship.toml

# Install custom shell scripts
bin:
  cp -r ./bin ~/.local/bin

# Install yabai + skhd
yabai:
  cp -r ./config/yabai ~/.config/yabai
  cp -r ./config/skhd ~/.config/skhd

# Install fish
fish:
  cp -r ./config/fish ~/.config/fish

# Install the nvim configuration
nvim:
  rm -rf ~/.config/nvim
  cp -R ./config/nvim ~/.config
