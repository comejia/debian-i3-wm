#!/bin/bash

set -e

USERNAME=cmejia

if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Visual Studio Code IDE..."

cd /tmp
wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O vscode.deb

apt install --yes ./vscode.deb

echo "Installing Visual Studio Code IDE...DONE"

exit 0

