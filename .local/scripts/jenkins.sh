#!/bin/bash

set -e

USERNAME=cmejia

if [ "$(whoami)" != root ]; then
  echo "Run this script '$0' as root"
  exit 1
fi

echo "Installing Jenkins..."

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install --yes jenkins
sudo systemctl start jenkins.service

cd /home/$USERNAME
echo "######## Jenkins ########
  Open http://localhost:8080 in a browser to finish the installation
  " >> ./post_install.txt

echo "Installing Jenkins...DONE"

exit 0
