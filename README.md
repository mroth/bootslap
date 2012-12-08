# Bootstrapper
Scripts and walkthroughs to bootstrap my new Macs when I get them.  This doesn't happen all too often, but in between home, work, desktops, laptops, catastrophic hardware failures, etc., it happens more often than I'd like!

The main things this handles (thus far):

 - installs homebrew and list of packages
 - rvm, ruby 1.9, rails and handy gems
 - pip, virtualenv and virtualenvwrapper for python
 - node.js and npm package manager, with coffeescript installed globally
 - setup zsh and oh-my-zsh
 - in case we aren't used to zsh yet, set up bash nicely too (git prompting, etc)
 - a sane vim and macvim configuration, including solarized color scheme
 - dotfiles are symlinked and kept in a git repository, so they stay up to date across machines (with provisions for host and os-specific files).

This is still a bit of a mess, but getting cleaned up over time, and is approaching the point where it could be easily customized for your own usage.

## VERSION 3
Moving to using chef recipes for software installation.  Trying to backport all my needed installs into `pivotal_workstation` project so they can benefit others.

### MORE TODO
 - set dotfiles repo uri at top of rakefile
 - install_cookbooks_if_dont_exist rake task √
 - ensure bundler runs with rake
 - ensure bundler with rvmrc?


### VERSION 3 TODO
 - finish migration of installers to pivatol_workstation/soloist
   * migrate coffeescript from rake->chef
   * figure out whats up with sublimetext2
 - update documentation
 - missing things from v2
   * zsh_syntax_highlighting script
   * scm_breeze
   * python stuff (remove? dont use anymore)
   * :update script
   * install hub √
   * heroku-toolbelt √
   * macvim
   * janus
   * other important brew packages
     - nmap
     - git-extras
     - wget
   * important gem packages
     - bundler/rake (handled by initial bundle here?)
     - pry/wirble
     - lolcommits
   * clean up dotfiles √
   * move gitconfig into dotfiles instead of commands √
 - move "shell" stuff into dotfiles somehow? √
 - some preference setup
   * aqua color to grey √
   * disable natural scrolling √


## Philosophy
Tasks should be runnable at any time, creating/repairing installations when needed, ignoring stuff if already exists.

## Installation
Make sure you have Apple Dev tools installed because life is impossible on a Mac otherwise (shame this part can't be automated).

Do `sudo gem install bundler; bundle install` in this repo directory.  This will get all your pre-dependencies going.

### Bootstrap
Just do `rake bootstrap`

## Doing stuff manually instead

### Main installation

Want to modify what gets installed?  You can edit the list of recipes in `soloistrc`.

### Other setup (Rake tasks)
There are a few for things that haven't been backported into chef recipes in pivotal_workstation yet.

  * install coffeescript `node:coffee_install`


### Configuration management
#### Dotfiles
User dotfiles are now managed via homesick.  Do `rake dotfiles:install` to get things going.
By default, we look for `$USERNAME/dotfiles` on Github, and we try to infer your GitHub username from system environment.  To manually override, you can set `DOTFILES_GITHUB_USERNAME` and/or `DOTFILES_REPO_NAME`, like so `DOTFILES_GITHUB_USERNAME=johndoe rake dotfiles:setup`
Alternately, you can simply do it manually by following the instructions on the homesick page (or not).

### Updating ALL THE THINGS
Since we're OCD, we need a script update everything.  TODO rewrite for new system



## Inspiration
Came from various places at various times:

- The setup scripts used internally by Bitly Ops
- Paul Hammond's dothome scripts https://github.com/paulhammond/dothome
- pivotal_workstation

## TODO: Things we need to insure are installed but will be hard to automate

- dev tools
- growl
