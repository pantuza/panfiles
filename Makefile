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

# Package Manager binary based on operating system
ifeq ($(shell uname -s),Darwin)
PKGMGR := brew
else
PKGMGR := $(shell which zypper || which yum)
endif

.PHONY: install server nginx uwsgi fish python


# make variables public to other make files
export USER_NAME USER_HOME BROWN BLUE END_COLOR



############# ### ## #
# TARGETS
help: greetings
	@echo
	@echo "Panfiles available target rules"
	@echo
	@echo -e " $(BLUE)desktop$(END_COLOR)                 Installs all dependencies for a desktop machine"
	@echo -e " $(BLUE)server$(END_COLOR)                  Installs all dependencies for a server machine"
	@echo -e " $(BLUE)tiled$(END_COLOR)                   Install packages for a tiled desktop using i3wm"
	@echo -e " $(BLUE)services$(END_COLOR)                Install third part services on any machine"
	@echo -e " $(BLUE)darwin$(END_COLOR)                  Install and configures a Mac OS X"
	@echo
	@echo "CI target rules"
	@echo
	@echo -e " $(BLUE)build_img$(END_COLOR)               Builds locally a docker image for test installation"
	@echo -e " $(BLUE)test_server$(END_COLOR)             Tests fully installing a server machine"
	@echo -e " $(BLUE)test_tilled$(END_COLOR)             Tests fully installing a tilled system"
	@echo -e " $(BLUE)test_desktop$(END_COLOR)            Tests fully installing a desktop machine"
	@echo


install: greetings shell versioning editor mail sshconfig mysqldb uwsgi bye


greetings: clear
	@echo -e "${BROWN} \
██████   █████  ███    ██ ███████ ██ ██      ███████ ███████ \n \
██   ██ ██   ██ ████   ██ ██      ██ ██      ██      ██      \n \
██████  ███████ ██ ██  ██ █████   ██ ██      █████   ███████ \n \
██      ██   ██ ██  ██ ██ ██      ██ ██      ██           ██ \n \
██      ██   ██ ██   ████ ██      ██ ███████ ███████ ███████ \n \
                                                             \n \
Setting up personal environments$(END_COLOR)"

clear:
	clear


bye:
	@echo -e "\n$(BROWN)open your mind, happy hacking :D$(END_COLOR)\n"


base_dirs:
	@mkdir -pv $(HOME)/dev/{playground,tmp}  # Base development directories
	@mkdir -pv $(HOME)/.config/panfiles/      # Base Panfiles directory


shell: ${BASH_DIR}/Makefile
	make install -C ${BASH_DIR}

enable_repos:
	$(info Enable community repositories on the target OS)
ifeq ($(USER_NAME),ec2-user)
	sudo amazon-linux-extras install epel -y
endif

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
server: greetings enable_repos shell versioning editor bye


# Install basic services on a machine
services: greetings mysqldb nginx uwsgi bye


brew:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh > $@-tmp.sh
	chmod +x $@-tmp.sh 
	./$@-tmp.sh
	rm $@-tmp.sh


# Install and configure a Mac OS X
.PHONY: darwin
darwin: greetings brew base_dirs versioning sshconfig fish terminal editor
	brew install $(shell cat $(THIRD_PARTY)/brew)
	brew install --cask $(shell cat $(THIRD_PARTY)/cask)
	$(MAKE) bye
	# Download and install docker dmg from https://desktop.docker.com/mac/main/amd64/Docker.dmg


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
