#!/bin/bash

BAT0=$(cat /sys/class/power_supply/BAT0/capacity)
BAT1=$(cat /sys/class/power_supply/BAT1/capacity)

AC=$(cat /sys/class/power_supply/AC/online)

if [[ $AC == "1" ]]; then
    ACSTATUS="Connected to AC"
else
    ACSTATUS="Not connected to AC"
fi

MESSAGE="Battery 0: $BAT0%
Battery 1: $BAT1%
$ACSTATUS"

notify-send "Energy status" "$MESSAGE"
