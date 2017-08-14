.PHONY: install build dev

link:
ifneq ($(realpath .), $(HOME)/.dotfiles)
	ln -sf $(realpath .) ~/.dotfiles
endif

install: link
	ln -sf ~/.dotfiles/zshrc $(HOME)/.zshrc

build:
	docker build -t rzane/dotfiles .

dev:
	docker run --rm -it \
		-v "$(PWD):/root/.dotfiles" \
		--entrypoint /root/.dotfiles/docker-entrypoint.sh \
		rzane/dotfiles zsh
