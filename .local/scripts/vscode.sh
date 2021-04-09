#!/bin/bash

set -e

echo "Installing Visual Studio Code..."

cd /tmp
vscode_filename=vscode.deb
wget -q 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O $vscode_filename
sudo apt install --yes ./$vscode_filename
rm $vscode_filename

echo "Installing Visual Studio Code...DONE"

exit 0

