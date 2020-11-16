# Dotfiles

These files will only make sense to me. They help me recreate my own machines when things go south, which happens worryingly often. A wiser person would use Ansible or any other sensible approach. Everyone is welcome to look around but don't touch anything.

## Setup
After installing Debian 10, change sources.list from buster to testing and comment every other line:

```
deb http://deb.debian.org/debian/ testing main contrib non-free
deb-src http://deb.debian.org/debian/ testing main contrib non-free
```

Update and upgrade packages:

```
sudo apt update
sudo apt upgrade
sudo apt full-upgrade
```

Install git and clone this repo:

```
sudo apt install git
git clone https://github.com/jpino/dotfiles ~/dotfiles
```

Make and remove directories:

```
mkdir ~/projects ~/bin ~/src ~/screenshots
rmdir ~/Documents ~/Desktop ~/Music ~/Pictures ~/Public ~/Templates ~/Videos
```

Install and remove packages:

```
xargs -a ~/dotfiles/packages/apt-install sudo apt install
xargs -a ~/dotfiles/packages/apt-remove sudo apt purge
sudo apt autoremove
xargs -a ~/dotfiles/packages/pip-install sudo pip3 install
```

Install neovim:
```
curl -o ~/src/nvim.appimage https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x ~/src/nvim.appimage
ln -fs ~/src/nvim.appimage ~/bin/vim
ln -fs ~/dotfiles/nvim ~/.config/nvim
curl --create-dirs -o ~/dotfiles/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Manually install rest of binaries from `~/dotfiles/packages/binaries`.

Install bash config:

```
echo "source ~/dotfiles/bash/bashrc" >> ~/.bashrc
```

Link config files:
```
ln -fs ~/dotfiles/sway ~/.config/sway
ln -fs ~/dotfiles/alacritty ~/.config/alacritty
ln -fs ~/dotfiles/git/ ~/.config/git
ln -fs ~/dotfiles/bash/inputrc ~/.inputrc
ln -fs ~/dotfiles/bash/bash_profile ~/.bash_profile

```

Set up log in from terminal:
```
sudo systemctl set-default multi-user.target
```

which can be reverted with:
```
sudo systemctl set-default graphical.target
```

Set gtk theme and icons:
```
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
```

Reboot.


If everyting went smooth it means the errors didn't reach the surface. That is a victory. Many things will be broken although not beyond repair. The fun begins now.

