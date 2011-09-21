# Bootstrap mroth mac
Scripts and walkthroughs to bootstrap my new Macs when I get them.  This doesn't happen all too often, but in between home, work, desktops, laptops, etc., it happens more often than I'd like!




## Dev Environment
#### XCode

#### Homebrew (now handled in setup_homebrew.sh)

    /usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/gist/323731)"

#### Configure git

    git config --global user.name "Matthew Rothenberg"
    git config --global user.email "mrothenberg@gmail.com"
    git config --global github.user mroth
    git config --global github.token github_api_token
    git config color.ui true

#### rvm and ruby 1.9 (why not default in Lion? lame...)

    bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
    echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile
    hash -r
    rvm install 1.9.2
    rvm use ruby-1.9.2
    gem install rails bundler

## Configuration
1. Install all software updates.
```sudo softwareupdate -i -a```

2. Generate new SSH keys for the machine.
    1. Generate keys
    
        ssh-keygen -t rsa -C "mroth@bitly.com"
    
    2. Copy to github
    
    3. Copy to home server

3. Set up GUI preferences
    1. DEAR GOD DISABLE NATURAL SCROLLING
    
        defaults write ~/Library/Preferences/.GlobalPreferences com.apple.swipescrolldirection -bool false
        
    2. Change appearance and highlight color to be more monochromatic


## App Configuration


## Installers
Additional things I need to install to be productive.

1. Dropbox
2. TextMate
3. iTerm2
4. solarized theme
5. Keynote

## Other Miscellany
