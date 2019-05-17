#!/bin/bash

SCRIPT_PATH="$HOME/.config/base16-shell/scripts/base16-$1.sh"

if [[ -x "$SCRIPT_PATH" ]]
then
    eval $SCRIPT_PATH
    echo "colorscheme base16-$1" > $HOME/.config/colors.vim
    echo "source $SCRIPT_PATH" > $HOME/.config/colors.shell
    cp  ~/.config/base16-i3/colors/base16-$1.config $HOME/.config/colors.i3
    cat $HOME/.config/colors.i3 ~/dotfiles/i3/base > ~/dotfiles/i3/config
    i3-msg reload
else
    echo "ERROR: File $SCRIPT_PATH is missing or not executable."
    exit 1
fi

