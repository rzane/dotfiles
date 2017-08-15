FROM alpine

WORKDIR /root/.dotfiles

RUN apk --no-cache add coreutils bash zsh make curl git vim

CMD ["zsh"]
