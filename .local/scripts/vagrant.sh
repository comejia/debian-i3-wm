#!/bin/bash

set -e

echo "Installing Vagrant..."

cd /tmp
# Getting latest version
latest_version=$(wget -qO - https://releases.hashicorp.com/vagrant/ \
  | sed -nE 's/.*>vagrant_(([0-9])+([.][0-9]+)+)<.*/\1/p' | head -n 1)
vagrant_filename=vagrant.deb
wget -q "https://releases.hashicorp.com/vagrant/${latest_version}/vagrant_${latest_version}_x86_64.deb" \
  -O $vagrant_filename
sudo apt install --yes ./$vagrant_filename
rm $vagrant_filename
# Installing from Debian packages
#apt-get update
#apt-get install --yes -t testing vagrant vagrant-libvirt libvirt-daemon-system

shell=$(echo "$SHELL" | awk -F "/bin/" '{ print $2 }')
vagrant autocomplete install --"$shell"

echo "Installing Vagrant...DONE"

exit 0

