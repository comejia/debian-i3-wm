#!/bin/bash

WIFI_DRIVER=

if [ "$(whoami)" != root ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Setting WIFI driver..."

if [ -n "$WIFI_DRIVER" ]; then
  apt-get update
	apt-get install --yes "$WIFI_DRIVER"
	apt-get install --yes network-manager
	systemctl restart Networkmanager
	echo "######## WIFI driver (success) ########
	Visit https://github.com/comejia/wiki/blob/main/linux-commands.md#network-manager-without-gui repository to get
	a complete network config.
  " >> ./post_install.txt
else
	echo "######## WIFI driver (failure) ########
  Please set WIFI_DRIVER variable. Then rerun setup_wifi.sh script.
  $(inxi -N)
  " >> ./post_install.txt
	exit 1
fi

echo "Installing WIFI driver...DONE"

exit 0







