#!/bin/bash

#### NOTE ####
# Before run this script you should set GIT_USER and GIT_EMAIL vars
# Visit https://github.com/magicmonty/bash-git-prompt to get more info and config

set -e

# Uncomment and set the above line when you only run this script
#USERNAME=
GIT_USER=
GIT_EMAIL=
DEFAULT_BRANCH=

if [ -z "$USERNAME" ]; then
  echo "'$0' Aborting install because USERNAME variable has not been set"
  exit 1
fi

echo "Git configuration..."

sudo apt-get update
sudo apt-get install --yes git

cd /home/"$USERNAME"
if [ -z "$GIT_USER" ] || [ -z "$GIT_EMAIL" ]; then
  echo "######## Git Config (FAILED) ########
  You need set GIT_USER and GIT_EMAIL.
  Execute in console next command:
    git config --global user.name <git_user>
    git config --global user.email <git_email>
    git config --global pull.rebase false
    git config --global init.defaultBranch <default_branch>
  or rerun this script after to config the variables.
  " >> ./post_install.txt
else
  git config --global user.name "$GIT_USER"
  git config --global user.email "$GIT_EMAIL"
  git config --global pull.rebase false
  git config --global init.defaultBranch "$DEFAULT_BRANCH"
fi

#### git-prompt
rm -rf .bash-git-prompt/
git clone -q https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
chown -R "$USERNAME":"$USERNAME" .bash-git-prompt/

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

#### git-flow
sudo apt-get install --yes -t testing git-flow

git config --global gitflow.feature.finish.push yes
git config --global gitflow.bugfix.finish.push yes
git config --global gitflow.hotfix.finish.push yes


echo "Git configuration...DONE"

exit 0
