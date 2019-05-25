#!/bin/bash

BAT0=$(cat /sys/class/power_supply/BAT0/capacity)
BAT1=$(cat /sys/class/power_supply/BAT1/capacity)
AC=$(cat /sys/class/power_supply/AC/online)

TOTAL=$((BAT0+$BAT1))
if [[ $AC == "0" && $TOTAL -le 5 ]]; then
    notify-send "Battery low: $TOTAL/200"
fi

