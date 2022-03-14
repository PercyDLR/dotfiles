# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###### Configuracion básica:

## Historial
HISTFILE=$ZDOTDIR/history
SAVEHIST=10000
HISTSIZE=12000
setopt share_history extended_history hist_no_store hist_ignore_all_dups hist_ignore_space

## Completado
source $ZDOTDIR/completition.zsh

## Alias
source $ZDOTDIR/aliases.zsh

## Funciones
source $ZDOTDIR/funciones.zsh

## Modificar PATH
add_to_path "/home/percy/.local/bin"
export PATH

## Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

## Tema
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
## To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

## Neofetch
neofetch
