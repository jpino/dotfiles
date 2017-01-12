all: vim tmux i3 urxvt git
.PHONY: vim tmux i3 urxvt git

vim:
	ln -fs `pwd`/vim ~/.vim

tmux:
	ln -fs `pwd`/tmux/tmux.conf ~/.tmux.conf

i3:
	ln -fs `pwd`/i3 ~/.i3

urxvt:
	echo "source `pwd`/urxvt/base16-eighties.dark.sh" >> ~/.bashrc
	ln -fs `pwd`/urxvt/Xresources ~/.Xresources
	xrdb ~/.Xresources

git:
	ln -fs `pwd`/git/gitconfig ~/.gitconfig

