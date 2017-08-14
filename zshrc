source ~/.dotfiles/shell/init.sh
source ~/.dotfiles/shell/bundles.sh
source ~/.dotfiles/shell/aliases.sh

# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Set project paths for project jump
PROJECT_PATHS=(~/Workspace)
