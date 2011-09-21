#some nice shell prompting stolen from centos bitly install

# display current git branch
function parse_git_branch {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# display current svn branch
function parse_svn_branch {
	svn info 2> /dev/null | grep '^URL:' | egrep -o '(tags|branches)/[^/]+|trunk' | egrep -o '[^/]+$' | awk '{print "(" $1 ")"}'
}

# display current mercurial branch
function parse_hg_branch {
    hg branch 2> /dev/null | awk '{print "(" $1 ")"}'
}

RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
LIGHT_PURPLE="\[\033[1;35m\]"
LIGHT_CYAN="\[\033[1;36m\]"
WHITE="\[\033[00m\]"

export PS1="$LIGHT_GREEN\h$LIGHT_CYAN \w$WHITE:$YELLOW\$(parse_git_branch)\$(parse_svn_branch)\$(parse_hg_branch)$WHITE\$ "
