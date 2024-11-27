#!/bin/bash

files=$(ls /sys/class/power_supply | wc -l)
capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [[ $files -eq 0 ]];then
	nline=$(cat config | grep -n "\[battery\]" | cut -d : -f 1)
	for i in {0..2};do
		sed -i "${nline}s/.*/#&/" ~/.config/i3blocks/config
		nline=$((nline + 1))
	done
	i3-msg restart
fi

if [[ $capacity -ge 75 ]] && [[ $capacity -lt 100 ]];then
	echo " $capacity%"
elif [[ $capacity -ge 50 ]] && [[ $capacity -lt 75 ]];then
	echo " $capacity%"
elif [[ $capacity -ge 25 ]] && [[ $capacity -lt 50 ]];then
	echo " $capacity%"
elif [[ $capacity -ge 1 ]] && [[ $capacity -lt 25 ]];then
	echo " $capacity%"
fi

if [[ $status == "Charging" ]];then
	echo ""
	echo "#00ffff"
fi
