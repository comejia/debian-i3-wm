#!/bin/bash

set -e

USERNAME=cmejia
POSTMAN_DIR_PATH=/opt

if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Postman..."

cd /tmp
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz

tar -xzvf postman.tar.gz -C /opt

chown -R $USERNAME:$USERNAME /opt/Postman

ln -s /opt/Postman/Postman /usr/bin/postman

echo "Installing Postman...DONE"

exit 0

