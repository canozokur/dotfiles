# Usage
Install GNU Stow first to easily manage the symlinks. Directory structure is made for Stow
```shell
$ brew install stow
```
Then use stow to install configuration for whichever software you need.
```shell
$ stow mac-bash
```
and the symlinks will be created.

Also to use the Brewfile provided, don't forget to:
```shell
$ brew bundle
```
