Replacement bootstrapper designed to work with syncing updates across machines, not just one-time setup.

Old version is in oldskool directory.

### Install

#### Get the files
Clone the repository into your home directory:
`git clone git@github.com:mroth/bootstrapper.git ~/.dothome`

#### bash setup
Run `rake dotfiles:install` which will symlink your .bash_profile and .bashrc to the ones in the repo (as well as any other files).  TODO: Old files will be backed up with a .old suffix.

#### homebrew and packages
Run `rake brew:all` which will install homebrew, update the package list, and install the list of packages found in `brew/*`.  These tasks are also available individually via `brew:install`, `brew:update`, and `brew:packages`.

### Sources
- Paul Hammond's scripts https://github.com/paulhammond/dothome

### Things we need to insure are installed but will be hard to automate

- dev tools
- growl
- textmate
