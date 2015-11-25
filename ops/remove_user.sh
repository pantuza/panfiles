#!/bin/bash


. ./utils.sh

clear;


# Deleting user
${ECHO} ${ECHOOPTS} "Removing user ${NAME}\t";
${USERDEL} ${NAME};
${ECHO} ${ECHOOPTS} "OK\n";



# Removing user home directory
[ -d "${HOMEDIR}" ] && {
    ${ECHO} ${ECHOOPTS} "Removing home directory: ${HOMEDIR}\t";
    ${RM} ${RMOPTS} ${HOMEDIR};
    ${ECHO} ${ECHOOPTS} "OK\n";
}


# Removing user mail file
[ -f "${MAILFILE}" ] && {
    ${ECHO} ${ECHOOPTS} "Removing mail file\t";
    ${RM} ${RMOPTS} ${MAILFILE};
    ${ECHO} ${ECHOOPTS} "OK\n";
}
