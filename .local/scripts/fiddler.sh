#!/bin/bash

set -e

USERNAME=cmejia
FIDDLER_BIN_PATH=/home/$USERNAME/bin/fiddler

if [ "$(whoami)" != root ]; then
  echo "Run this script '$0' as root"
  exit 1
fi

echo "Installing Fiddler..."

mkdir -p /home/$USERNAME/bin
wget -q https://api.getfiddler.com/linux/latest-linux -O $FIDDLER_BIN_PATH
chmod +x $FIDDLER_BIN_PATH
chown -R $USERNAME:$USERNAME $FIDDLER_BIN_PATH

echo "Installing Fiddler...DONE"

exit 0

