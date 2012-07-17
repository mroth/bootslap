#
# MacOSX specific setup for bash
#

# go to open finder window in terminal
# http://hints.macworld.com/article.php?story=20110817133623734
alias cdf='cd `osascript -e "tell application \"Finder\" to if window 1 exists then if target of window 1 as string is not \":\" then get POSIX path of (target of window 1 as alias)"`'

#
# found in PH's stuff, an awesome notifier when a command that takes more than 10sec finishes
# disabled for now until I special case this to make sure growl and growlnotify are installed before running,
# since I'm paranoid
# #TODO: figure out how to do this
#

# function timer_start {
#   timer=${timer:-$SECONDS}
#   if [ "$BASH_COMMAND" != 'timer_stop' ]; then
#     timed_command=$BASH_COMMAND
#   fi
# }
# function timer_stop {
#   time_taken=$(($SECONDS - $timer))
#   if [ $time_taken -gt 10 ]; then
#     growlnotify -m "$timed_command finished in ${time_taken}s."
#   fi
#   unset timer
# }
# trap 'timer_start' DEBUG
# PROMPT_COMMAND=timer_stop

#
# Go is dumb, needs this for pkg mgmt to work
# (TODO: make more robust or see if homebrew fixes)
#
export GOROOT=`brew --cellar`/go/1.0.2
export GOBIN=/usr/local/bin
export GOARCH=amd64
export GOOS=darwin
