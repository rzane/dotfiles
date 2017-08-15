# Git
alias gs='git status'

grb () {
  git checkout master
  git pull
  git checkout -
  git rebase master
}

# Docker
alias d='docker-compose'
alias dr='docker-compose run'
