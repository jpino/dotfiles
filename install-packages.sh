# Get additional sources
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

add-apt-repository https://launchpad.net/~neovim-ppa/+archive/ubuntu/unstable


# Update and upgrade packages
apt update && apt upgrade


# List of new packages to be installed in no particular order
APT_PACKAGES="
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
python3-pip

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
apt install $APT_PACKAGES

PYTHON_PACKAGES="
neovim
typing
"

pip3 install $PYTHON_PACKAGES

CARGO_PACKAGES="
racer
rustfmt
"

cargo install $CARGO_PACKAGES

# Install RLS
rustup component add rls --toolchain nightly
rustup component add rust-analysis --toolchain nightly
rustup component add rust-src --toolchain nightly
