all: neovim tmux i3 urxvt git bash
.PHONY: neovim tmux i3 urxvt git bash

folders:
	mkdir -p ~/bin
	mkdir -p ~/src

neovim:
	cd ~/bin
	curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
	chmod u+x nvim.appimage
	ln -fs `pwd`/nvim ~/.config/nvim

tmux:
	ln -fs `pwd`/tmux/tmux.conf ~/.tmux.conf

i3:
	git clone --depth 1 https://github.com/khamer/base16-i3 ~/.config/base16-i3
	ln -fs `pwd`/i3 ~/.config/i3

bash:
	git clone --depth 1 https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
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

postinstall:
	gio mime inode/directory Thunar-folder-handler.desktop
