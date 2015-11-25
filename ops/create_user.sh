#!/bin/bash

NAME="gustavo";

USERADD=$(which useradd);

HOMEDIR="/home/${NAME}";

USERSHELL=$(which bash);

COMMENT="Gustavo Pantuza";

USERGROUPS="users";

ECHO=$(which echo);
ECHOOPTS="-en";

MKDIR=$(which mkdir);
MKDIROPTS="-p";

CHOWN=$(which chown);
CHOWNOPTS="${NAME}:${USERGROUPS}";

PASSWD=$(which passwd);


clear;


# Creates the user
${ECHO} ${ECHOOPTS} "Creating user ${NAME}\t";
${USERADD} -d ${HOMEDIR} \
           -s ${USERSHELL} \
           -c "'${COMMENT}'" \
           -G "${USERGROUPS}" \
           "${NAME}"
${ECHO} ${ECHOOPTS} "OK\n";


# Creating home directory
${ECHO} ${ECHOOPTS} "Creating ${NAME} home directory: ${HOMEDIR}\t";
${MKDIR} ${MKDIROPTS} ${HOMEDIR};
${ECHO} ${ECHOOPTS} "OK\n";


# Changing home directory ownership
${ECHO} ${ECHOOPTS} "Changing home directory ownership to ${NAME}\t";
${CHOWN} ${CHOWNOPTS} ${HOMEDIR};
${ECHO} ${ECHOOPTS} "OK\n";


# Setting password for user
${ECHO} ${ECHOOPTS} "Setting password for user ${NAME}\n";
${PASSWD} ${NAME};
${ECHO} ${ECHOOPTS} "OK\n";

