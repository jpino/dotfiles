all: vim tmux i3 urxvt git bash
.PHONY: vim tmux i3 urxvt git bash

vim:
	ln -fs `pwd`/vim ~/.vim

tmux:
	ln -fs `pwd`/tmux/tmux.conf ~/.tmux.conf

i3:
	ln -fs `pwd`/i3 ~/.config/i3

bash:
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	chmod u+x ~/.config/base16-shell/scripts/*
	echo "source `pwd`/bash/mybashrc" >> ~/.bashrc
	echo "source `pwd`/bash/aliases" >> ~/.bashrc
	echo "source ~/.config/colors.shell" >> ~/.bashrc
	`pwd`/bash/base16.sh eighties

urxvt:
	ln -fs `pwd`/urxvt/Xresources ~/.Xresources
	xrdb ~/.Xresources

git:
	ln -fs `pwd`/git/gitconfig ~/.gitconfig

rust:
	curl https://sh.rustup.rs -sSf | sh
	cargo install racer rustfmt
