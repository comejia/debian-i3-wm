#!/bin/bash

set -e

USERNAME=cmejia

if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing VirtualBox..."

debian_distro=$(cat /etc/os-release | grep -E "CODENAME" | cut -d'=' -f 2)

echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $debian_distro contrib" > /etc/apt/sources.list.d/virtualbox.list

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -

apt-get update

latest_vb_version=$(apt-cache search virtualbox | tail -1 | cut -d' ' -f 1)

apt-get install --yes $latest_vb_version

echo "Installing VirtualBox...DONE"

exit 0

