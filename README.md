Replacement bootstrapper designed to work with syncing updates across machines, not just one-time setup.

Old version is in oldskool directory.

### Install
Clone the repository into your home directory:
`git clone git@github.com:mroth/bootstrapper.git ~/.dothome`

Run `rake dotfiles:install` which will symlink your .bash_profile and .bashrc to the ones in the repo (as well as any other files).  TODO: Old files will be backed up with a .old suffix.

### Sources
- Paul Hammond's scripts https://github.com/paulhammond/dothome

### Things we need to insure are installed but will be hard to automate

- dev tools
- growl
- textmate
