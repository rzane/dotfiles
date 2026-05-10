#!/bin/bash

set -euo pipefail

# Zsh
ln -sf "$(realpath zsh/zshrc)" "$HOME/.zshrc"

# Git
git config --global include.path "$(realpath git/gitconfig)"

# NeoVim
mkdir -p "$HOME/.config/nvim"
ln -sf "$(realpath nvim/init.lua)" "$HOME/.config/nvim/init.lua"
ln -sfn "$(realpath nvim/lua)" "$HOME/.config/nvim/lua"

# Kitty
mkdir -p "$HOME/.config/kitty"
ln -sf "$(realpath kitty/kitty.conf)" "$HOME/.config/kitty/kitty.conf"
ln -sf "$(realpath kitty/open-actions.conf)" "$HOME/.config/kitty/open-actions.conf"

# Zed
mkdir -p "$HOME/.config/zed"
ln -sf "$(realpath zed/settings.json)" "$HOME/.config/zed/settings.json"
ln -sf "$(realpath zed/keymap.json)" "$HOME/.config/zed/keymap.json"
