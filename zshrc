if [ ! -e ~/antigen.zsh  ]; then
  echo "Installing antigen..."
  curl -L git.io/antigen > ~/antigen.zsh
fi

source ~/antigen.zsh

########################
# Packages
########################

antigen use oh-my-zsh
antigen bundle rvm
antigen bundle nvm
antigen bundle vi-mode
antigen bundle web-search
antigen bundle pj
antigen bundle z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen apply

########################
# Keybindings
########################

# zsh-history-substring-search configuration
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

########################
# Environment
########################

# Set project paths for project jump
PROJECT_PATHS=(~/Workspace)

# Load Kiex for Elixir
test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"

# Load RVM for Ruby
test -s "$HOME/.rvm/scripts/rvm" && source "$HOME/.rvm/scripts/rvm"

########################
# Aliases
########################

# Git
alias gs='git status'

grb () {
  git checkout master
  git pull
  git checkout -
  git rebase master
}

# Docker
alias d='docker-compose'
alias dr='docker-compose run'

docker-clean () {
  docker rm --force $(docker ps -qa)
  docker rmi --force $(docker images -qa)
}

########################
# Customization
########################

if [ -e ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
