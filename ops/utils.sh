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

USERDEL=$(which userdel);

RM=$(which rm);
RMOPTS="-rf";

MAILFILE="/var/mail/${NAME}";
