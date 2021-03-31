#!/bin/bash

set -e

USERNAME=cmejia
POSTMAN_INSTALL_PATH=/opt/Postman

if [ "$(whoami)" != root ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Postman..."

cd /tmp
postman_filename=postman.tar.gz
wget -q https://dl.pstmn.io/download/latest/linux64 -O $postman_filename

mkdir -p $POSTMAN_INSTALL_PATH
tar -xzf $postman_filename -C $POSTMAN_INSTALL_PATH --strip-components=1
chown -R $USERNAME:$USERNAME $POSTMAN_INSTALL_PATH
rm $postman_filename
#ln -s -f $POSTMAN_INSTALL_PATH/Postman /usr/local/bin/postman

echo "Installing Postman...DONE"

exit 0

