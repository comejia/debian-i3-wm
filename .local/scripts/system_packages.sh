#!/bin/bash

set -e

#### NOTE ####
# Before run this script you should set LINUX_IMAGE and LINUX_HEADERS vars
LINUX_IMAGE=
LINUX_HEADERS=

echo "Installing System Packages"

DEBIAN_REPOS_TITLE="# Debian repositories"
if [ "$(grep -cx "$DEBIAN_REPOS_TITLE" /etc/apt/sources.list)" -eq 0 ]; then
  echo "Updating repositories..."
  echo "$DEBIAN_REPOS_TITLE
deb https://deb.debian.org/debian/ buster main contrib non-free
deb-src https://deb.debian.org/debian/ buster main contrib non-free

deb http://security.debian.org/debian-security buster/updates main contrib non-free
deb-src http://security.debian.org/debian-security buster/updates main contrib non-free

# buster-updates, previously known as 'volatile'
deb https://deb.debian.org/debian/ buster-updates main contrib non-free
deb-src https://deb.debian.org/debian/ buster-updates main contrib non-free
# buster-backports
deb https://deb.debian.org/debian/ buster-backports main contrib non-free
# testing
deb https://deb.debian.org/debian/ testing main contrib non-free
# sid
#deb https://deb.debian.org/debian/ sid main contrib non-free
  " | sudo tee /etc/apt/sources.list > /dev/null
  echo "Updating repositories...DONE"
fi

sudo apt-get update

echo "Updating kernel image..."
if [ -z "$LINUX_IMAGE" ] || [ -z "$LINUX_HEADERS" ]; then
  echo "######## Linux Image ########
  You need set LINUX_IMAGE and LINUX_HEADERS to update kernel image
  Execute apt-cache search linux-image to select the flavour
  "
  echo "Updating kernel image...FAIL"
else
  sudo apt-get install --yes "$LINUX_IMAGE" "$LINUX_HEADERS"
  echo "Updating kernel image...DONE"
fi

# Standard system utilities
sudo apt-get install --yes -t testing \
  apt-listchanges \
  bash-completion \
  bind9-host \
  bzip2 \
  dbus \
  debian-faq \
  doc-debian \
  gettext-base \
  groff-base \
  libnss-systemd \
  locales \
  libnss-myhostname \
  lsof \
  man-db \
  manpages \
  mime-support \
  ncurses-term \
  netcat-openbsd \
  openssh-client \
  pciutils\
  python3 \
  telnet \
  ucf \
  usbutils \
  xz-utils

# System tools
sudo apt-get install --yes -t testing \
  ca-certificates \
  apt-transport-https \
  vim \
  htop \
  tree \
  ssh \
  ntfs-3g \
  build-essential \
  libcanberra0 \
  xterm
  #rxvt-unicode \

# Network tools
sudo apt-get install --yes -t testing \
  curl \
  wget \
  nmap \
  firefox-esr \

# Hardware tools
sudo apt-get install --yes -t testing \
  inxi \
  neofetch \
  mesa-utils \
  hardinfo \
  xutils \
  usbutils \
  pm-utils \
  cpufrequtils \
  lm-sensors

# Firmware tools
sudo apt-get install --yes -t testing firmware-linux # firmware-linux-nonfree firmware-misc-nonfree

# Multimedia tools
sudo apt-get install --yes -t testing \
  pulseaudio \
  pavucontrol \
  mpv \
  mediainfo \
  file \
  highlight \
  w3m-img \
  caca-utils \
  poppler-utils \
  ffmpeg \
  ffmpegthumbnailer \
  xpdf \
  feh
sudo apt-get install --yes -t testing vlc # Multimedia player and streamer

# Extra tools
sudo apt-get install --yes -t testing \
  ranger \
  rsync \
  atool \
  mtp-tools \
  jq \
  libreoffice-writer \
  libreoffice-calc \
  libreoffice-impress \
  geany
sudo apt-get install --yes -t testing simplescreenrecorder # Feature-rich screen recorder for X11 and OpenGL
sudo apt-get install --yes -t testing asciinema # Record and share your terminal sessions

# Miscellaneous tools
sudo apt-get install --yes -t testing \
  xbindkeys \
  fonts-noto-color-emoji \
  xbacklight

# Windows manager
sudo apt-get install --yes -t testing i3
  #i3-wm \
  #i3lock \
  #i3status \
  #suckless-tools

# Display manager
sudo apt-get install --yes -t testing lightdm

echo "Installing System Packages...DONE"

exit 0

# xrandr: setting monitor (displays)
# xpdf: pdf viewer
# feh: image viewer
# ranger: console file manager
# mpv: video viewer
# ffmpegthumbnailer: show video preview from console
# w3m-img: show image preview from console
# mediainfo, file, highlight: extra info tools to file manager
# pulseaudio: package to audio
# pavucontrol: audio control by GUI
# mpt-tools: media transport protocol, detect Android phones. Use mtp-detect command if you have a problem
# xbindkeys: To control multimedia buttons
# inxi, neofetch, hardinfo, cpufrequtils: tools to show system hardware and software info
