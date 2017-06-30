#!/bin/bash


. ./utils.sh


# Ask for git installation
[ -z "${GIT}" ] && {
    ${ECHO} ${ECHOOPTS} "install git before:\n";
    ${PKGMGR} install ${PKGMGROPTS} git;
}


# Creates the base directories for the user
for DIR in ${BASE_DIRS};
do
    ${MKDIR} ${MKDIROPTS} ${DIR};
done;


# Github pub key script
. ./create_rsa_keys.sh


# Clones the panfiles project
if [ ! -d "${PANFILES_DIR}" ]; then

    pushd ${HOME_DEV};
    ${GIT} clone ${PANFILES_REPO};
    popd;
fi;


# Update the repository
pushd ${PANFILES_DIR};
${GIT} pull origin master;


# install bashrc
[ -z "${MAKE}" ] && {
    ${ECHO} ${ECHOOPTS} "install make before:\n";
    ${PKGMGR} install ${PKGMGROPTS} make;
}

${MAKE} server;
popd;



# Change gitconfig variables
. ./configure_git.sh



# Configure sshd
. ./configure_sshd.sh



# Configure mail server
. ./configure_mail.sh
