#make git not suck
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then 
    . /usr/local/etc/bash_completion.d/git-completion.bash
fi
if [ -f ~/.bash_github.sh ]; then 
    . ~/.bash_github.sh
fi

