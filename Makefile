.PHONY: install build dev

install:
	ln -sf $(PWD)/zshrc $(HOME)/.zshrc

build:
	docker build -t rzane/dotfiles .

dev:
	docker run --rm -it \
		-v "$(PWD):/root/.dotfiles" \
		--entrypoint /root/.dotfiles/docker-entrypoint.sh \
		rzane/dotfiles zsh
