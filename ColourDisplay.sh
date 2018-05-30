#! /bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: ${BASH_SOURCE} #ColourHexCode"
	exit -1
fi


if ! grep -P '#[A-Fa-f0-9]{6}' <<< $1 &>/dev/null; then
	echo "Failed to parse hex code"
	exit -1
fi

sansHex=$(sed 's/#//g' <<<"$1")
hex="${sansHex^^}"

redHex=$(sed -r 's/^([A-F0-9]{2}).*$/\1/g' <<<"$hex")
greenHex=$(sed -r 's/^[A-F0-9]{2}([A-F0-9]{2}).*$/\1/g' <<<"$hex")
blueHex=$(sed -r 's/^[A-F0-9]{4}([A-F0-9]{2})$/\1/g' <<<"$hex")

redDec=$(bc <<< "ibase=16; ${redHex^^}")
greenDec=$(bc <<< "ibase=16; ${greenHex^^}")
blueDec=$(bc <<< "ibase=16; ${blueHex^^}")

backRed=$(( ( $redDec + 128 ) % 256))
backGreen=$(( ( $greenDec + 128 ) % 256 ))
backBlue=$(( ( $blueDec + 128 ) % 256))

printf "\033[48;2;${redDec};${greenDec};m\033[38;2;${backRed};${backGreen};${backBlue}m   #$hex   \033[48;2;0m\n"
