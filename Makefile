SHELL := /bin/bash
ZSH := $(shell which zsh)

ifeq ($(shell uname -s), Darwin)
	VSCODE := $(HOME)/Library/Application\ Support/Code/User
else
	VSCODE := $(HOME)/.config/Code/User
endif

.PHONY: install
install: vim zsh git vscode kitty

.PHONY: vim
vim:
	mkdir -p $(HOME)/.vim
	mkdir -p $(HOME)/.config/nvim
	ln -sf $(realpath vim/vimrc) $(HOME)/.vimrc
	ln -sf $(realpath vim/vimrc.bundles) $(HOME)/.vim/vimrc.bundles
	ln -sf $(realpath vim/init.vim) $(HOME)/.config/nvim/init.vim

.PHONY: zsh
zsh:
	ln -sf $(realpath zsh/zshrc) $(HOME)/.zshrc

.PHONY: git
git:
	ln -sf $(realpath git/gitconfig) $(HOME)/.gitconfig

.PHONY: vscode
vscode:
	mkdir -p $(VSCODE)
	ln -sf $(realpath vscode/settings.json) $(VSCODE)/settings.json
	ln -sf $(realpath vscode/keybindings.json) $(VSCODE)/keybindings.json
	cat vscode/extensions.txt | xargs printf -- '--install-extension %s\n' | xargs code

.PHONY: kitty
kitty:
	ln -sf $(realpath kitty/kitty.conf) $(HOME)/.config/kitty/kitty.conf
