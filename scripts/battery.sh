#!/bin/bash


BAT0=$(cat /sys/class/power_supply/BAT0/capacity)
BAT1=$(cat /sys/class/power_supply/BAT1/capacity)
AC=$(cat /sys/class/power_supply/AC/online)

if [[ $AC == "1" ]]; then
    ACSTATUS="Charging"
else
    ACSTATUS="Not charging"
fi

TOTAL=$((BAT0+$BAT1))
notify-send -t 3000 "Battery: $TOTAL/200. $ACSTATUS"

notify-send -t 3000 "$(date +"%H:%M - %A %d %B %Y")"
