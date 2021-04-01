#!/bin/bash

set -e

USERNAME=cmejia

if [ "$(whoami)" != root ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Kubernetes..."
# kubectl
apt-get update
apt-get install --yes apt-transport-https gnupg2 curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install --yes kubelet kubeadm kubectl
# kubectl autocompletion
kubectl completion bash | tee /etc/bash_completion.d/kubectl > /dev/null
#echo 'source <(kubectl completion bash)' >> ~/.bashrc

# Minikube
cd /tmp
minikube_filename=minikube.deb
curl -sSL https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb -O $minikube_filename
apt install --yes ./$minikube_filename
rm $minikube_filename

cd /home/$USERNAME
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

