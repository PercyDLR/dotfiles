## Edicion de .zshrc
alias zedit="vim $ZDOTDIR/.zshrc"
alias zsource="source $ZDOTDIR/.zshrc"
alias aedit="vim $ZDOTDIR/aliases.zsh"

## Aliases para ls
alias ls="colorls"
alias la="colorls -A"
alias l="colorls -Al"

## Vim
alias -g vim="nvim"

## Git
alias ga="git add"
alias gr="git rm"
alias gm="git mv"
alias gs="git status"
alias gcl="git clone"
alias gcm="git commit"
alias gpl="git pull"
alias gps="git push"
alias gl="git log --pretty=format:'%h - %an, %ar : %s' --graph"

## Dotfiles
alias dot="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
