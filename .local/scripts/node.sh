#!/bin/bash

set -e

echo "Adding Node and NPM..."

# Getting latest version
latest_version=$(wget -qO- https://nodejs.org/dist/latest/ | sed -nE 's/.*>node-v([0-9]+).*/\1/p' | head -n 1)
curl -fsSL "https://deb.nodesource.com/setup_${latest_version}.x" | sudo bash -
sudo apt-get install --yes nodejs

echo "Adding Node and NPM...DONE"

exit 0

