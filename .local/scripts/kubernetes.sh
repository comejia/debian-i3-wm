#!/bin/bash

set -e

# Uncomment and set the above line if you only run this script
#USERNAME=

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Installing Kubernetes..."

##### kubectl
sudo apt-get update
sudo apt-get install --yes apt-transport-https gnupg2 curl
curl -sSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install --yes kubelet kubeadm kubectl
# kubectl autocompletion
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null
#echo 'source <(kubectl completion bash)' >> ~/.bashrc

#### Minikube
cd /tmp
minikube_filename=minikube.deb
curl -sSL https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb -O $minikube_filename
sudo apt install --yes ./$minikube_filename
rm $minikube_filename

# Setting Android environment variables
cd /home/"$USERNAME"
# Title to find in ~/.bashrc file. If title doesn't exist, it will append at the end of the file.
MINIKUBE_VARS_TITLE="# Minikube vars"
if [ "$(grep -cx "$MINIKUBE_VARS_TITLE" .bashrc)" -eq 0 ]; then
  echo "$MINIKUBE_VARS_TITLE
export MINIKUBE_IN_STYLE=true
export MINIKUBE_WANTUPDATENOTIFICATION=true
  " >> .bashrc
fi

echo "Installing Kubernetes...DONE"

exit 0

