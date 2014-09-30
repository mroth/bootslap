# Bootstrapper
Scripts and walkthroughs to bootstrap my new Macs when I get them.  This doesn't
happen all too often, but in between home, work, desktops, laptops, catastrophic
hardware failures, etc., it happens more often than I'd like!

The main things this handles (thus far):

 - Setup Zsh shell with a bunch of extras:
    - _oh-my-zsh_ and _zsh syntax highlighting_.
    - _scm-breeze_ for nicer CLI git.
    - _gh_ (formerly _hub_) for better CLI git integration with GitHub.
    - Heroku style local development with the _heroku toolbelt_ and _forego_.
    - Collection of vim plugins via _Janus_.
    - Awesome dotfile management via _homeshick_.
 - Programming environments:
    - _Ruby_ (rbenv with all common rubies and bundler).
    - _NodeJS_ (CoffeeScript, Grunt, Bower, Yeoman).
    - _Go_.
    - _Erlang/Elixir_.
    - _Haskell_.
    - and _Rust_.
 - Common libraries you want to have around: _XQuartz_, _ImageMagick_.
 - Installs a bunch of common applications for dev types: Chrome, Firefox,
   MacVim, TextMate, SublimeText, Dropbox, GitHub for Mac, VirtualBox/Vagrant,
   SizeUp...  
 - A bunch of common GUI applications (browsers, text editors, music players,
   etc.)
 - Other handy CLI stuff: git, ack, ssh-copy-id, etc...
 - Configure MacOSX to be less annoying (configure dock, disable networked
   .DS_Store, etc.) {TODO}


Note that this repo is only half the story, some of magic happens in my
[dotfiles](https://github.com/mroth/dotfiles) as well. (Which these scripts
automatically install for me).

## Core Philosophy

 - **Stand on the shoulders of giants.** Install as much as possible via default
   tools in default locations  
 - **Do everything in an idempotent way.** (Tasks should be runnable at any time,
   creating/repairing installations when needed, ignoring stuff if already
   exists.)  
 - **Favor "smallest amount of code" over configuration flexibility whenever
   makes sense.** Goal is for the entire codebase to be understandable and
   *modifiable* directly by anyone seeking to repurpose this, instead of them
   relying on me building in configuration options for whatever they might want
   to do.


## Simple Installation

### Boostrap script

For an absolute pristine new Mac, it should be possible to just clone the repo
and then run `bootstrap.sh`.  This will install XCode Command Line Dev Tools,
Homebrew, Ansible, and then run all the playbooks.  

Be sure to stick around for first minute or two so you can give Ansible your
sudo password when it starts running playbooks.

### Manual installation
Make sure you have Apple Dev Tools installed because life is impossible on a
Mac otherwise (the Homebrew install should check on this for you automatically).

 1. Install Homebrew

    `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

 2. Install Ansible via Homebrew

    `brew install ansible`

 3. Clone this repo, run the playbooks you want and go make yourself a coffee.

    `ansible-playbook -K install.yml shell.yml configure.yml`


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

[v4]: #
[v3]: #
[v2]: #


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
