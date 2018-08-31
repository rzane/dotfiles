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

test -s "$HOME/.asdf/asdf.sh" && source "$HOME/.asdf/asdf.sh"
test -s "$HOME/.asdf/completions/asdf.bash" && source "$HOME/.asdf/completions/asdf.bash"

########################
# Aliases
########################

alias vim=nvim
alias cat=bat
alias preview="fzf --preview 'bat --color \"always\" {}'"

# Open fzf file with vscode
export FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(code {})+abort'"

# Git
alias gs='git status'

grb () {
  git checkout master
  git pull
  git checkout -
  git rebase master
}

git-clean-branches () {
  git branch --merged master | egrep -v "(^\*|master)" | xargs git branch -d
}

# Docker
alias d='docker-compose'
alias dr='docker-compose run'

# Find/replace
gsub () {
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
