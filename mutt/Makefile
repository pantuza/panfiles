# Make file for install and configure mutt mail tool


# defines the shell to the make application
SHELL := /bin/bash


.PHONY := install


install: muttrc signature
	@echo -e "\n${BROWN}# MUTT INSTALL${END_COLOR}"
	@echo -e "${BLUE}placing $< file at '$(USER_HOME)/.$<'${END_COLOR}"
	install $< $(USER_HOME)/.$<
	@echo -e "${BLUE}Creating mutt directories and files${END_COLOR}"
	@mkdir -pv $(USER_HOME)/.mutt/cache
	touch $(USER_HOME)/.mutt/cache/{headers,bodies}
	touch $(USER_HOME)/.mutt/certificates
	install $(word 2, $^) $(USER_HOME)/.mutt/$(word 2, $^)
	@echo -e "$(BROWN)**\n$(END_COLOR)"
