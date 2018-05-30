#! /bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: ${BASH_SOURCE} /path/to/profile"
	exit -1
fi

# Checked and do have some path

if [ ! -f "$1" ]; then
	echo "Path must be to existing file"
	echo "'$1' does not exist"
	exit -1
fi

if ! grep -P '.*\.colorscheme' <<< $1 &>/dev/null; then
	echo "Path must be to a Konsole colour-scheme file"
	echo "File must be '*.colorscheme'"
	exit -1
fi

#Checked and have a valid colour-scheme
kProfileDir="${HOME}/.local/share/konsole"

if [ ! -d "$kProfileDir" ]; then
	echo "Unknown whether your version of Konsole uses the preset directory to store profiles"
	echo "Check whether your version uses '$kProfileDir' to store profiles"
	echo "This can be checked by downloading profiles, and seeing if they appear there"
	echo "Unsure of whether to continue however, hence quitting"
	exit -1
fi

cp "$1" "$kProfileDir/AutoImport.colorscheme"

for kWin in $(qdbus | grep konsole); do
	for kSes in $(qdbus $kWin | grep -P '/Sessions/\d+'); do
		if qdbus $kWin $kSes org.kde.konsole.Session.title 1 | grep -P '(zsh)|(bash)' &>/dev/null; then
			qdbus $kWin $kSes org.kde.konsole.Session.runCommand " konsoleprofile ColorScheme=AutoImport" &>/dev/null
		fi
	done
done
