# Make file for install mysql parts

# defines the shell to the make application
SHELL := /bin/bash

# mysql configuration file
MY_CFG := my.cnf

.PHONY := install


install: ${MY_CFG}
	@echo -e "\n${BROWN}# MYSQL CONFIGURATION INSTALL${END_COLOR}"
	@echo -e "${BLUE}placing ${MY_CFG} file at '$(USER_HOME)/.${MY_CFG}'${END_COLOR}"
	install ${MY_CFG} ${USER_HOME}/.${MY_CFG} -m 0600
	@echo -e "$(BROWN)**\n$(END_COLOR)"
