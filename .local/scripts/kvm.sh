#!/bin/bash

set -e

USERNAME=cmejia

if [ "$(whoami)" != root ]; then
  echo "Run this script '$0' as root"
  exit 1
fi

echo "Installing KVM..."

echo "Checking if your processor support hardware virtualization"
support_vm=$(grep -cE --color '(vmx|svm)' /proc/cpuinfo)
if [ "$support_vm" -eq 0 ]; then
  echo "######## KVM ########
  Hardware virtualization is not enabled or not supported
  Check if virtualization technology is enabled in BIOS setup.
  " >> ./post_install.txt
  exit 1
else
  sudo apt-get update
  sudo apt-get install --no-install-recommends --yes -t testing qemu-system qemu-utils \
    libvirt-daemon-system libvirt-clients virtinst
  #apt-get install --yes -t testing virt-manager # Desktop application for managing virtual machines
  adduser $USERNAME libvirt
  adduser $USERNAME libvirt-qemu
  newgrp libvirt
  newgrp libvirt-qemu
fi

echo "Installing KVM...DONE"

exit 0

