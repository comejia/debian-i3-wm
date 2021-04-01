#!/bin/bash

set -e

USERNAME=cmejia
ARDUINO_INSTALL_PATH=/opt/arduino

if [ "$(whoami)" != root ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Arduino IDE..."

cd /tmp
latest_version=$(curl -s https://api.github.com/repos/arduino/arduino/releases/latest | jq -r ".tag_name")
arduino_filename=arduino.tar.xz
curl -sSL "https://downloads.arduino.cc/arduino-${latest_version}-linux64.tar.xz" -o $arduino_filename

mkdir -p $ARDUINO_INSTALL_PATH
tar -xJf $arduino_filename -C $ARDUINO_INSTALL_PATH --strip-components=1
chown -R $USERNAME:$USERNAME $ARDUINO_INSTALL_PATH
rm $arduino_filename
#ln -s -f $ARDUINO_INSTALL_PATH/arduino /usr/local/bin/arduino
# Running install.sh script to complete the installation
./$ARDUINO_INSTALL_PATH/install.sh

# Installing from Debian packages
#apt-get update
#apt-get install --yes -t testing arduino
usermod -aG dialout $USERNAME

echo "Installing Arduino IDE...DONE"

exit 0

