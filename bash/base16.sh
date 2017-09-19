#!/bin/bash

SCRIPT_PATH="$HOME/.config/base16-shell/scripts/base16-$1.sh"

if [[ -x "$SCRIPT_PATH" ]]
then
    eval $SCRIPT_PATH
    echo "colorscheme base16-$1" > $HOME/.config/colors.vim
    echo "source $SCRIPT_PATH" > $HOME/.config/colors.shell
else
    echo "ERROR: File $SCRIPT_PATH is missing or not executable."
    exit 1
fi

