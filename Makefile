SHELL := /bin/bash

.PHONY: install build dev

install:
	mkdir -p ~/.vim
	ln -sf $(realpath zshrc) $(HOME)/.zshrc
	ln -sf $(realpath vimrc) $(HOME)/.vimrc
	ln -sf $(realpath vimrc.bundles) $(HOME)/.vim/vimrc.bundles

build:
	docker build -t rzane/dotfiles .

dev:
	docker run --rm -it \
		-v "$(PWD):/root/.dotfiles" \
		--entrypoint /root/.dotfiles/docker-entrypoint.sh \
		rzane/dotfiles zsh
