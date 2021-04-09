#!/bin/bash

#### NOTE ####
# Before run this script you need download IntelliJ from https://www.jetbrains.com/idea/download/#section=linux

set -e

# Uncomment and set the above line when you only run this script
#USERNAME=
INTELLIJ_INSTALL_PATH=/opt/intellij-idea

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Installing IntelliJ IDEA..."

cd /home/"$USERNAME"
# Check if app exists
if [ ! -e "$(ls ./Downloads | grep "ideaI*-*.tar.gz")" ]; then
  echo "######## IntelliJ IDEA ########
  Download IntelliJ Idea from 'https://www.jetbrains.com/idea/download/#section=linux' in ~/Download folder
  Then rerun intellij.sh script.
  " >> ./post_install.txt
  exit 1
fi

sudo mkdir -p $INTELLIJ_INSTALL_PATH
sudi tar -xzf ideaI*-*.tar.gz -C $INTELLIJ_INSTALL_PATH --strip-components=1
sudo chown -R "$USERNAME":"$USERNAME" $INTELLIJ_INSTALL_PATH
rm ./Downloads/ideaI*-*.tar.gz
#sudo ln -s -f $INTELLIJ_INSTALL_PATH/bin/idea.sh /usr/local/bin/intellij-idea

echo "Installing IntelliJ IDEA...DONE"

exit 0

