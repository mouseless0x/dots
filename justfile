# Install everything
install-all: tmux alacritty nvim

# Install tmux configuration
tmux:
  cp ./.tmux.conf ~/.tmux.conf

# Install alacritty configuration
alacritty:
  cp -R ./config/alacritty ~/.config

# Install starship.rs configuration
starship:
  cp ./config/starship.toml ~/.config/starship.toml

# Install custom shell scripts
bin:
  cp -r ./bin ~/.local/bin

# Install the nvim configuration
nvim:
  rm -rf ~/.config/nvim
  cp -R ./config/nvim ~/.config
