#!/bin/bash

# Setup git config
#user=cmejia
#email=cesarmejia555@yahoo.com.ar
#git config --global user.name "$user"
#git config --global user.email "$email"
#git config --global pull.rebase false

# Add user to sudo
#usermod -aG sudo cmejia


if [ $(whoami) != "root" ] 
then
	echo "You need run this script as root"
	exit 1
fi

apt-get update

echo "Installing google-chrome-stable..."
apt-get install --yes fonts-liberation # dependency for google-chrome

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome.deb
cd /tmp
dpkg -i google-chrome.deb
echo "Installing google-chrome-stable...DONE"

echo "Installing Java 11..."
apt-get install --yes default-jdk
echo "Set Java environment variables in bashrc file"
echo "export JAVA_HOME=/usr/lib/jvm/default-java >> ~/.bashrc"
echo "export PATH=\$PATH:\$JAVA_HOME/bin >> ~/.bashrc"
read -p "Press [ENTER] to continue."
echo "Installing Java 11...DONE"

echo "Installing Jenkins..."
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install --yes jenkins
systemctl start jenkins.service

echo "Open http://localhost:8080 in a browser to finish the instalation"
read -p "Press [ENTER] to continue"
echo "Installing Jenkins...DONE"

exit 0
