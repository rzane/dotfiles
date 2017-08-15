SHELL := /bin/bash

.PHONY: install build dev

install:
	ln -sf $(realpath zshrc) $(HOME)/.zshrc
	ln -sf $(realpath vimrc.local) $(HOME)/.vimrc.local
	ln -sf $(realpath vimrc.bundles.local) $(HOME)/.vimrc.bundles.local
	ln -sf $(realpath nvimrc) $(HOME)/.config/nvim/init.vim
	bash < <(curl -Ls https://github.com/promptworks/promptworks.vim/raw/master/setup.sh)

build:
	docker build -t rzane/dotfiles .

dev:
	docker run --rm -it \
		-v "$(PWD):/root/.dotfiles" \
		--entrypoint /root/.dotfiles/docker-entrypoint.sh \
		rzane/dotfiles zsh
