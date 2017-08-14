if [ ! -e ~/antigen.zsh  ]; then
  echo "Installing antigen..."
  curl -L git.io/antigen > ~/antigen.zsh
fi

source ~/antigen.zsh

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
