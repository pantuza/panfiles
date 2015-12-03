#!/bin/bash

. ./utils.sh


#
# First of all, we make a copy of the sshd_config file. Linux does not allow
# to append values to this file. For that, we modify the copied file and then
# move the copy onto the original.
#


# configure sshd file
${ECHO} ${ECHOOPTS} "Appending my configuration:\n";
${ECHO} ${ECHOOPTS} "\n# MY PERSONAL CONFIGURATION\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${SSHD_CONFIG_FILE};

# Adding Allowed users
${ECHO} ${ECHOOPTS} "AllowUsers ${NAME}\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${SSHD_CONFIG_FILE};

# Delete AuthMaxTries line and insert ours
${SUDO} ${SUDOOPTS} ${SED} ${SEDOPTS} "/MaxAuthTries/d" ${SSHD_CONFIG_FILE};
${ECHO} ${ECHOOPTS} "MaxAuthTries 10\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${SSHD_CONFIG_FILE};

# Delete PermitRootLogin line and insert ours
${SUDO} ${SUDOOPTS} ${SED} ${SEDOPTS} "/PermitRootLogin/d" ${SSHD_CONFIG_FILE};
${ECHO} ${ECHOOPTS} "PermitRootLogin no\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${SSHD_CONFIG_FILE};

# Delete Protocol line and insert ours
${SUDO} ${SUDOOPTS} ${SED} ${SEDOPTS} "/Protocol/d" ${SSHD_CONFIG_FILE};
${ECHO} ${ECHOOPTS} "Protocol 2\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${SSHD_CONFIG_FILE};

# Delete PasswordAuthentication line and insert ours
${SUDO} ${SUDOOPTS} ${SED} ${SEDOPTS} "/PasswordAuthentication/d" \
    ${SSHD_CONFIG_FILE};
${ECHO} ${ECHOOPTS} "PasswordAuthentication yes\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${SSHD_CONFIG_FILE};

# Delete RSAAuthentication line and insert ours
${SUDO} ${SUDOOPTS} ${SED} ${SEDOPTS} "/RSAAuthentication/d" \
    ${SSHD_CONFIG_FILE};
${ECHO} ${ECHOOPTS} "RSAAuthentication yes\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${SSHD_CONFIG_FILE};

# Delete PubkeyAuthentication line and insert ours
${SUDO} ${SUDOOPTS} ${SED} ${SEDOPTS} "/PubkeyAuthentication/d" \
    ${SSHD_CONFIG_FILE};
${ECHO} ${ECHOOPTS} "PubkeyAuthentication yes\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${SSHD_CONFIG_FILE};

${ECHO} ${ECHOOPTS} "\n${SSHD_CONFIG_FILE} configured\n";

# Restart sshd service and print its status
${SUDO} ${SYSTEMCTL} restart ${SSHD}
${SUDO} ${SYSTEMCTL} status ${SSHD}

# Message to suggest to send to this server the ssh public key
${ECHO} ${ECHOOPTS} "\nSend to this server your ssh public key using:";
${ECHO} ${ECHOOPTS} "\nssh-copy-id -i /path/to/key.pub ${NAME}@{SERVER_IP}\n";
