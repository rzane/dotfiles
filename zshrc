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

git-clean-branches () {
  git branch -d $(git branch --merged master | grep -v master)

  echo
  echo "The following unmerged branches remain:"
  git branch --no-merged master
}

# Docker
alias d='docker-compose'
alias dr='docker-compose run'

docker-clean () {
  docker rm --force $(docker ps -qa)
  docker rmi --force $(docker images -qa)
}

# Find/replace

ag-replace () {
  if [ "$1" = "--commit" ]; then
    find . -type f -name "*.bak" -delete
  elif [ "$1" = "--revert" ]; then
    find . -type f -name "*.bak" -exec rename -f 's/\.bak$//' {} \;
  else
    ag -0 -l "$1" "${@:3}" | xargs -0 perl -pi.bak -e "s/$1/$2/g"
  fi
}

########################
# Customization
########################

if [ -e ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi
