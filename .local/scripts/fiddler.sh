#!/bin/bash

set -e

USERNAME=cmejia
FIDDLER_BIN_NAME=fiddler.AppImage

if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Fiddler..."

cd /home/$USERNAME/
mkdir -p ./bin
cd ./bin

wget https://api.getfiddler.com/linux/latest-linux -O $FIDDLER_BIN_NAME
chmod +x $FIDDLER_BIN_NAME
chown -R $USERNAME:$USERNAME $FIDDLER_BIN_NAME

echo "Installing Fiddler...DONE"

exit 0

