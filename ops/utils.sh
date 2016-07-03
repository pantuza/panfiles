#!/bin/bash


NAME="pantuza";
USER_MAIL="gustavopantuza@gmail.com";

USERADD=$(which useradd);


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

USERDEL=$(which userdel);

RM=$(which rm);
RMOPTS="-rf";

MAILFILE="/var/mail/${NAME}";

PKGMGR=$(which zypper);
PKGMGROPTS="--non-interactive";

GIT=$(which git);

SSH_KEY_GEN=$(which ssh-keygen);

CAT=$(which cat);

MAKE=$(which make);

SED=$(which sed);
SEDOPTS="-i";

SUDO=$(which sudo);
SUDOOPTS="-u root";

CP=$(which cp);
MV=$(which mv);

TEE=$(which tee);
TEEOPTS="-a";

SYSTEMCTL=$(which systemctl);

INSTALL=$(which install);
INSTALL_OPTS="-m 644 -v"

# Directories

HOMEDIR="/home/${NAME}";

HOME_DEV="${HOMEDIR}/dev";
HOME_OPS="${HOMEDIR}/ops";
HOME_BKP="${HOMEDIR}/bkp";
HOME_TMP="${HOMEDIR}/tmp";

HOME_SSH_DIR="${HOMEDIR}/.ssh";


BASE_DIRS="${HOME_DEV} ${HOME_OPS} ${HOME_BKP} ${HOME_TMP}";

PANFILES_DIR="${HOME_DEV}/panfiles";

THIRDPARTY_DIR="${PANFILES_DIR}/third-party"

# Projects
GITHUB_SSH="git@github.com";
PANFILES_REPO="${GITHUB_SSH}:${NAME}/panfiles.git";

# Files

PUB_KEY_FILE="id_rsa.pub";

GIT_CONFIG_FILE="${HOMEDIR}/.gitconfig";

SSHD_CONFIG_FILE="/etc/ssh/sshd_config";

POSTFIX_CFG_FILE="/etc/postfix/main.cf"


# Services
SSHD="sshd.service";

POSTFIXD="postfix.service"
