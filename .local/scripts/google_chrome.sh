#!/bin/bash

set -e

if [ "$(whoami)" != root ]; then
  echo "Run this script '$0' as root"
  exit 1
fi

echo "Installing Google Chrome..."

cd /tmp
chrome_filename=google-chrome.deb
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O $chrome_filename
sudo apt install --yes ./$chrome_filename # Installing with dependencies
rm $chrome_filename

echo "Installing Google Chrome...DONE"

exit 0
