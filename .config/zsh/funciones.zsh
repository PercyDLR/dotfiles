## Agrega una ruta a PATH si no existe
add_to_path () {
    if ! grep -q "$1" <<< "$PATH" ; then
        path+=($1)
    fi
}

## Sube N directorios
up () {
    re='^[0-9]+$'

    if [[ -z $1 ]]; then
        saltos=1
    elif ! [[ $1 =~ $re ]] ; then
        echo "error: Debe ingresar un número"
        exit 1
    else
        saltos=$1
    fi

    ruta=$(pwd)
    for (( i=1;i<=saltos;i++ )) ; do
        ruta=$ruta/..
    done

    cd $ruta
}

## Va a al inicio de la linea con [Ctrl+e]
function __ir_al_inicio () { CURSOR=0 }

zle -N       __ir_al_inicio
bindkey '^e' __ir_al_inicio

## Va a al final de la linea con [Ctrl+f]
function __ir_al_final () { CURSOR=${#BUFFER} }

zle -N       __ir_al_final
bindkey '^f' __ir_al_final

## Agrega sudo a un comando con [Ctrl+a]
__add_sudo () {
    prefix="sudo"
    BUFFER="$prefix $BUFFER"
    CURSOR=$(($CURSOR + ${#prefix} + 1))
}
zle -N       __add_sudo
bindkey '^a' __add_sudo
