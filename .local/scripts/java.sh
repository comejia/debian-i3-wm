#!/bin/bash

set -e

USERNAME=cmejia

if [ "$(whoami)" != root ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Java (default)..."

apt-get update
apt-get install --yes default-jdk

cd /home/$USERNAME
# Title to find in ~/.bashrc file. If title doesn't exist, it will append at the end of the file.
JAVA_VARS_TITLE="# JAVA vars"
if [ "$(grep -cx "$JAVA_VARS_TITLE" ~/.bashrc)" -eq 0 ]; then
	echo "$JAVA_VARS_TITLE
export JAVA_HOME=/usr/lib/jvm/default-java
export PATH=\$PATH:\$JAVA_HOME/bin
  " >> ~/.bashrc
fi

echo "Installing Java (default)...DONE"

exit 0
