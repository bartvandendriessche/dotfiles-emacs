My Emacs dotfiles
=================

This is my current Emacs configuration

# Getting started
Simply ```git clone
https://github.com/bartvandendriessche/dotfiles-emacs .emacs.d``` and
start emacs.

This config uses el-get and bootstraps itself by first
downloading and installing el-get, and then downloading and installing
any required packages.

## Troubleshooting
If you start emacs a second or third time, and el-get is having
trouble loading starter-kit-defuns or some other file, be sure to nuke
~/.emacs.d/.loaddefs.*

El-get messes up loaddefs generation sometimes but deleting them once
should be the proverbial bash on the hood to set things straight.

# Terminal
I run Emacs in iTerm2, using the solarized theme as an xterm-256color
terminal.

I have ```emacs``` aliased to ```emacsclient -t``` which will connect
to an existing Emacs server instance, or start one and connect to it
if no Emacs processes are running.
