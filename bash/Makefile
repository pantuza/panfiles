# Make file for install bash parts

# defines the shell to the make application
SHELL := /bin/bash

# bashrc file name
BASHRC := .bashrc

# alias file name
ALIAS := .alias

# Profile script
PROFILE := profile

.PHONY := install

# Configuration directory on system
ETC_DIR := /etc


install: bashrc alias
	@echo -e "\n${BROWN}# BASH INSTALL${END_COLOR}"
	@echo -e "${BLUE}placing bashrc file at '$(USER_HOME)/$(BASHRC)'${END_COLOR}"
	install bashrc $(USER_HOME)/$(BASHRC) -m 0644
	@echo -e "${BLUE}placing alias file at '$(USER_HOME)/$(ALIAS)'${END_COLOR}"
	install alias $(USER_HOME)/$(ALIAS) -m 0644
	@echo -e "${BLUE}Appending profile file at system profile: '$(ETC_DIR)/$(PROFILE)'${END_COLOR}"
	@cat $(PROFILE) | sudo tee -a $(ETC_DIR)/$(PROFILE)
	@echo -e "$(BROWN)**\n$(END_COLOR)"
