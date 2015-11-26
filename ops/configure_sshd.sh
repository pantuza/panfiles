#!/bin/bash

. ./utils.sh


#
# First of all, we make a copy of the sshd_config file. Linux does not allow
# to append values to this file. For that, we modify the copied file and then
# move the copy onto the original.
#
SSHD_COPY="/tmp/sshd_config";
${SUDO} ${SUDOOPTS} ${CP} ${SSHD_CONFIG_FILE} ${SSHD_COPY};


# configure sshd file
${ECHO} ${ECHOOPTS} "Appending my configuration:\n";
${SUDO} ${SUDOOPTS} ${ECHO} ${ECHOOPTS} "\n# MY PERSONAL CONFIGURATION" >> \
    ${SSHD_COPY};

# Adding Allowed users
${SUDO} ${SUDOOPTS} ${ECHO} ${ECHOOPTS} "AllowUsers ${NAME}" >> ${SSHD_COPY};

# Delete AuthMaxTries line and insert our
${SUDO} ${SUDOOPTS} ${SED} ${SEDOPTS} "/MaxAuthTries/d" ${SSHD_COPY};
${SUDO} ${SUDOOPTS} ${ECHO} ${ECHOOPTS} "MaxAuthTries 10" >> ${SSHD_COPY};

# Delete PermitRootLogin line and insert our
${SUDO} ${SUDOOPTS} ${SED} ${SEDOPTS} "/PermitRootLogin/d" ${SSHD_COPY};
${SUDO} ${SUDOOPTS} ${ECHO} ${ECHOOPTS} "PermitRootLogin no" >> ${SSHD_COPY};

# Delete Protocol line and insert our
${SUDO} ${SUDOOPTS} ${SED} ${SEDOPTS} "/Protocol/d" ${SSHD_COPY};
${SUDO} ${SUDOOPTS} ${ECHO} ${ECHOOPTS} "Protocol 2" >> ${SSHD_COPY};


# After all modifications we move our copy to original file
${SUDO} ${SUDOOPTS} ${MV} ${SSHD_COPY} ${SSHD_CONFIG_FILE};


${ECHO} ${ECHOOPTS} "${SSHD_CONFIG_FILE} configured\n";
