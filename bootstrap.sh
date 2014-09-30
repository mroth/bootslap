#!/bin/sh

#####################################
# Script to bootstrap dependencies. #
#####################################

#
# Install Mac Dev Tools
#
# DEPRECATED: handled by homebrew installer script now!
#

#
# Install homebrew
#
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#
# Install ansible via homebrew
#
brew install ansible

#
# Run all relevant playbooks
#
ansible-playbook -K install.yml shell.yml
