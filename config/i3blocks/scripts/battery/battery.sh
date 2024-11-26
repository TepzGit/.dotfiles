#!/bin/bash

capacity=$(cat /sys/class/power_supply/BAT0/capacity)
status=$(cat /sys/class/power_supply/BAT0/status)

if [[ $capacity -ge 75 ]] && [[ $capacity -lt 100 ]];then
	echo " $capacity%"
elif [[ $capacity -ge 50 ]] && [[ $capacity -lt 75 ]];then
	echo " $capacity%"
elif [[ $capacity -ge 25 ]] && [[ $capacity -lt 50 ]];then
	echo " $capacity%"
elif [[ $capacity -ge 1 ]] && [[ $capacity -lt 25 ]];then
	echo " $capacity%"
fi
