SHELL := /bin/bash

.PHONY: install build dev

install:
	mkdir -p $(HOME)/.vim $(HOME)/.config/nvim
	ln -sf $(realpath zshrc) $(HOME)/.zshrc
	ln -sf $(realpath vimrc) $(HOME)/.vimrc
	ln -sf $(realpath vimrc.bundles) $(HOME)/.vim/vimrc.bundles
	ln -sf $(realpath nvimrc) $(HOME)/.config/nvim/init.vim
	ln -sf $(realpath gitconfig) $(HOME)/.gitconfig

build:
	docker build -t rzane/dotfiles .

dev:
	docker run --rm -it \
		-v "$(PWD):/root/.dotfiles" \
		--entrypoint /root/.dotfiles/docker-entrypoint.sh \
		rzane/dotfiles zsh
