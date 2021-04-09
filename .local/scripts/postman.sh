#!/bin/bash

set -e

# Uncomment and set the above line when you only run this script
#USERNAME=
POSTMAN_INSTALL_PATH=/opt/Postman

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Installing Postman..."

cd /tmp
postman_filename=postman.tar.gz
wget -q https://dl.pstmn.io/download/latest/linux64 -O $postman_filename

sudo mkdir -p $POSTMAN_INSTALL_PATH
sudo tar -xzf $postman_filename -C $POSTMAN_INSTALL_PATH --strip-components=1
sudo chown -R "$USERNAME":"$USERNAME" $POSTMAN_INSTALL_PATH
rm $postman_filename
#sudo ln -s -f $POSTMAN_INSTALL_PATH/Postman /usr/local/bin/postman

echo "Installing Postman...DONE"

exit 0

