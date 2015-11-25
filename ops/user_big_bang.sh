#!/bin/bash


. ./utils.sh


# Ask for git installation
[ -z "${GIT}" ] && {
    ${ECHO} ${ECHOOPTS} "install git before as root:\n";
    ${ECHO} ${ECHOOPTS} "${PKGMGR} install ${PKGMGROPTS} git\n";
    exit 1;
}


# Creates the base directories for the user
for DIR in ${BASE_DIRS};
do
    ${MKDIR} ${MKDIROPTS} ${DIR};
done;


# Github pub key script
. ./create_rsa_keys.sh


# Clones the panfiles project
pushd ${HOME_DEV};
${GIT} clone ${PANFILES_REPO};
popd;
