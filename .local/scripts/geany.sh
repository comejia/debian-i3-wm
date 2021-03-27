#!/bin/bash

set -e

USERNAME=cmejia

if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing geany..."

apt-get update
apt-get install --yes geany #geany-plugins

echo "Installing geany...DONE"

exit 0

