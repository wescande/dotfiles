#!/bin/bash

CUR_DIR=$(cd "$(dirname "$0")" && pwd)
if [ -z "$HOME" ]
then
	echo -e "\033[31mHOME is not set\033[0m"
	exit 1
fi
echo -e "\033[35mInit of submodule\033[0m"
git submodule init
echo -en "\033[35mUpdate of submodule\n...\r\033[0m"
git submodule update --remote
ALL_LINK=$(find . -path ./.git -prune -o -name "*.ln" -print | sort -d)
echo -e "\033[35mFollowing config file are now linked:\033[0m"
echo -en "\033[33m$HOME/\033[0m"
for STR_WAS in $ALL_LINK
do
	STR_WILL="."$(echo $STR_WAS | sed -e s#\.ln\$## -e s#^.*/##)
	printf "%-30s ➔  $CUR_DIR/$STR_WAS\n%*s " $STR_WILL ${#HOME} ""
	ln -sf $CUR_DIR/$STR_WAS $HOME/$STR_WILL
done
echo -e "\r\033[32mLink are done\033[0m"
ALL_INSTALL=$(find . -path ./.git -prune -o -name "*.install.sh" -print | sort -d)
echo -e "\033[35mSome install script are now running:\033[0m"
for SCRIPT in $ALL_INSTALL
do
	SHORT_NAME=$(echo $SCRIPT | sed -e s#\.install\.sh\$## -e s#^.*/##)
	echo -e "Launching \033[33m$SHORT_NAME . . .\033[0m"
	$CUR_DIR/$SCRIPT
	echo -e "\033[32m$SHORT_NAME done\033[0m"
done
echo -e "\r\033[32mInstall script are done\033[0m"