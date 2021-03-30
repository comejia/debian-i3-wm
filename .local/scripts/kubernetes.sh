#!/bin/bash

set -e

USERNAME=cmejia

if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing Kubernetes..."
# kubectl
apt-get update && apt-get install --yes apt-transport-https gnupg2 curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install --yes kubelet kubeadm kubectl

# kubectl autocompletion
kubectl completion bash | tee /etc/bash_completion.d/kubectl > /dev/null
#echo 'source <(kubectl completion bash)' >> ~/.bashrc

# Minikube
cd /tmp/
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
dpkg -i minikube_latest_amd64.deb

cd /home/$USERNAME
MINIKUBE_ENV_TITLE="# Minikube environment variables"
if [ $(grep -x "$MINIKUBE_ENV_TITLE" .bashrc | wc -l) -eq 0 ]; then
        echo $MINIKUBE_ENV_TITLE >> .bashrc
        echo 'export MINIKUBE_IN_STYLE=true' >> .bashrc
	echo 'export MINIKUBE_WANTUPDATENOTIFICATION=true' >> .bashrc
        echo '' >> .bashrc
fi

echo "Installing Kubernetes...DONE"

exit 0

