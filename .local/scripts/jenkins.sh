#!/bin/bash

set -e

# Uncomment and set the above line if you only run this script
#USERNAME=

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Installing Jenkins..."

wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update
sudo apt-get install --yes jenkins
sudo systemctl start jenkins.service

cd /home/"$USERNAME"
echo "######## Jenkins ########
  Open http://localhost:8080 in a browser to finish the installation
  " >> ./post_install.txt

echo "Installing Jenkins...DONE"

exit 0
