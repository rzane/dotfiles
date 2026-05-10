#!/bin/bash

set -euo pipefail

dotfiles=$(realpath "$(dirname "$0")")

append() {
  grep -qF -- "$1" "$2" || echo "$1" >> "$2"
}

# Zsh
if [ -L "$HOME/.zshrc" ] && [ "$(readlink "$HOME/.zshrc")" = "$dotfiles/zsh/zshrc" ]; then
  rm "$HOME/.zshrc"
  test -f "$HOME/.zshrc.local" && mv "$HOME/.zshrc.local" "$HOME/.zshrc"
fi

touch "$HOME/.zshrc"
append "source \"$dotfiles/zsh/zshrc\"" "$HOME/.zshrc"

# Git
git config --global include.path "$dotfiles/git/gitconfig"

# NeoVim
mkdir -p "$HOME/.config/nvim"
ln -sf "$dotfiles/nvim/init.lua" "$HOME/.config/nvim/init.lua"
ln -sfn "$dotfiles/nvim/lua" "$HOME/.config/nvim/lua"

# Zed
mkdir -p "$HOME/.config/zed"
ln -sf "$dotfiles/zed/settings.json" "$HOME/.config/zed/settings.json"
ln -sf "$dotfiles/zed/keymap.json" "$HOME/.config/zed/keymap.json"
