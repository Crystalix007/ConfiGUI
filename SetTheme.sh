#! /bin/bash

expand_tilde()
{
    case "$1" in
    (\~)        echo "$HOME";;
    (\~/*)      echo "$HOME/${1#\~/}";;
    (\~[^/]*/*) local user=$(eval echo ${1%%/*})
                echo "$user/${1#*/}";;
    (\~[^/]*)   eval echo ${1};;
    (*)         echo "$1";;
    esac
}

if [ $# -ne 1 ]; then
	echo "Usage: ${BASH_SOURCE} /path/to/wallpaper"
	exit -1
fi

wallPath=$(expand_tilde "$1")

if [ ! -f "${wallPath}" ] && [ ! -L "${wallPath}" ]; then
	echo "Wallpaper '${wallPath}' must exist"
	exit -1
fi

if ! wal -i "${wallPath}" -s -t &>/dev/null; then
	echo "pywal failed to operate on this wallpaper"
	echo "Check '${wallPath}' is a valid image"
fi

SetKonsoleTheme.sh ~/.cache/wal/colors-konsole.colorscheme
