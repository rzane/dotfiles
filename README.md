# dotfiles

Run the following command in whichever directory you usually keep your source code:

    $ git clone https://github.com/rzane/dotfiles && cd dotfiles && make

You can install specific sets of dotfiles like so:

    $ make install.vim
    $ make install.zsh
    $ make install.git

### ZSH

Make sure `zsh` is your shell, because it is the best. Don't argue with me.

If you're on a mac, you can start using ZSH like this:

    $ brew install zsh && which zsh | sudo tee -a /etc/shells && chsh -s $(which zsh)
