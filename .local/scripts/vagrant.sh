#!/bin/bash

set -e

USERNAME=cmejia

if [ "$(whoami)" != root ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Vagrant..."

cd /tmp
# Getting latest version
latest_version=$(wget -qO - https://releases.hashicorp.com/vagrant/ \
	| sed -nE 's/.*>vagrant_(([0-9])+([.][0-9]+)+)<.*/\1/p' | head -n 1)
vagrant_filename=vagrant.deb
wget -q "https://releases.hashicorp.com/vagrant/${latest_version}/vagrant_${latest_version}_x86_64.deb" \
	-O $vagrant_filename
apt install --yes ./$vagrant_filename
rm $vagrant_filename
# Installing from Debian packages
#apt-get update
#apt-get install --yes -t testing vagrant vagrant-libvirt libvirt-daemon-system

echo "Installing Vagrant...DONE"

exit 0

