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
TMUX_DIR := tmux
I3WM_DIR := i3wm
MPLAYER_DIR := mplayer
THIRD_PARTY := third-party
PYTHON_DIR := python
RUBY_DIR := ruby

# Control colors by OS type
COLOR_PREFIX := e
ifeq ($(shell uname -s),Darwin)
	COLOR_PREFIX := 033
endif

# Colors to messages during execution
BROWN=\$(COLOR_PREFIX)[0;33m
BLUE=\$(COLOR_PREFIX)[1;34m
END_COLOR=\$(COLOR_PREFIX)[0m


.PHONY: install server nginx uwsgi fish python


# make variables public to other make files
export USER_NAME USER_HOME BROWN BLUE END_COLOR



############# ### ## #
# TARGETS
help:
	@echo
	@echo "Panfiles available target rules"
	@echo
	@echo " desktop                 Installs all dependencies for a desktop machine"
	@echo " server                  Installs all dependencies for a server machine"
	@echo " tiled                   Install packages for a tiled desktop using i3wm"
	@echo " services                Install third part services on any machine"
	@echo
	@echo "CI target rules"
	@echo
	@echo " build_img               Builds locally a docker image for test installation"
	@echo " test_server             Tests fully installing a server machine"
	@echo " test_tilled             Tests fully installing a tilled system"
	@echo " test_desktop            Tests fully installing a desktop machine"
	@echo


install: greetings shell versioning editor mail sshconfig mysqldb uwsgi bye


greetings: clear
	@echo -e "\n\n${BROWN}-- PANFILES --"
	@echo -e "Setting up the development environment$(END_COLOR)\n"


clear:
	clear


bye:
	@echo -e "\n$(BROWN)open your mind, happy hacking :D$(END_COLOR)\n"


base_dirs:
	@mkdir -pv $(HOME)/dev/{playground,tmp}  # Base development directories
	@mkdir -pv $(HOME)/.local/panfiles/      # Base Panfiles directory


shell: ${BASH_DIR}/Makefile
	make install -C ${BASH_DIR}


fish: ${FISH_DIR}/Makefile
	make install -C ${FISH_DIR}


terminal: ${TMUX_DIR}/Makefile
	make install -C ${TMUX_DIR}


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

python: ${PYTHON_DIR}
	make install -C ${PYTHON_DIR}

i3: ${I3WM_DIR}/config
	make install -C ${I3WM_DIR}

videoplayer: ${MPLAYER_DIR}/config
	make install -C ${MPLAYER_DIR}


# Install and configure a desktop machine
desktop: greetings base_dirs editor fish terminal versioning sshconfig deps bye

# Install dependencies for a tiling window manager
tiled: greetings python i3 mutt videoplayer bye


# Install and configure a server machine
server: greetings shell versioning editor bye


# Install basic services on a machine
services: greetings mysqldb nginx uwsgi bye


# Builds locally a docker image for testing purpose
build_img: Dockerfile
	docker build --tag panfiles:local . --no-cache

# Tests installing a server machine
test_server:
	docker run -it --name $@ --rm panfiles:local make server

# Tests installing a tiled system
test_tiled:
	docker run -it --name $@ --rm panfiles:local make tiled


# Tests installing a tiled system
test_desktop:
	docker run -it --name $@ --rm panfiles:local make desktop
