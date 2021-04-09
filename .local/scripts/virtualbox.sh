#!/bin/bash

set -e

echo "Installing VirtualBox..."

echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" \
	| sudo tee /etc/apt/sources.list.d/virtualbox.list > /dev/null
wget -qO- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo apt-key add -
sudo apt-get update
latest_version=$(apt-cache search virtualbox | sed -nE 's/virtualbox-(([0-9])+([.][0-9]+)+).*/\1/p' | sort | tail -1)
sudo apt-get install --yes "virtualbox-$latest_version"
# Installing from Debian packages (only sid repository)
#apt-get update
#apt-get install --yes -t sid virtualbox virtualbox-qt virtualbox-guest-additions-iso

echo "Installing VirtualBox...DONE"

exit 0

