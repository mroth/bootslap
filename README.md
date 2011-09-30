# Bootstrapper
Scripts and walkthroughs to bootstrap my new Macs when I get them.  This doesn't happen all too often, but in between home, work, desktops, laptops, etc., it happens more often than I'd like!

This is a new version (IN PROGRESS!!!) designed to work with syncing updates across machines, not just a one-time setup.  The old version is in oldskool directory.

### Philosophy
Tasks should be runnable at any time, creating/repairing installations when needed, ignoring stuff if already exists.

### Installation

#### Get the files
Clone the repository into your home directory:
`git clone git@github.com:mroth/bootstrapper.git ~/.dothome`

#### bash setup
Run `rake dotfiles:install` which will symlink your .bash_profile and .bashrc to the ones in the repo (as well as any other files).  Old files will be backed up with a .old suffix.

Most of the work here happens in `bash/run`.  Note that host and OS specific files will be sourced in `bash/host/*` and `bash/os/*` if they exist, this allows you to have one master repo but still have certain things that only happen on certain OSes or machines.

#### homebrew and packages
Run `rake homebrew:install` which will install homebrew, update the package list, and install the list of packages found in `brew/*`.

These tasks are also available individually via `homebrew:brew_install`, `homebrew:brew_update`, and `homebrew:packages_install`.

*TODO: add brew:uninstall sourcing the uninstall_homebrew.sh script?*

#### rvm, ruby 1.9.2, rails 3.1, and commonly used gems
*TODO*

#### python with virutalenv setup
Use `rake python:install`. Done.

#### setup work stuff
Everything is taken care of via `rake bitly:install`.  Other available tasks below:

```
rake bitly:prod_src             # Check out the production repo
rake bitly:prod_vm              # Set up a full development VM mirroring our production environment.
rake bitly:proto_src            # Check out the prototypes repo
rake bitly:proto_vm             # Create a virtualenv that has the python stuff we need to run a prototype server
rake bitly:proto_vm_uninstall   # Delete the virtualenv for bitly prototypes
rake bitly:uninstall            # Uninstall everything (WARNING: BE SURE YOU DONT HAVE UNCOMMITTED CHANGES!)
```

### Inspiration
Came from various places:

- Paul Hammond's dothome scripts https://github.com/paulhammond/dothome

### Things we need to insure are installed but will be hard to automate

- dev tools
- growl
- textmate
