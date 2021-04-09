#!/bin/bash

set -e

echo "Installing Google Chrome..."

cd /tmp
chrome_filename=google-chrome.deb
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O $chrome_filename
sudo apt install --yes ./$chrome_filename # Installing with dependencies
rm $chrome_filename

echo "Installing Google Chrome...DONE"

exit 0
