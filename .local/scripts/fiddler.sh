#!/bin/bash

set -e

FIDDLER_BIN_PATH=/home/$USERNAME/bin/fiddler
# Uncomment and set the above line if you only run this script
#USERNAME=

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Installing Fiddler..."

mkdir -p /home/"$USERNAME"/bin
wget -q https://api.getfiddler.com/linux/latest-linux -O "$FIDDLER_BIN_PATH"
chmod +x "$FIDDLER_BIN_PATH"
chown -R "$USERNAME":"$USERNAME" "$FIDDLER_BIN_PATH"

echo "Installing Fiddler...DONE"

exit 0

