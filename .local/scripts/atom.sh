#!/bin/bash

set -e

USERNAME=cmejia

if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Atom IDE..."

cd /tmp
wget https://atom.io/download/deb -O atom-amd64.deb

# All dependencies will be installed with this form
apt install --yes ./atom-amd64.deb

# For older Linux distributions (disable set -e flag)
#dpkg -i atom-amd64.deb
#apt-get install -f

echo "Installing Atom...DONE"

exit 0

