#!/bin/bash

. ./utils.sh


#
# This script install and configure mail server
#
${MAKE} -C ${THIRDPARTY_DIR} email

# configure postfix service
${ECHO} ${ECHOOPTS} "Appending my configuration:\n";
${ECHO} ${ECHOOPTS} "\n# MY PERSONAL CONFIGURATION\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${POSTFIX_CFG_FILE};

${ECHO} ${ECHOOPTS} "myhostname = bare\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${POSTFIX_CFG_FILE};

${ECHO} ${ECHOOPTS} "mydomain = pantuza.com\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${POSTFIX_CFG_FILE};

${ECHO} ${ECHOOPTS} "inet_interfaces = localhost\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${POSTFIX_CFG_FILE};

${ECHO} ${ECHOOPTS} "inet_protocols = all\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${POSTFIX_CFG_FILE};

${ECHO} ${ECHOOPTS} "mydestination = \$myhostname, localhost.\$mydomain, " \
    "localhost\n" | ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${POSTFIX_CFG_FILE};

${ECHO} ${ECHOOPTS} "mynetworks = 127.0.0.0/8\n" | \
    ${SUDO} ${SUDOOPTS} ${TEE} ${TEEOPTS} ${POSTFIX_CFG_FILE};

${ECHO} ${ECHOOPTS} "\n${POSTFIX_CFG_FILE} configured\n";

# Restart postfix service and print its status
${SUDO} ${SYSTEMCTL} restart ${POSTFIXD}
${SUDO} ${SYSTEMCTL} status ${POSTFIXD}

# Places the login.sh at /etc/profile.d/
${ECHO} ${ECHOOPTS} "Placing login.sh at ${PROFILES_DIR}\n";
${SUDO} ${SUDOOPTS} ${INSTALL} login.sh ${PROFILES_DIR} ${INSTALL_OPTS}
