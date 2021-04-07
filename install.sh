#!/bin/bash

##### Set username for all scripts
export USERNAME=

##### Variables to setup system
create_basic_dirs=yes
copy_config_files=yes
install_system_packages=yes
install_dev_applications=no

function check_privileges() {
  if [ "$(whoami)" != "root" ]; then
    if [ -z "$(sudo -nl 2> /dev/null)" ]; then
      echo "This script '$0' should be run with sudo privileges or as root"
      echo "Run as root 'sudoers.sh' script to add user in sudoers"
      exit 1
    fi
  fi
}

function is_user_set() {
  if [ -z "$USERNAME" ]; then
    echo "Aborting install because USERNAME variable has not been set"
    exit 1
  fi
}

check_privileges
is_user_set

#### Add dirs most used if they are not exist
if [ "$create_basic_dirs" == yes ]; then
  mkdir -p /home/"$USERNAME"/Desktop
  mkdir -p /home/"$USERNAME"/Documents
  mkdir -p /home/"$USERNAME"/Downloads
  mkdir -p /home/"$USERNAME"/Pictures
  mkdir -p /home/"$USERNAME"/Videos
  mkdir -p /home/"$USERNAME"/Music
fi

#### Copy files of system config
if [ "$copy_config_files" == yes ]; then
  cp -r .config/ /home/"$USERNAME"/.config/
  cp -r .local/ /home/"$USERNAME"/.local/
  cp -r bin/ /home/"$USERNAME"/bin/
  sudo cp etc/apt/preferences.d/custom-preferences /etc/apt/preferences.d/
  cp .bash_aliases /home/"$USERNAME"/
  cp .Xresources /home/"$USERNAME"/
  cp .xsessionrc /home/"$USERNAME"/
fi

#### Install main system packages
if [ "$install_system_packages" == yes ]; then
  ./system_install.sh
fi

#### Install apps to develop
# Comment or uncomment the app you want
if [ "$install_dev_applications" == yes ]; then
  cd .local/scripts || exit
  # Containers tools
  ./docker.sh
  ./kubernetes.sh

  # IDE's
  ./android_studio.sh
  ./intellij.sh
  ./vscode.sh
  ./pycharm.sh
  #./atom.sh
  #./arduino.sh

  # Automation tools
  ./jenkins.sh
  ./node.sh
  ./appium.sh
  ./postman.sh
  ./scrcpy.sh
  #./jmeter.sh
  #./fiddler.sh

  # Virtual machines
  ./kvm.sh
  ./virtualbox.sh
  ./vagrant.sh
fi
