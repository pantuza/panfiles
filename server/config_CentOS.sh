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

# Add extra package repository
yum install epel-release

# Configure user Home directory
cd /home/$USERNAME
mkdir -pv dev ops bkp

# Configure sshd
vim /etc/ssh/sshd_config

# Install and Configure mail server
yum install postfix maix
vim /etc/postfix/main.cf
systemctl restart postfix.service

# Configure system to send email on login
install login.sh /etc/profile.d/
