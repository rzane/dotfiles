#!/bin/bash

set -e

repo=https://github.com/asdf-vm/asdf.git
plugins=(nodejs ruby elixir python)

echo "===>> Installing ASDF..."
if [ -d ~/.asdf ]; then
  printf "Skipping\n\n"
else
  git clone "$repo" ~/.asdf
  cd ~/.asdf
  git checkout "$(git describe --abbrev=0)"
  printf "Done\n\n"
fi

source ~/.asdf/asdf.sh

for plugin in "${plugins[@]}"; do
  echo "===>> Installing plugin $plugin..."

  if asdf plugin-list 2>/dev/null | grep -q "$plugin"; then
    printf "Skipping\n\n"
  else
    asdf plugin-add "$plugin"
    printf "Done\n\n"
  fi
done

for plugin in "${plugins[@]}"; do
  version="$(asdf list-all "$plugin" | grep '^\d' | grep -v 'dev\|preview\|rc' | tail -1)"

  echo "===>> Installing $plugin $version..."
  if asdf list "$plugin" 2>/dev/null | grep -q "$version"; then
    printf "Skipping\n\n"
  else
    asdf install "$plugin" "$version"
    asdf global "$plugin" "$version"
    printf "Done\n\n"
  fi
done
