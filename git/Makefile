# Make file for install git parts

# defines the shell to the make application
SHELL := /bin/bash

# git configuration file
GIT_CFG := .gitconfig

.PHONY := install


install: gitconfig
	@echo -e "\n${BROWN}# GIT INSTALL${END_COLOR}"
	@echo -e "${BLUE}placing gitconfig file at '$(HOME)/$(GIT_CFG)'${END_COLOR}"
	install -m 0644 gitconfig $(HOME)/$(GIT_CFG)
	@echo -e "$(BROWN)**\n$(END_COLOR)"
