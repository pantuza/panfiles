#!/bin/bash
#
# bash profile for python development
#
# Author: Gustavo Pantuza
# Since: 26.08.2012

limbo=/dev/null

command -v pip > $limbo

# Verify pip instalation
if [ "$?" == "1" ]; then
    echo "pip not found, install it!";
    sudo zypper install python-pip;
fi;

# install python development dependencies/tools
echo -e "\nInstalling python development tools...\n";
sudo pip install -r requirements.txt;

