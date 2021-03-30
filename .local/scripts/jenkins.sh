#!/bin/bash

set -e

if [ $(whoami) != "root" ] 
then
	echo "You need run this script as root"
	exit 1
fi

echo "Installing Jenkins..."

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list
apt-get update
apt-get install --yes jenkins
systemctl start jenkins.service

echo "Open http://localhost:8080 in a browser to finish the instalation"
read -p "Press [ENTER] to continue"

echo "Installing Jenkins...DONE"

exit 0
