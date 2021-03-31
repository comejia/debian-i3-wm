#!/bin/bash

set -e

USERNAME=cmejia
INTELLIJ_INSTALL_PATH=/opt/intellij-idea

if [ "$(whoami)" != root ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing IntelliJ IDEA..."

cd /home/$USERNAME
# Check if app exists
if [ ! -e "$(ls ./Downloads/ | grep "ideaI*-*.tar.gz")" ]; then
  echo "######## IntelliJ IDEA ########
  Download IntelliJ Idea from 'https://www.jetbrains.com/idea/download/#section=linux' in ~/Download folder
  Then rerun intellij.sh script.
  " >> ./post_install.txt
else
  mkdir -p $INTELLIJ_INSTALL_PATH
  tar -xzf ideaI*-*.tar.gz -C $INTELLIJ_INSTALL_PATH --strip-components=1
  chown -R $USERNAME:$USERNAME $INTELLIJ_INSTALL_PATH
  rm ./Downloads/ideaI*-*.tar.gz
  #ln -s -f $INTELLIJ_INSTALL_PATH/bin/idea.sh /usr/local/bin/intellij-idea
fi

echo "Installing IntelliJ IDEA...DONE"

exit 0

