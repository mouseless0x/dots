#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Define required packages
PACKAGES=(
    "hyprland"
    "hyprpaper"
    "hypridle"
    "hyprlock"
    "waybar"
    "keyd"
    "fish"
    "tmux"
    "alacritty"
    "starship"
    "neovim"
    "lazygit"
    "wl-clipboard"
    "openssh"
)

echo -e "${YELLOW}Checking for required packages...${NC}"

# Check for missing packages
MISSING_PACKAGES=()
for pkg in "${PACKAGES[@]}"; do
    if ! pacman -Qi "$pkg" &>/dev/null; then
        MISSING_PACKAGES+=("$pkg")
    fi
done

# Install missing packages if any
if [ ${#MISSING_PACKAGES[@]} -gt 0 ]; then
    echo -e "${RED}Missing packages:${NC} ${MISSING_PACKAGES[*]}"
    echo -e "${YELLOW}Installing missing packages...${NC}"
    sudo pacman -S --needed "${MISSING_PACKAGES[@]}"

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}All packages installed successfully!${NC}"
    else
        echo -e "${RED}Failed to install some packages${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}All required packages are already installed${NC}"
fi
