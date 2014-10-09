# A Guide to Customizing Bootslap
Bootslap is intended to be modified to suit your needs, here are some helpful
pointers.

![hammertime](http://media.giphy.com/media/12bVDtXPOzYwda/giphy.gif)

## Where to make changes
Things are designed to be fairly easy to read and understand, so you might want
to just delve into the source.  That said, there are a few things I can point
out that might help you get started.


### Playbooks
Currently the playbooks are spread across three files by category.

#### Installation (`install.yml`)
This is where you'll want to adjust what programs get installed.  In between
Homebrew and Homebrew Cask you should be able to specify pretty much whatever
you want!

For complex environment setups (e.g. programming languages and toolsets), this
playbook will often call subtasks from the `tasks/` directory.

#### Shell setup (`shell.yml`)

TODO

#### Configuration (`config.yml`)
These playbooks handle system and user level configuration.  For the most part
they are generic and applicable to a wide variety of users -- I leave user
preference stuff to my [dotfiles][dotfiles].

The script will look in `./files/avatars/${USERNAME}.jpg` for a file for your
user account photo.  If it doesnt find it, it will just skip the related tasks.

[dotfiles]: https://github.com/mroth/dotfiles

### Bootstrap script
This does very little and you probably shouldn't have to mess with it.  That
said, it does make some assumptions about where you are going to store your
repository (on GitHub, with a username that matches your local environment), so
if that isn't the case and you intend to use the script then you'll want to
change the URL.


### Loading scripts
While these playbooks will install stuff, the actual initialization of shell
functions is left up to the dotfiles.  These scripts assume you are using
something to manage your dotfiles and thus won't automatically insert a but of
autoloading stuff. Instead, they simply source your dotfiles.

For ideas on how I manage this, you probably want to check out `.zshrc` in my
[dotfiles repo][https://github.com/mroth/dotfiles].

## Philosophy

*Assume people will be forking the project and developing their own.*  Don't
overcomplicate with configuration variables and logic, try to keep things as
close to a readable script as possible, so people may intelligently modify on
their own. (I avoided Ansible "roles" for this reason, I feel they increase
project complexity due the amount of different files a person has to read.)

*Try to avoid setting a value that is already set.* Sure, for some things it's
easy and harmless to just set a value on every run-through.  But we want to know
*when* and *what* we changed on every playbook run.  Sometimes this may mean
writing 2-3x the lines of code, but I feel this is worth it.

*Try to avoid sudo* unless when absolutely, 100% necessary.

## Forks
**A simple request: if you end up using this as a template develop your own
bootstrapping requests, please send a pull request adding your name and a link
to your version below.  That way, we can all learn from eachother!**

   * [Your name here](#)
