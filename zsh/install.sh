#!/bin/bash

TARGET_SHELL="/bin/zsh"

ERROR="\033[1;38;5;196m"
INFO="\033[1;38;5;222m"
SUCCESS="\033[38;5;70m"
RES="\033[0m"

if [ ! "$SHELL" == "$TARGET_SHELL" ]; then
	echo pass here
	if ! type "$TARGET_SHELL" > /dev/null; then
		>&2 echo -e "\t$ERROR$TARGET_SHELL not found$RES"
		exit 1
	fi
	if ! chsh -l | grep "$TARGET_SHELL" > /dev/null; then
		>&2 echo -e "\t$ERROR$TARGET_SHELL not in chsh list:\n$INFO`chsh -l | sed 's/^/\t\t/'`$RES"
		exit 1
	fi
	echo -e "\t$INFO"
	if ! chsh -s "$TARGET_SHELL"; then
		>&2 echo -e "\t$ERROR Cannot set $TARGET_SHELL as default shell$RES"
		exit 1
	fi
	echo -en "$RES"
fi

