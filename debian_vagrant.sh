#!/bin/bash

set -e

USERNAME=cmejia

if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Vagrant..."

cd /tmp/
# Getting latest version
vagrant_version=$(wget -qO - https://releases.hashicorp.com/vagrant/ | sed -nE 's|.*>vagrant_(.*?)<.*|\1|p' | head -n 1)
wget -c https://releases.hashicorp.com/vagrant/${vagrant_version}/vagrant_${vagrant_version}_x86_64.deb

apt install --yes ./vagrant_${vagrant_version}_x86_64.deb

echo "Installing Vagrant...DONE"

exit 0

