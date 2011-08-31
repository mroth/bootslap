#!/bin/bash
sudo easy_install pip #needs root in 10.7
sudo pip install virtualenv
sudo pip install virtualenvwrapper

mkdir $HOME/.virtualenvs
cat lib/profile.python.sh >> ~/.bash_profile
source ~/.bash_profile
workon
