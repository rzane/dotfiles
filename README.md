# dotfiles

Run the following command in whichever directory you usually keep your source code:

    git clone https://github.com/rzane/dotfiles && cd dotfiles && make

### ZSH

Make sure `zsh` is your shell, because it is the best. Don't argue with me.

If you're on a mac, you can start using ZSH like this:

    brew install zsh && which zsh | sudo tee -a /etc/shells && chsh -s $(which zsh)

### Install VIM 8 (with Lua support for completion)

    brew install vim --with-lua
