#!/bin/bash

# Visit https://github.com/magicmonty/bash-git-prompt to get more info and config

set -e

if [ $(whoami) = "root" ]; then
	echo "Running this script as normal user, no root"
	exit 1
fi

echo "Setting Git..."
#apt-get update
#apt-get install --yes git

git_user=cmejia
git_email=cesarmejia555@yahoo.com.ar
git config --global user.name "$git_user"
git config --global user.email "$git_email"
git config --global pull.rebase false

rm -rf ~/.bash-git-prompt/
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Title to find in .bashrc file. If title doesn't exist, it will append 
# at the end of the file.
GIT_PROMPT_TITLE="# Git prompt"

if [ $(grep -x "$GIT_PROMPT_TITLE" ~/.bashrc | wc -l) -eq 0 ]; then
	echo $GIT_PROMPT_TITLE >> ~/.bashrc
	echo 'if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then' >> ~/.bashrc
	echo '	GIT_PROMPT_ONLY_IN_REPO=1' >> ~/.bashrc
	echo '	source $HOME/.bash-git-prompt/gitprompt.sh' >> ~/.bashrc
	echo 'fi' >> ~/.bashrc
	echo '' >> ~/.bashrc
fi

echo "Setting Git...DONE"

exit 0
