#!/bin/bash

set -e

USERNAME=cmejia
PYCHARM_INSTALL_PATH=/opt/pycharm

if [ "$(whoami)" != root ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing PyCharm..."

cd /home/$USERNAME
# Check if app exists
if [ ! -e "$(ls ./Downloads/ | grep "pycharm-*.tar.gz")" ]; then
  echo "######## PyCharm ########
  Download PyCharm from 'https://www.jetbrains.com/pycharm/download/#section=linux' in ~/Download folder
  Then rerun pycharm.sh script.
  " >> ./post_install.txt
else
  mkdir -p $PYCHARM_INSTALL_PATH
  tar -xzf pycharm-*.tar.gz -C $PYCHARM_INSTALL_PATH --strip-components=1
  chown -R $USERNAME:$USERNAME $PYCHARM_INSTALL_PATH
  rm ./Downloads/pycharm-*.tar.gz
  #ln -s -f $PYCHARM_INSTALL_PATH/bin/pycharm.sh /usr/local/bin/pycharm
fi
echo "Installing PyCharm...DONE"

exit 0

