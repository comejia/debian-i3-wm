#!/bin/bash

set -e

USERNAME=cmejia
PYCHARM_INSTALL_PATH=/opt/pycharm

if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing PyCharm Idea..."

echo "Download PyCharm from 'https://www.jetbrains.com/pycharm/download/#section=linux' in ~/Download folder"
read -p "Press [ENTER] after to download app"

cd /home/$USERNAME/Downloads
# Check if app exists
[[ ! -e $(ls | grep pycharm-*.tar.gz) ]] && echo "You have not downloaded PyCharm yet" && exit 1

mkdir -p $PYCHARM_INSTALL_PATH
tar -xzvf pycharm-*.tar.gz -C $PYCHARM_INSTALL_PATH --strip-components=1
chown -R $USERNAME:$USERNAME $PYCHARM_INSTALL_PATH
rm pycharm-*.tar.gz

echo "Logout as root and to run '$PYCHARM_INSTALL_PATH/bin/pycharm.sh' script"
read -p "Press [ENTER] to continue."

echo "Installing PyCharm...DONE"

exit 0

