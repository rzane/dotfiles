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

ASDF is an all-in-one version manager, and it's great.

    $ brew install asdf
    $ asdf plugin-add ruby
    $ asdf plugin-add python
    $ asdf plugin-add elixir
    $ asdf plugin-add nodejs

For Node.js, you'll also need to run:

    $ bash /usr/local/opt/asdf/plugins/nodejs/bin/import-release-team-keyring

Now, you can list available versions:

    $ asdf list-all <language>

To install a version:

    $ asdf install <language> <version>

To set a given version as the default:

    $ asdf global <language> <version>
