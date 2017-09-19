# Get additional sources
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

add-apt-repository https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable


# Update and upgrade packages
apt update && apt upgrade


# List of new packages to be installed in no particular order
PACKAGES="
i3
i3blocks
fonts-font-awesome
git
neovim
xsel
thunar
gnome-icon-theme
lxappearance
fonts-font-awesome
rxvt-unicode-256color

libxml2-dev
libxslt1-dev
zlib1g-dev
libffi-dev
tmux
google-chrome-stable
htop
xbacklight
mumble
pavucontrol
vlc
network-manager-openvpn
network-manager-openvpn-gnome
audacious
bleachbit
curl
nmap
"


# Install packages
apt install $PACKAGES


