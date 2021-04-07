#!/bin/bash

set -e

PYCHARM_INSTALL_PATH=/opt/pycharm
# Uncomment and set the above line if you only run this script
#USERNAME=

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Installing PyCharm..."

cd /home/"$USERNAME"
# Check if app exists
if [ ! -e "$(ls ./Downloads/ | grep "pycharm-*.tar.gz")" ]; then
  echo "######## PyCharm ########
  Download PyCharm from 'https://www.jetbrains.com/pycharm/download/#section=linux' in ~/Download folder
  Then rerun pycharm.sh script.
  " >> ./post_install.txt
  exit 1
fi

sudo mkdir -p $PYCHARM_INSTALL_PATH
sudo tar -xzf pycharm-*.tar.gz -C $PYCHARM_INSTALL_PATH --strip-components=1
sudo chown -R "$USERNAME":"$USERNAME" $PYCHARM_INSTALL_PATH
rm ./Downloads/pycharm-*.tar.gz
#sudo ln -s -f $PYCHARM_INSTALL_PATH/bin/pycharm.sh /usr/local/bin/pycharm

echo "Installing PyCharm...DONE"

exit 0

