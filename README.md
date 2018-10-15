# dotfiles

Install homebrew:

    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Run the following command in whichever directory you usually keep your source code:

    $ git clone https://github.com/rzane/dotfiles
    $ cd dotfiles
    $ brew bundle
    $ make

You can install specific sets of dotfiles like so:

    $ make vim
    $ make zsh
    $ make git
    $ make vscode

### ZSH

Make sure `zsh` is your shell, because it is the best. Don't argue with me.

If you're on a mac, you can start using ZSH like this:

    $ brew install zsh
    $ which zsh | sudo tee -a /etc/shells
    $ chsh -s $(which zsh)

### ASDF

ASDF is an all-in-one version manager, and it's great. I have a convenience script for installing the latest Node.js, Ruby, Python, and Elixir.

    $ bash scripts/stackup.sh

After it finishes, you'll need to boot ASDF in your dotfiles:

    $ echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bash_profile
    $ echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bash_profile

To install a version:

    $ asdf install <language> <version>

To set a given version as the default:

    $ asdf global <language> <version>
