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

# Delete AuthMaxTries line and insert our
${SUDO} ${SUDOOPTS} ${SED} ${SEDOPTS} "/MaxAuthTries/d" ${SSHD_CONFIG_FILE};
${ECHO} ${ECHOOPTS} "MaxAuthTries 10\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${SSHD_CONFIG_FILE};

# Delete PermitRootLogin line and insert our
${SUDO} ${SUDOOPTS} ${SED} ${SEDOPTS} "/PermitRootLogin/d" ${SSHD_CONFIG_FILE};
${ECHO} ${ECHOOPTS} "PermitRootLogin no\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${SSHD_CONFIG_FILE};

# Delete Protocol line and insert our
${SUDO} ${SUDOOPTS} ${SED} ${SEDOPTS} "/Protocol/d" ${SSHD_CONFIG_FILE};
${ECHO} ${ECHOOPTS} "Protocol 2\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${SSHD_CONFIG_FILE};

${ECHO} ${ECHOOPTS} "${SSHD_CONFIG_FILE} configured\n";
