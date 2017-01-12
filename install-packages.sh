# Get additional sources
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'


# Update and upgrade packages
apt update && apt upgrade


# List of new packages to be installed in no particular order
PACKAGES="
libxml2-dev
libxslt1-dev
zlib1g-dev
libffi-dev
vim
tmux
git
google-chrome-stable
htop
i3
i3blocks
xbacklight
fonts-font-awesome
mumble
pavucontrol
vlc
network-manager-openvpn
network-manager-openvpn-gnome
fonts-font-awesome
rxvt-unicode-256color
audacious
bleachbit
curl
nmap
"


# Install packages
apt install $PACKAGES


