#!/bin/bash

if [ $(whoami) != "root" ] 
then
	echo "You need run this script as root"
	exit 1
fi

apt-get update
echo "Installing WIFI driver..."
inxi -N
echo "Search driver your s.o. needed and enter the package"
read wifi_driver
if [ -n "$wifi_driver" ]
then
	apt-get install --yes $wifi_driver
else
	echo "Error typing wifi driver"
	exit 1
fi
echo "Installing WIFI driver...DONE"

echo "Installing network manager..."
apt-get install -y network-manager
echo "Edit /etc/network/interfaces and /etc/NetworkManager/NetworkManager.conf files."
echo "See wiki repository to more information."
read -p "Press ENTER to continue"
systemctl restart Networkmanager
echo "Installing network manager...DONE"

read -p "Press ENTER to reboot system"
reboot

exit 0







