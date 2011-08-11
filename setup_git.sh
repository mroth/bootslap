#!/bin/bash
echo "Making sure homebrew version of git is installed..."
brew install git

echo "Configuring global preferences..."
git config --global user.name "Matthew Rothenberg"
git config --global user.email "mrothenberg@gmail.com"
git config --global color.ui true

echo ".DS_Store" >> ~/.gitignore
git config --global core.excludesfile ~/.gitignore

#get github setup!
echo "Configuring github support..."
git config --global github.user "mroth"
read -p "You need your github API token.  Hit enter to get it..."
open "https://github.com/account/admin"
read -p "When you have your API key, enter it here: " api_key
echo "RUNNING: git config --global github.token $api_key"
git config --global github.token $api_key

echo "Enabling bash completion"
cp /usr/local/etc/bash_completion.d/git-completion.bash ~/.git-completion.sh
cat lib/profile.git.sh >> ~/.bash_profile
