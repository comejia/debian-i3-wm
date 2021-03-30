#!/bin/bash

set -e

if [ $(whoami) != "root" ] 
then
	echo "You need run this script as root"
	exit 1
fi

echo "Installing Google Chrome..."

cd /tmp
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome.deb
apt install --yes ./google-chrome.deb # install with dependencies
#dpkg -i google-chrome.deb
#apt-get -f install
rm google-chrome.deb

echo "Installing Google Chrome...DONE"

exit 0
