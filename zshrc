source ~/.dotfiles/shell/bundles.sh
source ~/.dotfiles/shell/init.sh
source ~/.dotfiles/shell/aliases.sh

if [ -e ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
