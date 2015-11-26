#!/bin/bash

. ./utils.sh


# configure gitconfig file
${ECHO} ${ECHOOPTS} "Enter gitconfig Name value:\n";
read config_name;
${SED} ${SEDOPTS} "s/{NAME}/${config_name}/g" ${GIT_CONFIG_FILE};


${ECHO} ${ECHOOPTS} "Enter gitconfig Email value:\n";
read config_email;
${SED} ${SEDOPTS} "s/{EMAIL}/${config_email}/g" ${GIT_CONFIG_FILE};


${ECHO} ${ECHOOPTS} "${GIT_CONFIG_FILE} configured\n";
