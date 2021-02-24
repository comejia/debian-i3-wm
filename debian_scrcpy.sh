#!/bin/bash

set -e

USERNAME=cmejia

if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing scrcpy..."

apt-get update
apt-get install --yes -t testing scrcpy

echo "Installing scrcpy...DONE"

exit 0

