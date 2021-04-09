#!/bin/bash

set -e

# Uncomment and set the above line when you only run this script
#USERNAME=
ARDUINO_INSTALL_PATH=/opt/arduino

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Installing Arduino IDE..."

cd /tmp
latest_version=$(curl -s https://api.github.com/repos/arduino/arduino/releases/latest | jq -r ".tag_name")
arduino_filename=arduino.tar.xz
curl -sSL "https://downloads.arduino.cc/arduino-${latest_version}-linux64.tar.xz" -o $arduino_filename

sudo mkdir -p $ARDUINO_INSTALL_PATH
sudo tar -xJf $arduino_filename -C $ARDUINO_INSTALL_PATH --strip-components=1
sudo chown -R "$USERNAME":"$USERNAME" $ARDUINO_INSTALL_PATH
rm $arduino_filename
#sudo ln -s -f $ARDUINO_INSTALL_PATH/arduino /usr/local/bin/arduino

# Running install.sh script to complete the installation
./$ARDUINO_INSTALL_PATH/install.sh

# Installing from Debian packages
#apt-get update
#apt-get install --yes -t testing arduino
sudo usermod -aG dialout "$USERNAME"

echo "Installing Arduino IDE...DONE"

exit 0

