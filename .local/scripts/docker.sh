#!/bin/bash

set -e

USERNAME=cmejia

if [ "$(whoami)" != root ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Docker..."

apt-get update
apt-get install --yes apt-transport-https \
	ca-certificates \
	curl \
	gnupg \
	lsb-release #software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
  > /etc/apt/sources.list.d/docker.list
apt-get update
apt-get install --yes docker-ce docker-ce-cli containerd.io

groupadd docker
usermod -aG docker $USERNAME
newgrp docker
systemctl start docker.service

echo "Installing Docker...DONE"


echo "Installing Docker Compose..."

latest_version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r ".tag_name")
curl -sSL "https://github.com/docker/compose/releases/download/${latest_version}/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
# Installing command-line completion
curl -sSL "https://raw.githubusercontent.com/docker/compose/${latest_version}/contrib/completion/bash/docker-compose" \
  -o /etc/bash_completion.d/docker-compose

echo "Installing Docker Compose...DONE"

exit 0
