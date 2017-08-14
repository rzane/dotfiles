FROM alpine

WORKDIR /root/.dotfiles

RUN apk --no-cache add bash zsh make curl git

CMD ["zsh"]
