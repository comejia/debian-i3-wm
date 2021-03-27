#!/bin/bash

set -e

USERNAME=cmejia

if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Adding user to sudoers..."

echo "$USERNAME ALL=(ALL:ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/$USERNAME

echo "Adding user to sudoers...DONE"

exit 0

