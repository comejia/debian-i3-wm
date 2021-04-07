#!/bin/bash

set -e

APPIUM_DESKTOP_BIN_PATH=/home/$USERNAME/bin/appium-desktop
# Uncomment and set the above line if you only run this script
#USERNAME=

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Installing Appium..."

sudo npm install -g appium --unsafe-perm=true --allow-root
sudo npm install -g appium-doctor

#### Appium Desktop
mkdir -p /home/"$USERNAME"/bin
curl -sSL "$(curl -s https://api.github.com/repos/appium/appium-desktop/releases/latest \
  | jq -r ".assets[] | select(.name | test(\"AppImage\")) | .browser_download_url")" -o "$APPIUM_DESKTOP_BIN_PATH"
chmod +x "$APPIUM_DESKTOP_BIN_PATH"
chown -R "$USERNAME":"$USERNAME" "$APPIUM_DESKTOP_BIN_PATH"

echo "Installing Appium...DONE"

exit 0

