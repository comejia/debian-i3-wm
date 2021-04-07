#!/bin/bash

set -e

ANDROID_INSTALL_PATH=/opt/android-studio
# Uncomment and set the above line if you only run this script
#USERNAME=

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Installing Android Studio..."

cd /home/"$USERNAME"
# Check if app exists
if [ ! -e "$(ls ./Downloads | grep "android-studio-*.tar.gz")" ]; then
  echo "######## Android Studio ########
  Download Android Studio from 'https://developer.android.com/studio' in ~/Download folder.
  Then rerun android_studio.sh script.
  " >> ./post_install.txt
  exit 1
fi

sudo mkdir -p $ANDROID_INSTALL_PATH
sudo tar -xzf ./Downloads/android-studio-*.tar.gz -C $ANDROID_INSTALL_PATH --strip-components=1
sudo chown -R "$USERNAME":"$USERNAME" $ANDROID_INSTALL_PATH
rm ./Downloads/android-studio-*.tar.gz
#sudo ln -s -f $ANDROID_INSTALL_PATH/bin/studio.sh /usr/local/bin/android-studio

# Setting Android environment variables
# Title to find in ~/.bashrc file. If title doesn't exist, it will append at the end of the file.
ANDROID_VARS_TITLE="# Android vars"
if [ "$(grep -cx "$ANDROID_VARS_TITLE" .bashrc)" -eq 0 ]; then
  echo "$ANDROID_VARS_TITLE
export ANDROID_HOME=\$HOME/Android/Sdk
export PATH=\$PATH:\$ANDROID_HOME/platform-tools
export PATH=\$PATH:\$ANDROID_HOME/tools
export PATH=\$PATH:\$ANDROID_HOME/tools/bin
  " >> .bashrc
fi

echo "Installing Android Studio...DONE"

exit 0
