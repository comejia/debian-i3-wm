#!/bin/bash

set -e

USERNAME=cmejia
APPIUM_DESKTOP_BIN_NAME=appium-desktop

if [ "$(whoami)" != root ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Appium..."

npm install -g appium --unsafe-perm=true --allow-root
npm install -g appium-doctor
# Appium Desktop
cd /home/$USERNAME/
mkdir -p ./bin
cd ./bin
curl -sSL "$(curl -s https://api.github.com/repos/appium/appium-desktop/releases/latest \
  | jq -r ".assets[] | select(.name | test(\"AppImage\")) | .browser_download_url")" -o $APPIUM_DESKTOP_BIN_NAME
chmod +x $APPIUM_DESKTOP_BIN_NAME
chown -R $USERNAME:$USERNAME $APPIUM_DESKTOP_BIN_NAME

echo "Installing Appium...DONE"

exit 0

