#!/bin/bash

KB_LAYOUT=$(setxkbmap -query | grep layout | awk '{print $2}')

if [ $KB_LAYOUT == "us" ]; then
    NEW_KB_LAYOUT="es"
else
    NEW_KB_LAYOUT="us"
fi

setxkbmap $NEW_KB_LAYOUT
notify-send -t 1000 "$NEW_KB_LAYOUT"
