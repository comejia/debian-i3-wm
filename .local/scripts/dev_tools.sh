#!/bin/bash

set -e

if [ $(whoami) != "root" ] 
then
	echo "You need run this script as root"
	exit 1
fi

apt-get update

echo "Installing Java 11..."
apt-get install --yes default-jdk
echo "Set Java environment variables in bashrc file"
echo "export JAVA_HOME=/usr/lib/jvm/default-java >> ~/.bashrc"
echo "export PATH=\$PATH:\$JAVA_HOME/bin >> ~/.bashrc"
read -p "Press [ENTER] to continue."
echo "Installing Java 11...DONE"

exit 0
