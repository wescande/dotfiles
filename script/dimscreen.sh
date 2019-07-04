#!/bin/sh

for display in `xrandr | grep -w connected | cut -d ' ' -f1`
do
	xrandr --output "$display" --brightness $@
done

