#!/bin/bash

set -e

USERNAME=cmejia
ANDROID_INSTALL_PATH=/opt/android-studio

if [ "$(whoami)" != root ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Android Studio..."

cd /home/$USERNAME
# Check if app exists
if [ ! -e "$(ls ./Downloads/ | grep "android-studio-*.tar.gz")" ]; then
	echo "######## Android Studio ########
	Download Android Studio from 'https://developer.android.com/studio' in ~/Download folder.
	Then rerun android_studio.sh script.
  " >> ./post_install.txt
else
	mkdir -p $ANDROID_INSTALL_PATH
	tar -xzf android-studio-*.tar.gz -C $ANDROID_INSTALL_PATH --strip-components=1
	chown -R $USERNAME:$USERNAME $ANDROID_INSTALL_PATH
	rm ./Downloads/android-studio-*.tar.gz
	#ln -s -f $ANDROID_INSTALL_PATH/bin/studio.sh /usr/local/bin/android-studio

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
fi

echo "Installing Android Studio...DONE"

exit 0
