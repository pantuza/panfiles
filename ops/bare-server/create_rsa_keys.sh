#!/bin/bash


. ./utils.sh


# Creates ssh hidden directory
${MKDIR} ${MKDIROPTS} ${HOME_SSH_DIR};

pushd ${HOME_SSH_DIR};

if [ -f "${PUB_KEY_FILE}" ]; then

    ${CAT} "${HOME_SSH_DIR}/${PUB_KEY_FILE}";
    ${ECHO} ${ECHOOPTS} "\nCopy the above public key and paste on github " \
                        "settings.\nIf you already did that, press any key " \
                        "to continue..";
    read;
else
    # Creates the rsa key
    ${SSH_KEY_GEN} -t rsa -b 4096 -C "${USER_MAIL}";
    ${CAT} "${HOME_SSH_DIR}/${PUB_KEY_FILE}";
    ${ECHO} ${ECHOOPTS} "\nCopy the above public key and paste on github" \
                        "settings. \nAfter that, press any key to continue..";
    read;
fi;
popd;

