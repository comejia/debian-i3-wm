#!/bin/bash

set -e

# Uncomment and set the above line if you only run this script
#USERNAME=

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Installing Java (default)..."

sudo apt-get update
sudo apt-get install --yes default-jdk
cd /home/"$USERNAME"

# Setting JAVA environment variables
# Title to find in ~/.bashrc file. If title doesn't exist, it will append at the end of the file.
JAVA_VARS_TITLE="# JAVA vars"
if [ "$(grep -cx "$JAVA_VARS_TITLE" .bashrc)" -eq 0 ]; then
  echo "$JAVA_VARS_TITLE
export JAVA_HOME=/usr/lib/jvm/default-java
export PATH=\$PATH:\$JAVA_HOME/bin
  " >> .bashrc
fi

echo "Installing Java (default)...DONE"

exit 0
