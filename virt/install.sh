#!/bin/bash


#
# Bash script to install virtualization using kvm
#


OPENSUSE_URL="http://download.opensuse.org/repositories"
PATH_URL="Cloud:/OpenStack:/Master/openSUSE_13.2"
OPEN_STACK=$OPENSUSE_URL/$PATH_URL/"Cloud:OpenStack:Master.repo"

sudo zypper addrepo --refresh $OPEN_STACK  
sudo zypper install openvswitch-switch
sudo systemctl start openvswitch.service

echo -e "\n# STATS"
echo -e "\n### Service status"
sudo systemctl status openvswitch.service
echo -e "\n### Installed modules"
sudo lsmod | grep openvswitch
echo -e "\n### OpenvSwitch version"
sudo ovs-vsctl show
