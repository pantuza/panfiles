# Make file for install irssi as the IRC client


# defines the shell to the make application
SHELL := /bin/bash


# irssi directory
IRC_DIR := $(HOME)/.irssi

# irssi configuration file
IRC_CFG := config

# Remote repository URL
SCRIPTS_REPO := http://scripts.irssi.org/scripts
.PHONY := install


install: $(IRC_CFG)
	@echo -e "\n${BROWN}# IRC INSTALL${END_COLOR}"
	@mkdir -pv $(IRC_DIR)
	install -m 0644 $(IRC_CFG) $(IRC_DIR)/$(IRC_CFG)
	@mkdir -pv $(IRC_DIR)/scripts/autorun/
	wget $(SCRIPTS_REPO)/trackbar.pl -P $(IRC_DIR)/scripts/autorun/
	wget $(SCRIPTS_REPO)/nickcolor.pl -P $(IRC_DIR)/scripts/autorun/
	wget $(SCRIPTS_REPO)/screen_away.pl -P $(IRC_DIR)/scripts/autorun/
	wget $(SCRIPTS_REPO)/highlite.pl -P $(IRC_DIR)/scripts/autorun/
	@echo -e "$(BROWN)**\n$(END_COLOR)"
