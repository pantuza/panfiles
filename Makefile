# Make file with rules to automatic install the environment


# defines the shell to the make application
SHELL := /bin/bash


# get the user name
USER_NAME := $(shell whoami)


# get the user home directory
USER_HOME := $(shell echo ${HOME})


# Directories
BASH_DIR := bash
GIT_DIR := git
VIM_DIR := vim
SSH_DIR := ssh
MYSQL_DIR := mysql
NGINX_DIR := nginx
UWSGI_DIR := uwsgi
MUTT_DIR := mutt
FISH_DIR := fish
THIRD_PARTY := third-party


# Colors to messages during execution
BROWN=\e[0;33m
BLUE=\e[1;34m
END_COLOR=\e[0m
RUBY_DIR := ruby


.PHONY: install server nginx uwsgi


# make variables public to other make files
export USER_NAME USER_HOME BROWN BLUE END_COLOR



############# ### ## #
# TARGETS

install: greetings shell versioning editor mail sshconfig mysqldb uwsgi bye


greetings: clear
	@echo -e "\n\n${BROWN}-- PANFILES --"
	@echo -e "Setting up the development environment$(END_COLOR)\n"


clear:
	clear


bye:
	@echo -e "\n$(BROWN)open your mind, happy coding :D$(END_COLOR)\n"


shell: ${BASH_DIR}/Makefile
	make install -C ${BASH_DIR}


fish: ${FISH_DIR}/Makefile
	make install -C ${FISH_DIR}


versioning: ${GIT_DIR}/Makefile
	make install -C ${GIT_DIR}


editor:	${VIM_DIR}/Makefile
	make install -C ${VIM_DIR}


sshconfig: ${SSH_DIR}/Makefile
	make install -C ${SSH_DIR}


mysqldb: ${MYSQL_DIR}/Makefile
	make install -C ${MYSQL_DIR}


uwsgi: ${UWSGI_DIR}/Makefile
	make install -C ${UWSGI_DIR}


nginx: ${NGINX_DIR}/Makefile
	make install -C ${NGINX_DIR}


mail: ${MUTT_DIR}/muttrc
	make install -C ${MUTT_DIR}


deps: $(THIRD_PARTY)/Makefile
	make install -C ${THIRD_PARTY}

dev:
	make install -C ${RUBY_DIR}


# Install and configure a desktop machine
desktop: greetings fish versioning editor deps bye


# Install and configure a server machine
server: greetings shell versioning editor bye


# Install basic services on a machine
services: greetings mysqldb nginx uwsgi bye
