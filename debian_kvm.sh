#!/bin/bash

set -e

USERNAME=cmejia

if [ $(whoami) != "root" ]; then
	echo "Run this script '$0' as root"
	exit 1
fi

echo "Installing KVM..."

echo "Checking if your processor support hardaware virtualization"
virt=$(grep -E --color '(vmx|svm)' /proc/cpuinfo | wc -l)
if [ $virt -eq 0 ]; then
	echo "Hardware virtualization is not enabled"
	exit 1
fi

apt-get install --no-install-recommends --yes qemu-system qemu-utils libvirt-daemon-system libvirt-clients virtinst

adduser $USERNAME libvirt
adduser $USERNAME libvirt-qemu
newgrp libvirt
newgrp libvirt-qemu

echo "Installing KVM...DONE"

exit 0

