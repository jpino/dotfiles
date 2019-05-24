# Dotfiles

These files will only make sense to me. They help me recreate my own machines when things go south, which happens worryingly often. A wiser person would use Ansible or any other sensible approach. Everyone is welcome to look around but don't touch anything.

## Setup
After installing Ubuntu 18.04 LTS, upgrade all packages

```
sudo apt update
sudo apt upgrade
```

Install git and clone this repo

```
sudo apt install git
git clone https://github.com/jpino/dotfiles ~/dotfiles
```

Install and remove packages

```
xargs -a ~/dotfiles/packages/apt-install sudo apt install
xargs -a ~/dotfiles/packages/apt-remove sudo apt purge
```

Start making things
```
cd ~/dotfiles
make folders
make neovim
make tmux
make i3
make bash
make urxvt
make git
make rust
make postinstall
```

Or alternatively, make all the things at once

```
cd ~/dotfiles
make all
```

If everyting went smooth it means the errors didn't reach the surface. That is a victory. Many things will be broken although not beyond repair. The fun begins now.

