# Library programs
From Ansible documentation:

> If a playbook has a `./library` directory relative to its YAML file, this
> directory can be used to add ansible modules that will automatically be in the
> ansible module path. This is a great way to keep modules that go with a
> playbook together.



## osx_defaults

Manually vendoring osx_defaults module from @hnakamur, in PR for ansible core
but not accepted yet:

https://github.com/hnakamur/ansible-role-osx-defaults/blob/master/library/osx_defaults
https://github.com/ansible/ansible/pull/8727

Note I have made some of my own changes here, see this PR until resolved:

https://github.com/hnakamur/ansible/pull/1
