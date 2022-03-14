## Modulos
zmodload -i zsh/complist
autoload -Uz compinit

## Cache
ZSH_COMPDUMP="$ZDOTDIR/cache/.zcompdump-$HOSTNAME-$(zsh --version | awk '{print $2}')"
compinit -d $ZSH_COMPDUMP
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZDOTDIR/cache"

# Mostrar archivos ocultos
_comp_options+=(globdots)

# Activar menú
zstyle ':completion:*' menu select=2

## Agregar color al autocompletado
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

## Sensibilidad a Mayusculas
zstyle ':completion:*' matcher-list 'm:{a-zA-z}={A-Za-z}'

# Tolerancia a errores
zstyle ':completion:*' completer _complete _correct _approximate
# 1 error por cada 3 caracteres
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

## Complementos al usar kill
zstyle ':completion:*:processes' command 'ps -ax'
zstyle ':completion:*:processes-names' command 'ps -aeo comm='

##zstyle ':completion::*:kill:*:*' command 'ps xf -U $USER -o pid,%cpu,cmd'
zstyle ':completion::*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*:process-groups' hidden true

## Complementos para killall
zstyle ':completion:*:*:killall:*:processes-names' list-colors '=(#b) #([0-9]#)*=0=01;31'
## zstyle ':completion:*:killall:*' command 'ps -u $USER -o cmd'
zstyle ':completion:*:*:killall:*' menu yes select

## Problemas con urls
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
unsetopt nomatch

## Saltar a un directorio sin usar 'cd'
setopt auto_cd
