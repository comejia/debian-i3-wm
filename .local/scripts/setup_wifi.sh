#!/bin/bash

# Examples of firmware: firmware-realtek, firmware-atheros, firmware-iwlwifi.
# Depends on wifi manufacturer
WIFI_DRIVER=
# Uncomment and set the above line if you only run this script
#USERNAME=

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







