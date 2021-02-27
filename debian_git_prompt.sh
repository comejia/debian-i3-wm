#!/bin/bash

# Visit https://github.com/magicmonty/bash-git-prompt to get more info and config

set -e

if [ $(whoami) = "root" ]; then
	echo "Running this script as normal user, no root"
	exit 1
fi

cd ~/
rm -rf .bash-git-prompt/
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Title to find in .bashrc file. If it doesn't exist, git-prompt setup 
# will append at the end of the file
GIT_PROMPT_TITLE="# Git prompt"

if [ $(grep -x "$GIT_PROMPT_TITLE" ~/.bashrc | wc -l) -eq 0 ]; then
	echo $GIT_PROMPT_TITLE >> ~/.bashrc
	echo 'if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then' >> ~/.bashrc
	echo '	GIT_PROMPT_ONLY_IN_REPO=1' >> ~/.bashrc
	echo '	source $HOME/.bash-git-prompt/gitprompt.sh' >> ~/.bashrc
	echo 'fi' >> ~/.bashrc
fi

exit 0
