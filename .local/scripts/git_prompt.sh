#!/bin/bash

# Visit https://github.com/magicmonty/bash-git-prompt to get more info and config

set -e

GIT_USER=comejia
GIT_EMAIL=cesarmejia555@yahoo.com.ar

if [ "$(whoami)" = root ]; then
	echo "Running this script as normal user, no root"
	exit 1
fi

echo "Setting Git..."

#apt-get update
#apt-get install --yes git
git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_EMAIL"
git config --global pull.rebase false

rm -rf ~/.bash-git-prompt/
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Title to find in ~/.bashrc file. If title doesn't exist, it will append at the end of the file.
GIT_PROMPT_TITLE="# Git prompt"
if [ "$(grep -cx "$GIT_PROMPT_TITLE" ~/.bashrc)" -eq 0 ]; then
	echo "$GIT_PROMPT_TITLE
if [ -f \"\$HOME/.bash-git-prompt/gitprompt.sh\" ]; then
	GIT_PROMPT_ONLY_IN_REPO=1
	source \$HOME/.bash-git-prompt/gitprompt.sh
fi
  " >> ~/.bashrc
fi

echo "Setting Git...DONE"

exit 0
