SHELL := /bin/bash
ZSH := $(shell which zsh)

.PHONY: install
install: nvim zsh git kitty zed

.PHONY: nvim
nvim:
	mkdir -p $(HOME)/.config/nvim
	ln -sf $(realpath nvim/init.lua) $(HOME)/.config/nvim/init.lua
	ln -sf $(realpath nvim/lua) $(HOME)/.config/nvim/lua

.PHONY: zsh
zsh:
	ln -sf $(realpath zsh/zshrc) $(HOME)/.zshrc

.PHONY: git
git:
	git config --global include.path $(realpath git/gitconfig)

.PHONY: kitty
kitty:
	mkdir -p $(HOME)/.config/kitty
	ln -sf $(realpath kitty/kitty.conf) $(HOME)/.config/kitty/kitty.conf
	ln -sf $(realpath kitty/open-actions.conf) $(HOME)/.config/kitty/open-actions.conf

.PHONY: zed
zed:
	mkdir -p $(HOME)/.config/zed
	ln -sf $(realpath zed/settings.json) $(HOME)/.config/zed/settings.json
	ln -sf $(realpath zed/keymap.json) $(HOME)/.config/zed/keymap.json
