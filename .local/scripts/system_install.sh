#!/bin/bash

if [ "$(whoami)" != "root" ]; then
  if [ -z "$(sudo -nl 2> /dev/null)" ]; then
    echo "This script '$0' should be run with sudo privileges or as root"
    echo "Run as root 'user_to_sudoers.sh' script to add user to sudoers"
    exit 1
  fi
fi

echo "Installing certificates..."
apt-get update
apt-get install --yes ca-certificates apt-transport-https
echo "Installing certificates...DONE"

echo "Updating repositories..."
echo "Add contrib and non-free option to source.list. And changes http by https"
read -p "Press [ENTER] to continue"
echo "Adding buster-backports repository"
echo "deb https://deb.debian.org/debian/ buster-backports main contrib non-free" >> /etc/apt/sources.list
echo "Adding testing repository"
echo "deb https://deb.debian.org/debian/ testing main contrib non-free" >> /etc/apt/sources.list
read -p "Check changes in sources.list and press ENTER to continue"
apt-get update
echo "Updating repositories...DONE"


echo "Updating kernel image..."
apt-cache search linux-image
echo "Enter linux image and headers kernel"
read linux_image linux_headers
if [ -n "$linux_image" ]
then
	apt-get install --yes $linux_image $linux_headers
else
	echo "Error typing linux image"
	exit 1
fi
echo "Updating kernel image...DONE"
read -p "Press [ENTER] to continue"

echo "Installing system operating tools..."
# System tools
apt-get install -y -t testing live-task-standard
apt-get install -y build-essential xterm vim git htop curl wget libcanberra0 tree bash-completion ssh ntfs-3g fuse nmap

# Hardware tools
apt-get install -y inxi neofetch mesa-utils hardinfo xutils usbutils pm-utils cpufrequtils lm-sensors

# Firmware tools
apt-get install -y -t testing firmware-linux # firmware-linux-nonfree firmware-misc-nonfree
#apt-get install --yes -t testing firmware-realtek #firmware-atheros #firmware-iwlwifi

# Multimedia tools
apt-get install -y pulseaudio pavucontrol mpv mediainfo file highlight w3m-img caca-utils atool poppler-utils ffmpeg ffmpegthumbnailer xpdf feh
apt-get install --yes -t testing simplescreenrecorder # Feature-rich screen recorder for X11 and OpenGL
apt-get install --yes -t testing vlc # Multimedia player and streamer
apt-get install --yes asciinema # Record and share your terminal sessions

# Miscellaneous tools
apt-get install -y xbindkeys fonts-noto-color-emoji xbacklight

# Extra tools
apt-get install -y ranger rsync atool mtp-tools firefox-esr jq
apt-get install --yes libreoffice-writer libreoffice-calc libreoffice-impress

# Windows manager
apt-get install -y i3

# Display manager
apt-get install -y lightdm

echo "Installing system operating tools...DONE"
read -p "Press [ENTER] to continue"

echo "All system tools are installed. After to REBOOT system you run 'startx' command and set windows manager keybind"
read -p "Press [ENTER] to reboot"
reboot

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
