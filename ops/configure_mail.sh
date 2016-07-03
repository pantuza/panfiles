#!/bin/bash

. ./utils.sh


#
# This script install and configure mail server
#
${MAKE} -C ${THIRDPARTY_DIR} email

# TODO: Configure postfix

# Restart postfix service and print its status
${SUDO} ${SYSTEMCTL} restart ${POSTFIXD}
${SUDO} ${SYSTEMCTL} status ${POSTFIXD}
