# Usage
Install GNU Stow first to easily manage the symlinks. Directory structure is made for Stow
Then use the makefile provided:
```shell
$ make run t=$target
```
t being one of the directories you want to build the dir structure for:
```shell
$ make run t=zellij
```
and the symlinks will be created.

There's also a `dry-run` and `dry-all` for testing.

Also to use the Brewfile provided, don't forget to:
```shell
$ brew bundle
```
