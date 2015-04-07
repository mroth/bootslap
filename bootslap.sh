#!/bin/bash

##############################################################
# Script to bootstrap dependencies for the bootslap project. #
##############################################################
# Guess default repo path unless $BOOTSLAP_REPO is present.
DEFAULT_REPO=https://github.com/${USER}/bootslap.git
REPO=${BOOTSLAP_REPO:-$DEFAULT_REPO}
DEST=~/src/bootslap
##############################################################

echo -ne "\x1b[37m"
cat <<'EOF'

                                                     _  / |
                                                    / \ | | /\
                                                     \ \| |/ /
                                                      \ Y | /___
          __                __       __             .-.) '. `__/
         / /_  ____  ____  / /______/ /___ _____   (.-.   / /
        / __ \/ __ \/ __ \/ __/ ___/ / __ `/ __ \      | ' |
       / /_/ / /_/ / /_/ / /_(__  ) / /_/ / /_/ /      |___|
      /_.___/\____/\____/\__/____/_/\__,_/ .___/      [_____]
                                        /_/           |     |
EOF


echo -ne "\x1b[0m"
echo "
Hello!  I'm going to set up this workstation for you.  It might take some time,
but I guarantee it will be quicker than doing it yourself.

As a reminder, essentially all this script does is:

  1. Installs MacOSX Command Line Dev Tools (if needed).
  2. Installs HomeBrew.
  3. Uses Homebrew to install Ansible.
  4. Clones the bootslap repository.
  5. Runs the default playbooks (which do all the real work).
"

read -n1 -p  $'\e[0;1m👻  Party Ghost sez: "SooOOoOo... R u rdy 2 party"?  \e[2m[y/N] ' yn

if [[ $yn != [Yy] ]]; then
  printf "\nSo long sucker.\n"; exit;
fi


printf "\n\e[0m
🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉
                        FUCK YEAH HOMEY, LET'S ROLL!
🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉 🎉
"

echo "Hey, my homeboy Homebrew is probably going to ask you for your sudo password
so he can mess with some stuff.  Don't worry about it, he's chill."

#
# Install Mac Dev Tools
#
# DEPRECATED: handled by homebrew installer script now!
#

#
# Install homebrew
#
printf "\n🍺 🍺 🍺 🍺 🍺 🍺 🍺 🍺 🍺 🍺 🍺 🍺 🍺   INSTALLING HOMEBREW   🍺 🍺 🍺 🍺 🍺 🍺 🍺 🍺 🍺 🍺 🍺 🍺 🍺\n"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#
# Install ansible via homebrew
#
printf "\n🍻 🍻 🍻 🍻 🍻 🍻 🍻 🍻 🍻 🍻 🍻 🍻 🍻   INSTALLING ANSIBLE    🍻 🍻 🍻 🍻 🍻 🍻 🍻 🍻 🍻 🍻 🍻 🍻 🍻\n"
brew install git ansible

#
# Clone my repo to somewhere useful, and chdir to it
#
printf "\n🍕 🍕 🍕 🍕 🍕 🍕 🍕 🍕 🍕 🍕 🍕 🍕 🍕    CLONING PLAYBOOKS    🍕 🍕 🍕 🍕 🍕 🍕 🍕 🍕 🍕 🍕 🍕 🍕 🍕\n"
if [ ! -d  $DEST ]; then
  mkdir -p `dirname $DEST`
  git clone $REPO $DEST
else
  echo "Already cloned, updating to latest."
  (cd $DEST && git pull)
fi

#
# Run all relevant playbooks
#
printf "\n💰 💰 💰 💰 💰 💰 💰 💰 💰 💰 💰 💰 💰    RUNNING PLAYBOOKS    💰 💰 💰 💰 💰 💰 💰 💰 💰 💰 💰 💰 💰\n"
if [ "$TRAVIS" == "true" ]; then
  # if we are running on travis-ci, run the tests in check mode instead
  echo "Detected run on travis-ci, running playbooks in check mode for dry-run."
  cd $DEST
  ansible-playbook --check install.yml shell.yml configure.yml
else
  (cd $DEST && ansible-playbook -K install.yml shell.yml configure.yml --skip-tags "xtra")
fi
