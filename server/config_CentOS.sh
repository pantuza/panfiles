#!/bin/bash


#
# Bash script to configure a CentOS server
#

# User name
USERNAME=pantuza


# First system update
yum update

# Add extra package repository
yum install epel-release

# Configure user Home directory
cd /home/$USERNAME
mkdir -pv dev ops bkp

# Configure sshd
vim /etc/ssh/sshd_config
