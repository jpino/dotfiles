#!/bin/bash

# get window information
XWININFO=$(xwininfo)


# parse coordinates and size of selected window
# taking into account borders
RX=$(awk -F: '/Relative upper-left X/{print $2}' <<< "$XWININFO")
RY=$(awk -F: '/Relative upper-left Y/{print $2}' <<< "$XWININFO")

X=$(( $(awk -F: '/Absolute upper-left X/{print $2}' <<< "$XWININFO") - "$RX"))
Y=$(( $(awk -F: '/Absolute upper-left Y/{print $2}' <<< "$XWININFO") - "$RY"))

WIDTH=$(( $(awk -F: '/Width/{print $2}' <<< "$XWININFO") + 2 * "$RX"))
HEIGHT=$(( $(awk -F: '/Height/{print $2}' <<< "$XWININFO") + 2 * "$RX"))

# start recording
byzanz-record --x="$X" --y="$Y" --width="$WIDTH" --height="$HEIGHT" --duration="$1" "$2"

# open recording in firefox
firefox "$2"

