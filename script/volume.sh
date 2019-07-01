#!/bin/bash

# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

ICON_FOLDER=/usr/share/icons/Papirus-Dark/24x24/actions
LOW_ICON=/$ICON_FOLDER/audio-volume-low.svg
MEDIUM_ICON=$ICON_FOLDER/audio-volume-medium.svg
HIGH_ICON=$ICON_FOLDER/audio-volume-high.svg
MUTE_ICON=$ICON_FOLDER/audio-volume-muted.svg
MAX_WIDTH=25
REVERSE_BAR=true

case $1 in
	up)
		amixer set Master 5%+ on > /dev/null
		;;
	down)
		amixer set Master 5%- on > /dev/null
		;;
	mute)
		amixer set Master toggle > /dev/null
		;;
esac


mixer_info=$(amixer get Master)

volume=$(echo "$mixer_info" | awk '$0~/%/{print $5}' | tr -d '[]%' | head -n 1)
state=$(echo "$mixer_info" | grep '%' | grep -oE '[^ ]+$' | head -n 1)

if [ "$state" = "[off]" ]
then
	volume_icon=$MUTE_ICON
	message="MUTE"
else
	toshow=$(($volume*$MAX_WIDTH/100))
	tocomplete=$(($MAX_WIDTH-$toshow))
	echo "$toshow vs $tocomplete"
	if [ "$REVERSE_BAR" = "true" ]
	then
		message=$(printf '%*s%s┤' $tocomplete "" $(printf '%.0s─' $(eval "echo {1.."$(($toshow))"}")}))
	else
		message=$(printf '%s%*s┤' $(printf '%.0s─' $(eval "echo {1.."$(($toshow))"}")}) $tocomplete "")
	fi
	if [ $volume -gt 75 ]
	then
		volume_icon=$HIGH_ICON
	elif [ $volume -gt 40 ]
	then
		volume_icon=$MEDIUM_ICON
	elif [ $volume -gt 0 ]
	then
		volume_icon=$LOW_ICON
	else
		volume_icon=$MUTE_ICON
		message=$(printf '%*s%s┤' $tocomplete "" $(printf '%.0s' $(eval "echo {1.."$(($toshow))"}")}))
	fi
fi

dunstify -a indicator -u normal -i $volume_icon -r "5555" "$message"
