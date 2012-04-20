# bashrc is executed for all interactive bash shells

#
# Run our main shell configuration
#
source ~/.dothome/shell/run

#
# Run stuff to configure nice git prompt in shell (bash specific)
#
source ~/.dothome/shell/bash/gitprompt.sh

#
# source git completion from homebrew git install (always brew install git!)
#
source_if_exists /usr/local/etc/bash_completion.d/git-completion.bash

#
# use hub to wrap git
#
#eval "$(hub alias -s)" #FIXME: when bash is run manually, hub alias does zsh commands!
#source_if_exists /usr/local/etc/bash_completion.d/hub.bash_completion.sh

#
# enable color LS output (bash specific need?)
#
export CLICOLOR=1

#
# Let these live here instead of main configuration, 
# cuz rvm installer is annoying and re-adds them!
#
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
