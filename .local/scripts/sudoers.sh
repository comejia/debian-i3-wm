#!/bin/bash

set -e

# Uncomment the above line if you only run this script
#USERNAME=

is_user_set() {
  if [ -z "$USERNAME" ]; then
    echo "Aborting install because USERNAME variable has not been set"
    exit 1
  fi
}

echo "Adding user to sudoers..."
is_user_set

echo "$USERNAME ALL=(ALL:ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/$USERNAME

echo "Adding user to sudoers...DONE"

exit 0

