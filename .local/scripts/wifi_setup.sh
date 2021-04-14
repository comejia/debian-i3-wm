#!/bin/bash

#### NOTE ####
# Before run this script you should set WIFI_DRIVER var
# Examples of firmware: firmware-realtek, firmware-atheros, firmware-iwlwifi. Depends on wifi manufacturer

set -e

# Uncomment and set the above line when you only run this script
#USERNAME=
WIFI_DRIVER=

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Setting WIFI driver..."

cd /home/"$USERNAME" || exit
if [ -n "$WIFI_DRIVER" ]; then
  sudo apt-get update
  sudo apt-get install --yes -t testing "$WIFI_DRIVER"
  sudo apt-get install --yes -t testing network-manager
  sudo systemctl restart Networkmanager
  echo "######## WIFI driver (SUCCESS) ########
  Visit https://github.com/comejia/wiki/blob/main/linux-commands.md#network-manager-without-gui repository to get
  a complete network config.
  " >> ./post_install.txt
else
  echo "######## WIFI driver (FAILED) ########
  Please set WIFI_DRIVER variable. Then rerun wifi_setup.sh script.
  $(inxi -N)
  " >> ./post_install.txt
  exit 1
fi

echo "Installing WIFI driver...DONE"

exit 0







