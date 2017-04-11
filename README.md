Panfiles
=======

### Name

> ###### Panfiles

### Description

This project is basically my 'dotfiles'. The difference from others, I guess, is that it is entirely ruled by makefiles and shell scripts. So, when I install a new Linux machine it is just necessary to run ```make install``` and all of my environment is ready, configured, up and running. When the machine is a server I run ```make server```. It is all about automation!

### What is included?

The project has scripts to install and configure the following tools/services:

- bash -------- bashrc, alias and bash helpers 
- cuda -------- Makefile to install cuda development environment
- git ----------- Installation and gitconfig template 
- irc ----------- Install configuration files for irssi irc client
- js ------------ Javascript packages dependencies
- make ------- Generic Makefile for C development 
- mutt -------- Mutt mail client configuration files and signature
- mysql ------- Installation and my.cnf configuration file
- nginx -------- Installation, generic nginx.conf and test.conf 
- ops ---------- Scripts to configure a server creating a user and installing git, mail server, rsa keys and sshd
- postgresql -- Script to copy a table to csv file
- python ------ Script to install generic development python tools
- server ------- Script to install CentOS server
- ssh ---------- Installs a template of ssh config file
- storage ----- Installs the Dropbox client
- third-party -- Lots of third part softwares to install separated by type (Ex: dev, os, net, virt)
- uwsgi ------- Template files for uWSGI and installation script
- vim ---------- Vim configuration files like vimrc, colors plugins and Makefile for installation
- virt ---------- Scripts to install docker, OpenVSwitch and bridge configuration
- fish ---------- Installs fish shell and Oh my fish script manager
- i3wm ---------- Configures i3 window manager

Almost all directories has its Makefile to control installation and configuration.


### Author

> ###### Written by Gustavo Pantuza

### Reporting Bugs

> ###### Report Panfiles bugs to gustavopantuza@gmail.com
