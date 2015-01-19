#!/bin/bash


#
# Bash script to configure a CentOS server
#

# User name
USERNAME=pantuza

# User email
USER_EMAIL="gustavopantuza@gmail.com"


# First system update
yum update

# Add extra package repository (EPEL)
yum install epel-release

# Adding rpmforge repository
PKG="rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm"
wget "http://pkgs.repoforge.org/rpmforge-release/$PKG"
rpm -Uvh $PKG
rm -f $PKG

# Configure user Home directory
cd /home/$USERNAME
mkdir -pv dev ops bkp

# Configure sshd
vim /etc/ssh/sshd_config

# Configures environment
cd /home/$USERNAME/dev/panfiles
make -C third-party PKGMGR=yum osmgr
make server

# Install and Configure mail server
yum install postfix maix
vim /etc/postfix/main.cf
systemctl restart postfix.service

# Configure system to send email on login
install login.sh /etc/profile.d/
