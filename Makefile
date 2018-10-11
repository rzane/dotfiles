SHELL := /bin/bash

ifeq ($(shell uname -s), Darwin)
	VSCODE := $(HOME)/Library/Application\ Support/Code/User
else
	VSCODE := $(HOME)/.config/Code/User
endif

.PHONY: install build dev

install: install.vim install.zsh install.git install.vscode

install.vim:
	mkdir -p $(HOME)/.vim
	mkdir -p $(HOME)/.config/nvim
	ln -sf $(realpath vimrc) $(HOME)/.vimrc
	ln -sf $(realpath vim/vimrc.bundles) $(HOME)/.vim/vimrc.bundles
	ln -sf $(realpath nvim/init.vim) $(HOME)/.config/nvim/init.vim

install.zsh:
	ln -sf $(realpath zshrc) $(HOME)/.zshrc

install.git:
	ln -sf $(realpath gitconfig) $(HOME)/.gitconfig

install.vscode:
	@while read -r ext; do code --install-extension "$$ext"; done < vscode/extensions.txt
	ln -sf $(realpath vscode/settings.json) $(VSCODE)/settings.json
	ln -sf $(realpath vscode/keybindings.json) $(VSCODE)/keybindings.json
