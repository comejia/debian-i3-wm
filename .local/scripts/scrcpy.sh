#!/bin/bash

set -e

echo "Installing scrcpy..."

sudo apt-get update
sudo apt-get install --yes -t testing scrcpy

echo "Installing scrcpy...DONE"

exit 0

