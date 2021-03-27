#!/bin/bash

set -e

USERNAME=cmejia

if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Arduino IDE..."

apt-get update
apt-get install --yes -t testing arduino

usermod -aG dialout $USERNAME

echo "Installing Arduino IDE...DONE"

exit 0

