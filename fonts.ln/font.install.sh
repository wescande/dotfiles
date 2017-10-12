#!/bin/bash

PLATFORM=$(uname)
if [ $PLATFORM == 'Darwin' ]
then
	DIR_BUILD="$HOME/Library/Fonts"
else
	DIR_BUILD="$HOME/.local/share/fonts"
fi
if [ -d "$DIR_BUILD" ]
then
	echo -e "\t\033[31m$DIR_BUILD: directory already exist it seems you do not need to install again"
	exit 1;
fi
mkdir "$DIR_BUILD"
source $(dirname $0)/fonts/install.sh

echo -e "\t\033[32mSession may need a reboot\033[0m"
