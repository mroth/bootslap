# Bootstrapper
Scripts and walkthroughs to bootstrap my new Macs when I get them.  This doesn't happen all too often, but in between home, work, desktops, laptops, catastrophic hardware failures, etc., it happens more often than I'd like!

The main things this handles (thus far):

 - homebrew and list of packages
 - rvm, ruby 1.9, rails 3.1 and handy gems
 - pip, virtualenv and virtualenvwrapper for python
 - node.js and npm package manager
 - textmate plugins, snippits, etc., and solarized color scheme
 - a sane vim and macvim configuration, including solarized color scheme
 - dotfiles are symlinked and kept in a git repository, so they stay up to date across machines (with provisions for host and os-specific files).

This is still a bit of a mess, but getting cleaned up over time, and is approaching the point where it could be easily customized for your own usage.

## Philosophy
Tasks should be runnable at any time, creating/repairing installations when needed, ignoring stuff if already exists.

## Installation

### Get the files
Clone the repository into my home directory:
`git clone git@github.com:mroth/bootstrapper.git ~/.dothome`

READONLY MODE:
`git clone git://github.com/mroth/bootstrapper.git ~/.dothome`

### bash setup
Run `rake dotfiles:install` which will symlink your .bash_profile and .bashrc to the ones in the repo (as well as any other files).  Old files will be backed up with a .old suffix.

Most of the work here happens in `bash/run`.  Note that host and OS specific files will be sourced in `bash/host/*` and `bash/os/*` if they exist, this allows you to have one master repo but still have certain things that only happen on certain OSes or machines.

### homebrew and packages
Run `rake homebrew:install` which will install homebrew, update the package list, and install the list of packages found in `brew/*`.

These tasks are also available individually via `homebrew:brew_install`, `homebrew:brew_update`, and `homebrew:packages_install`.

*TODO: add brew:uninstall sourcing the uninstall_homebrew.sh script?*

### rvm, ruby 1.9.2, rails 3.1, and commonly used gems
*TODO*

### python with virtualenv setup
Use `rake python:install`. Done.

### setup work stuff
This part is highly personal and likely to be useless for anyone else except me.  Everything is taken care of via `rake bitly:install`.  Other available tasks below:

```
rake bitly:prod_src             # Check out the production repo
rake bitly:prod_vm              # Set up a full development VM mirroring our production environment.
rake bitly:proto_src            # Check out the prototypes repo
rake bitly:proto_vm             # Create a virtualenv that has the python stuff we need to run a prototype server
rake bitly:proto_vm_uninstall   # Delete the virtualenv for bitly prototypes
rake bitly:uninstall            # Uninstall everything (WARNING: BE SURE YOU DONT HAVE UNCOMMITTED CHANGES!)
```

## Inspiration
Came from various places:

- The neat setup scripts used internally by Bitly Ops (want to see them? we're hiring!)
- Paul Hammond's dothome scripts https://github.com/paulhammond/dothome

## TODO: Things we need to insure are installed but will be hard to automate

- dev tools
- growl
- textmate
