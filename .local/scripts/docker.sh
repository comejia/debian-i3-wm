#!/bin/bash

set -e

# Uncomment and set the above line if you only run this script
#USERNAME=

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Installing Docker..."

sudo apt-get update
sudo apt-get install --yes apt-transport-https ca-certificates curl gnupg lsb-release #software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
  | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install --yes docker-ce docker-ce-cli containerd.io

sudo groupadd docker
sudo usermod -aG docker "$USERNAME"
sudo newgrp docker
sudo systemctl start docker.service

#### Docker compose
latest_version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r ".tag_name")
sudo curl -sSL "https://github.com/docker/compose/releases/download/${latest_version}/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# docker-compose autocompletion
sudo curl -sSL "https://raw.githubusercontent.com/docker/compose/${latest_version}/contrib/completion/bash/docker-compose" \
  -o /etc/bash_completion.d/docker-compose

echo "Installing Docker...DONE"


exit 0
