SHELL := /bin/bash
ZSH := $(shell which zsh)

ifeq ($(shell uname -s), Darwin)
	VSCODE := $(HOME)/Library/Application\ Support/Code/User
else
	VSCODE := $(HOME)/.config/Code/User
endif

.PHONY: install
install: vim nvim zsh git vscode kitty

.PHONY: nvim
nvim:
	mkdir -p $(HOME)/.config/nvim
	ln -sf $(realpath nvim/init.lua) $(HOME)/.config/nvim/init.lua
	ln -sf $(realpath nvim/lua) $(HOME)/.config/nvim/lua

.PHONY: vim
vim:
	mkdir -p $(HOME)/.vim
	ln -sf $(realpath vim/vimrc) $(HOME)/.vimrc
	ln -sf $(realpath vim/vimrc.bundles) $(HOME)/.vim/vimrc.bundles

.PHONY: zsh
zsh:
	ln -sf $(realpath zsh/zshrc) $(HOME)/.zshrc

.PHONY: git
git:
	git config --global include.path $(realpath git/gitconfig)

.PHONY: vscode
vscode:
	mkdir -p $(VSCODE)
	ln -sf $(realpath vscode/settings.json) $(VSCODE)/settings.json
	ln -sf $(realpath vscode/keybindings.json) $(VSCODE)/keybindings.json
	cat vscode/extensions.txt | xargs printf -- '--install-extension %s\n' | xargs code

.PHONY: kitty
kitty:
	mkdir -p $(HOME)/.config/kitty
	ln -sf $(realpath kitty/kitty.conf) $(HOME)/.config/kitty/kitty.conf
	ln -sf $(realpath kitty/open-actions.conf) $(HOME)/.config/kitty/open-actions.conf
