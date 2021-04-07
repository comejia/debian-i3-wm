#!/bin/bash

# Visit https://github.com/magicmonty/bash-git-prompt to get more info and config

set -e

GIT_USER=comejia
GIT_EMAIL=cesarmejia555@yahoo.com.ar
# Uncomment and set the above line if you only run this script
#USERNAME=

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Installing Git..."

sudo apt-get update
sudo apt-get install --yes git
git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_EMAIL"
git config --global pull.rebase false

#### Git prompt
cd /home/"$USERNAME"
rm -rf .bash-git-prompt/
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
chown -R "$USERNAME":"$USERNAME" .bash-git-prompt/

# Enabling git-prompt
# Title to find in ~/.bashrc file. If title doesn't exist, it will append at the end of the file.
GIT_PROMPT_VARS_TITLE="# Git prompt"
if [ "$(grep -cx "$GIT_PROMPT_VARS_TITLE" .bashrc)" -eq 0 ]; then
	echo "$GIT_PROMPT_VARS_TITLE
if [ -f \"\$HOME/.bash-git-prompt/gitprompt.sh\" ]; then
  GIT_PROMPT_ONLY_IN_REPO=1
  source \$HOME/.bash-git-prompt/gitprompt.sh
fi
  " >> .bashrc
fi

echo "Setting Git...DONE"

exit 0
