#!/bin/bash

#make directory to hold bitly stuff
mkdir -p ~/src/bitly
cd ~/src/bitly


### MAIN REPO
#clone repo
git clone git@github.com:mroth/bitly.git
cd bitly
git remote rename origin mroth
# add aliases for remote endpoints
git remote add bitly git@github.com:bitly/bitly.git 
git remote add jeff git@github.com:jeffreytierney/bitly.git 
git remote add greg git@github.com:gregory80/bitly.git
git remote add scott git@github.com:lederer/bitly.git 

# inspect remote endpoint names
git fetch --all
git remote -v 
git branch -a
# setup a local branch "bitly_master" to track remotes/bitly/master
git checkout -b bitly_master remotes/bitly/master
#return to my master
git checkout master
