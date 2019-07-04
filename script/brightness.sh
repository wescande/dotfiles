#!/bin/bash

# You can call this script like this:
# $./brightness.sh up
# $./brightness.sh down
# $./brightness.sh toggle #### TODO 

ICON_FOLDER=/usr/share/icons/Papirus-Dark/symbolic/status
LOW_ICON=/$ICON_FOLDER/display-brightness-low-symbolic.svg
MEDIUM_ICON=$ICON_FOLDER/display-brightness-medium-symbolic.svg
HIGH_ICON=$ICON_FOLDER/display-brightness-high-symbolic.svg
MUTE_ICON=$ICON_FOLDER/display-brightness-off-symbolic.svg
MAX_WIDTH=25
REVERSE_BAR=true

brightness=$(xrandr --verbose | grep -m1 -i brightness | cut -d ' ' -f2)
case $1 in
	up)
		brightness=$(echo "$brightness + 0.1" | bc)
		;;
	down)
		brightness=$(echo "$brightness - 0.1" | bc)
		;;
esac

if (( $(echo "$brightness > 1" | bc -l) ))
then
	brightness=1
elif (( $(echo "$brightness < 0" | bc -l) ))
then
	brightness=0
fi

~/bin/dimscreen.sh $brightness

toshow=$(echo "(($brightness * $MAX_WIDTH) + 0.5) / 1" | bc)
tocomplete=$( echo "$MAX_WIDTH - $toshow" | bc)
echo "show $toshow, complete $tocomplete"
if [ "$REVERSE_BAR" = "true" ]
then
	message=$(printf '%*s%s┤' $tocomplete "" $(printf '%.0s─' $(eval "echo {1.."$(($toshow))"}")}))
else
	message=$(printf '%s%*s┤' $(printf '%.0s─' $(eval "echo {1.."$(($toshow))"}")}) $tocomplete "")
fi
if (( $(echo "$brightness > 0.75" | bc -l) ))
then
	brightness_icon=$HIGH_ICON
elif (( $(echo "$brightness > 0.40" | bc -l) ))
then
	brightness_icon=$MEDIUM_ICON
elif (( $(echo "$brightness > 0" | bc -l) ))
then
	brightness_icon=$LOW_ICON
else
	brightness_icon=$MUTE_ICON
	message=$(printf '%*s%s┤' $tocomplete "" $(printf '%.0s' $(eval "echo {1.."$(($toshow))"}")}))
fi

dunstify -a indicator -u normal -i $brightness_icon -r "5555" "$message"
