#!/bin/bash

#
# Script to configure a git remote server
#


# Creates the git user
sudo useradd -c "Git user" -d /home/git -G users -s $(which git-shell) git

# Creates home directory for git user
sudo mkdir -p /home/git

# Give directory permissions to git user
sudo chown -R git:users /home/git

# Set git user password
sudo passwd git

# Add git user to AllowUsers in sshd_config
sudo sed -i '/AllowUsers/ s/$/ git/' /etc/ssh/sshd_config

# Creates ssh directory for user git
sudo mkdir -p /home/git/.ssh/

# Give git user permissions on directory
sudo chown -R git:users /home/git/.ssh

# Change directory permissions
sudo chmod 700 /home/git/.ssh

# Creates the authorized_keys file
sudo touch /home/git/.ssh/authorized_keys

# Give git user permissions on file
sudo chown -R git:users /home/git/.ssh/authorized_keys

# Change permission of the authorized_keys file
sudo chmod 600 /home/git/.ssh/authorized_keys

echo "Server configured"
echo
echo "Start creating empty repositories with 'git init --bare'"
echo "inside git home directory. Set your remote git server at"
echo "client machine using the ssh protocol format:"
echo "       git@domain-name.com:/home/git/repo-name.git"
echo
echo "Push things to it and happy hacking :)"
