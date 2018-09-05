SHELL := /bin/bash

.PHONY: install build dev

install: install.vim install.zsh install.git

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

build:
	docker build -t rzane/dotfiles .

dev:
	docker run --rm -it \
		-v "$(PWD):/root/.dotfiles" \
		--entrypoint /root/.dotfiles/docker-entrypoint.sh \
		rzane/dotfiles zsh
