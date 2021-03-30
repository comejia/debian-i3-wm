#!/bin/bash

set -e

if [ $(whoami) != "root" ] 
then
	echo "You need run this script as root"
	exit 1
fi

echo "Installing Java 11..."
apt-get update
apt-get install --yes default-jdk

# Title to find in .bashrc file. If title doesn't exist, it will append 
# at the end of the file.
JAVA_VARS_TITLE="# JAVA environment variables"
if [ $(grep -x "$JAVA_VARS_TITLE" ~/.bashrc | wc -l) -eq 0 ]; then
	echo $JAVA_VARS_TITLE >> ~/.bashrc
	echo 'export JAVA_HOME=/usr/lib/jvm/default-java' >> ~/.bashrc
	echo 'export PATH=$PATH:$JAVA_HOME/bin' >> ~/.bashrc
	echo '' >> ~/.bashrc
fi

exit 0
