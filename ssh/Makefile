# Make file for install ssh parts

# defines the shell to the make application
SHELL := /bin/bash

# git configuration file
SSH_CFG := config

.PHONY := install


install: config
	@echo -e "\n${BROWN}# SSH INSTALL${END_COLOR}"
	@echo -e "${BLUE}Creating ssh directory if not exist${END_COLOR}"
	mkdir -pv ${HOME}/.ssh
	@echo -e "${BLUE}placing $(SSH_CFG) file at '$(HOME)/.ssh/$(SSH_CFG)'${END_COLOR}"
	install -m 0600 $(SSH_CFG) $(HOME)/.ssh/$(SSH_CFG)
	@echo -e "$(BROWN)**\n$(END_COLOR)"
