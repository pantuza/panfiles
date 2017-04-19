# Make file for install irssi as the IRC client


# defines the shell to the make application
SHELL := /bin/bash


# irssi directory
IRC_DIR := .irssi

# irssi configuration file
IRC_CFG := config

.PHONY := install


install: $(IRC_CFG)
	@echo -e "\n${BROWN}# IRC INSTALL${END_COLOR}"
	@mkdir -pv $(HOME)/$(IRC_DIR)
	@mkdir -pv $(HOME)/$(IRC_DIR)/scripts/autorun/
	install -m 0644 $(IRC_CFG) $(HOME)/$(IRC_DIR)/$(IRC_CFG)
	@echo -e "$(BROWN)**\n$(END_COLOR)"
