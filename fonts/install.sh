#!/bin/bash

set -e

install_PowerlineFonts() {
	echo -e "\t\033[33mCloning fonts\033[0m"
	git clone https://github.com/powerline/fonts.git powerlineFonts --depth=1
	cd powerlineFonts
	./install.sh
	cd ..
	rm -rf powerlineFonts
}

install_FiraCodeFonts() {
	for type in Bold Light Medium Regular Retina; do
		file_path="${HOME}/.local/share/fonts/FiraCode-${type}.ttf"
		file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true"
		if [ ! -e "${file_path}" ]; then
			wget -O "${file_path}" "${file_url}"
		else
			echo "Found existing file $file_path"
		fi;
	done
}

PLATFORM=$(uname)
if [ $PLATFORM == 'Darwin' ]
then
	DIR_BUILD="$HOME/Library/Fonts"
else
	DIR_BUILD="$HOME/.local/share/fonts"
fi

if [ -d "$DIR_BUILD" ]
then
	echo -e "\t\033[31m$DIR_BUILD: directory already exist it seems you do not need to install again\033[0m"
	exit 0;
fi

mkdir -p "$DIR_BUILD"

install_PowerlineFonts
# install_FiraCodeFonts

fc-cache -f

echo -e "\t\033[32mSession may need a reboot\033[0m"

