# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Set project paths for project jump
PROJECT_PATHS=(~/Workspace)

# Load Kiex for Elixir
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# Load RVM for Ruby
test -s "$HOME/.rvm/scripts/rvm" && source "$HOME/.rvm/scripts/rvm"
