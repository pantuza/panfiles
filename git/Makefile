# Make file for install git parts

# defines the shell to the make application
SHELL := /bin/bash

# git configuration file
GIT_CFG := .gitconfig

.PHONY := install


install: gitconfig
	@echo -e "\n${BROWN}# GIT INSTALL${END_COLOR}"
	@echo -e "${BLUE}placing gitconfig file at '$(USER_HOME)/$(GIT_CFG)'${END_COLOR}"
	install gitconfig $(USER_HOME)/$(GIT_CFG) -m 0644
	@echo -e "$(BROWN)**\n$(END_COLOR)"
