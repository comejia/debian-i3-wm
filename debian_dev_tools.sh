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


echo "Installing Docker..."
apt-get install --yes apt-transport-https \
	ca-certificates \
	curl \
	gnupg-agent \
	software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

apt-get update
apt-get install --yes docker-ce docker-ce-cli containerd.io
systemctl start docker.service

groupadd docker
echo "Enter user to add docker group. Available users:"
echo "--> $(users)"
read user
usermod -aG docker $user
newgrp docker
echo "Installing Docker...DONE"


echo "Installing docker-compose..."
compose_version=1.28.2
echo "Enter docker-compose version (default $compose_version):"
read version
if [ -n "$version" ]
then
	compose_version=$version
fi
curl -L "https://github.com/docker/compose/releases/download/$compose_version/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Installing command-line completion
echo "docker-compose version: $compose_version"
curl -L https://raw.githubusercontent.com/docker/compose/$compose_version/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose
echo "Installing docker-compose...DONE"


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
