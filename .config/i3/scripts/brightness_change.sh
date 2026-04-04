#!/usr/bin/bash

current_focues=$(i3-msg -t get_workspaces | jq '.[] | select(.focused == true)')
current_output=$(echo $current_focues | jq -r ".output" | head -n 1)
current_output_brightness=$(xrandr --verbose | grep -A20 "^$current_output " | grep "Brightness:" | cut -d " " -f 2)

case $1 in
	"-")
		new_current_output_brightness=$(awk "BEGIN {print $current_output_brightness - $2}")
		;;
	"+")
		new_current_output_brightness=$(awk "BEGIN {print $current_output_brightness + $2}")
		;;
	"reset")
		xrandr --output $current_output --brightness "1"
		exit
		;;
	*)
		echo "$1 not valid, has to be (-,+,reset)"
		exit
		;;
esac


if awk "BEGIN {exit !($new_current_output_brightness >= 0)}"; then
	xrandr --output $current_output --brightness "$new_current_output_brightness"
else
	exit
fi

