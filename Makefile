SHELL := /bin/bash

.PHONY: install build dev

install.vim:
	mkdir -p $(HOME)/.config
	ln -sf $(realpath vim) $(HOME)/.vim
	ln -sf $(realpath vimrc) $(HOME)/.vimrc
	ln -sf $(realpath nvim) $(HOME)/.config/nvim

install.zsh:
	ln -sf $(realpath zshrc) $(HOME)/.zshrc

install.git:
	ln -sf $(realpath gitconfig) $(HOME)/.gitconfig

install: install.vim install.zsh install.git

build:
	docker build -t rzane/dotfiles .

dev:
	docker run --rm -it \
		-v "$(PWD):/root/.dotfiles" \
		--entrypoint /root/.dotfiles/docker-entrypoint.sh \
		rzane/dotfiles zsh
