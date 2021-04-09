#!/bin/bash

set -e

echo "Installing Atom IDE..."

cd /tmp
atom_filename=atom-amd64.deb
wget -q https://atom.io/download/deb -O $atom_filename
sudo apt install --yes ./$atom_filename # Installing package with dependencies
rm $atom_filename

echo "Installing Atom IDE...DONE"

exit 0

