all: neovim tmux i3 urxvt git bash
.PHONY: packages folders scripts neovim i3 bash base16 alacritty git cron


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

scripts:
	chmod u+x ~/dotfiles/base16/base16-selector.py
	chmod u+x ~/dotfiles/scripts/*


.ONESHELL:
neovim:
	curl -o ~/src/nvim.appimage https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
	chmod u+x ~/src/nvim.appimage
	ln -fs ~/src/nvim.appimage ~/bin/vim
	ln -fs ~/dotfiles/nvim ~/.config/nvim
	curl -o ~/dotfiles/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

i3:
	ln -fs ~/dotfiles/i3 ~/.config/i3
	curl -o ~/.config/lock-image.png https://i.imgur.com/9okUv.png
	curl -o ~/.config/background-image.png https://i.imgur.com/dmZSpbb.png
	i3-msg reload


bash:
	echo "source ~/dotfiles/bash/bashrc" >> ~/.bashrc
	ln -fs ~/dotfiles/bash/profile ~/.profile
	ln -fs ~/dotfiles/bash/inputrc ~/.inputrc


base16:
	~/dotfiles/scripts/base16 dracula


alacritty:
	ln -fs ~/dotfiles/alacritty ~/.config/alacritty


git:
	ln -fs ~/dotfiles/git/ ~/.config/git


cron:
	crontab ~/dotfiles/crontab/mycrontab


postinstall:
	gio mime inode/directory Thunar-folder-handler.desktop

# xdg-mime default thunar.desktop inode/directory
