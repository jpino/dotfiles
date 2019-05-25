all: neovim tmux i3 urxvt git bash
.PHONY: packages neovim tmux i3 urxvt git bash

packages:
	grep "^[^#]" ~/dotfiles/packages/apt-install | xargs echo apt install -y
	grep "^[^#]" ~/dotfiles/packages/apt-remove | xargs echo apt purge -y
	apt autoremove
	grep "^[^#]" ~/dotfiles/packages/pip-install | xargs echo pip3 install -y
	
folders:
	mkdir -p ~/bin
	mkdir -p ~/src
	rmdir ~/Documents
	rmdir ~/Desktop
	rmdir ~/Music
	rmdir ~/Pictures
	rmdir ~/Public
	rmdir ~/Templates
	rmdir ~/Videos

.ONESHELL:
neovim:
	cd ~/src
	curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
	chmod u+x nvim.appimage
	ln -fs `pwd`/nvim ~/.config/nvim
	ln -fs ~/src/nvim.appimage ~/bin/vim
	curl -fLo ~/dotfiles/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim -cmd ":PlugInstall"


tmux:
	ln -fs `pwd`/tmux ~/.config/tmux

i3:
	git clone --depth 1 https://github.com/khamer/base16-i3 ~/.config/base16-i3
	ln -fs `pwd`/i3 ~/.config/i3
	cp ~/.config/base16-i3/colors/base16-eighties.config ~/.config/colors.i3
	cat ~/.config/colors.i3 ~/dotfiles/i3/base > ~/dotfiles/i3/config
	i3-msg reload

bash:
	git clone --depth 1 https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	chmod u+x ~/.config/base16-shell/scripts/*
	echo "source `pwd`/bash/environment" >> ~/.profile
	echo "source `pwd`/bash/mybashrc" >> ~/.bashrc
	ln -fs `pwd`/bash/aliases ~/.bash_aliases
	`pwd`/scripts/base16 eighties

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
