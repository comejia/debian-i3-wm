#!/bin/bash

set -e

USERNAME=cmejia
INTELLIJ_INSTALL_PATH=/opt/intellij-idea

if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing IntelliJ Idea..."

echo "Download IntelliJ Idea from 'https://www.jetbrains.com/idea/download/#section=linux' in ~/Download folder"
read -p "Press [ENTER] after to download app"

cd /home/$USERNAME/Downloads
# Check if app exists
[[ ! -e $(ls | grep ideaI*-*.tar.gz) ]] && echo "You have not downloaded IntelliJ Idea yet" && exit 1

mkdir -p $INTELLIJ_INSTALL_PATH
tar -xzvf ideaI*-*.tar.gz -C $INTELLIJ_INSTALL_PATH --strip-components=1
chown -R $USERNAME:$USERNAME $INTELLIJ_INSTALL_PATH
rm ideaI*-*.tar.gz

echo "Logout as root and to run '$INTELLIJ_INSTALL_PATH/bin/idea.sh' script"
read -p "Press [ENTER] to continue."

echo "Installing IntelliJ Idea...DONE"

exit 0

