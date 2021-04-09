#!/bin/bash

set -e

# Set a user who will have sudo privileges
USERNAME=

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Adding user to sudoers..."

echo "$USERNAME ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/"$USERNAME"

echo "Adding user to sudoers...DONE"

exit 0

