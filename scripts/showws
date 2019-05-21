#!/bin/bash

WORKSPACE=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused==true).name')

notify-send -t 1000 "$WORKSPACE"
