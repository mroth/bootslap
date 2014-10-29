# bootslap
Opinionated scripts to bootstrap my new Mac workstations when I get them. This
doesn't happen all too often, but in between home, work, desktops, laptops,
catastrophic hardware failures, etc., it happens more often than I'd like!

![screenshot](http://f.cl.ly/items/1x272t2F3M073C200R0V/bootslap_banner_v1.png)

[![Build Status](https://travis-ci.org/mroth/bootslap.svg?branch=master)](https://travis-ci.org/mroth/bootslap)

## Core Philosophy
After years of messing with various solutions for this problem, I've tried a lot
of different solutions and evaluated a bunch of different approaches.

As a result of these forays, there are a few things bootslap is opinionated
about:

 - **Stand on the shoulders of giants.**  
   [Homebrew][homebrew] is the best way to manage CLI tools on OSX.
   [Homebrew Cask][brewcask] is the best way to manage binary applications on OSX.
   Make sure these providers are used for automatic installations as well, so
   that we can take advantage of their expansive and well maintained libraries.

 - **Install as much as possible via default tools in default locations.**  
   Doing things in a nonstandard way or putting files in a nonstandard location
   means you might hit state bugs the general populace won't. This also means
   you aren't tied to bootslap in the future -- you can use it once to set stuff
   up and then throw it away later.

 - **Do everything in an idempotent way.**  
   Tasks should be runnable at any time, creating/repairing installations when
   needed, ignoring stuff if already exists.  You should be able to run the
   bootstrap script on a fully up-to-date workstation after making a single
   change, only only that one change will be applied to the machine, and it will
   happen _fast_.

 - **Favor simplicity over modularity.**  
   Goal is for the entire codebase to be understandable and *modifiable*
   directly by anyone seeking to repurpose this, instead of them relying on me
   building in configuration options for whatever they might want to do.

 - **Use the same tools for automatic and interactive modes.**  
   Want to remove something later?  Don't need to mess with finding an uninstall
   script (assuming one even exists) or going searching all over the hard disk
   to figure out where your clever bootstrapper script put stuff.  Just `brew
   uninstall foo` and it's gone.

[homebrew]: http://brew.sh
[brewcask]: http://caskroom.io


## Quick Installation

![factory](http://f.cl.ly/items/1u3a1A1X0K2k0y0K3a0z/giphy.gif)

### Boostrap script :dizzy:

For an absolute pristine new Mac, it should be possible to just clone the repo
and then run `bootslap.sh`.  This will install XCode Command Line Dev Tools,
Homebrew, Ansible, and then run all the playbooks.  You can even do it without
cloning the repo first (useful since MacOSX still doesn't have git by default):

    curl -sL http://git.io/bootslap > /tmp/bootslap; bash /tmp/bootslap

Be sure to stick around for first minute or two so you can give Ansible your
sudo password when it starts running playbooks.


### Manual bootstrapping :hammer:
Don't like running bash scripts piped off the interwebs? Or maybe you hate ASCII
art and emoji? Either way, you can bootstrap the initial steps by hand as well
too.

 1. Install Homebrew:
    `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
 2. Install Ansible via Homebrew:
    `brew install ansible`
 3. Clone this repo, run the playbooks you want and go make yourself a coffee.
    `ansible-playbook -K install.yml shell.yml configure.yml`


## So what gets installed?

Well, _in my particular scripts_, this is what I have shoved onto the SSD:

 - Sets my default shell to zsh with a bunch of extras:
    - _oh-my-zsh_ and _zsh syntax highlighting_.
    - _scm_breeze_ for nicer CLI git.
    - _gh_ (previously _hub_) for better CLI git integration with GitHub.
    - Heroku style local development via _heroku toolbelt_ and _forego_.
    - Collection of good default vim plugins via _Janus_.
    - Awesome dotfile management via _homeshick_.
 - Configures a bunch of programming environments:
    - _Ruby_ (rbenv with all common rubies and Bundler).
    - _NodeJS_ (CoffeeScript, Grunt, Bower, Yeoman).
    - _Go_ (godoc, vet, Godeps).
    - _Erlang/Elixir_.
    - _Haskell Platform_.
    - and _Rust_ (nightly builds).
 - Common libraries you probably want to have around:
    - _XQuartz_, _ImageMagick_.
 - Installs a bunch of common applications for dev types:
    - Chrome, Firefox, MacVim, TextMate, SublimeText, Atom, Dropbox,
      GitHub for Mac, VirtualBox/Vagrant, f.lux, SizeUp...  
 - ...and bunch of common GUI applications:
    - browsers, text editors, music players, even Steam for when I want to
      procrastinate by playing a game.
 - Other handy CLI stuff:
    - git, ack, ssh-copy-id, etc...
 - Configure MacOSX to be less annoying:
    - configure dock, disable network .DS_Store, etc.)


Note that this repo is only half the story, some of magic happens in my
[dotfiles](https://github.com/mroth/dotfiles) as well. (Which these scripts
automatically install for me).

But that's just what mine does! While I've certainly spent an inordinate amount
of time obsessing about tooling and coming up with what I think they best tools
and configuration for the job are, you probably have a different opinion.  These
scripts are designed and written in a way to hopefully be a good starting point
to write your own version, that sets  up things the way _you_ like them.  Check
out the nascent [Customization Guide](CUSTOMIZING.md) for pointers.


## More complex installation topics

### Manual playbook runs
Plays can be run individually if needed.

For example, to just do software installation (in case you don't have a dotfile
repo), you can do run the `install.yml` playbook.  Individual tasks are also
tagged within the playbook so you can even do a
`ansible-playbook install.yml --tags ruby` for example.

### Configuration management
User dotfiles are managed via [homeshick](https://github.com/andsens/homeshick).

By default we look for `$USERNAME/dotfiles` on GitHub when getting things setup,
and we infer your GitHub username from your system environment. You can manually
override this in the `shell.yml` playbook is desired.

### Updating ALL THE THINGS
Since we're OCD, we need a script update everything.  
TODO: This needs to be updated for v5.

## What's New in version 5?

### Version History
I've investigated many possible approaches to this over time. A rough chronology
for historical purposes:

 - version5: Current ansible script solution. Rename to bootslap.
 - [version4][v4] A year of working with the Boxen project instead.
 - [version3][v3]: Moved to using chef recipes for software installation,
   backporting recipes into the `pivotal_workstation` project.
 - [version2][v2]: Fancy Rakefiles version.
 - version1: Mostly just shell scripts (lost to time)

[v4]: https://github.com/mroth/my-boxen
[v3]: https://github.com/mroth/bootstrapper/tree/version3
[v2]: https://github.com/mroth/bootstrapper/tree/version2


### So why didn't you use?....
In other words, alternatives.

#### Boxen
After a year of struggling with Boxen for year (and contributing to the project)
I've decided to abandon it.  Some of the "highlights":

 - Relies upon **custom versions of common packages** (e.g. git) that lag behind
   official point releases.
 - **Needs to own way too much of the system configuration.** Uses it's own git
   credential helper, for example, and overrides your `.gitconfig` to enable it.
 - **Way too much enabled by default.** Much of it to support the GitHub way of
   doing project development (dnsmasq and nginx for project switching). I
   stripped most of it out, but it was quite a lot of effort to do so.
 - **PITA to maintain updates.**  Require constant management of versions in
   Puppetfile.
 - **Custom configurations for many tools.** This results in difficulty
   troubleshooting due to a nonstandard configuration.  Also it breaks lots of
   stuff, for example, Homebrew can't use precompiled bottles due to nonstandard
   paths.
 - **Complex codebase.** Sure, it's mostly puppet recipes, but the way
   everything is strung together makes it complex to understand whats happening
   when something goes wrong.

That said, some of the stuff Boxen does is _very cool_ for large organizations
(automatic GitHub Issue filing on install errors, for example).  If you have a
fulltime sysadmin to manage your configuration and deployments it's probably
worth looking into.

#### Battleschool
Pretty close to what I want, but utilizes its own playbooks for installing
common software.  I'd much rather just depend on homebrew and homebrew-cask.
