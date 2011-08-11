#!/bin/bash
bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile
hash -r
rvm install 1.9.2
rvm use ruby-1.9.2
gem install rails bundler 
gem install launchy heroku sqlite3
