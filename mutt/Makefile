# Make file for install and configure mutt mail tool


# defines the shell to the make application
SHELL := /bin/bash


.PHONY := install


install: muttrc signature passwords
	@echo -e "\n${BROWN}# MUTT INSTALL${END_COLOR}"
	@echo -e "${BLUE}placing $< file at '$(HOME)/.$<'${END_COLOR}"
	install $< $(HOME)/.$<
	@echo -e "${BLUE}Creating mutt directories and files${END_COLOR}"
	@mkdir -pv $(HOME)/.mutt/cache
	touch $(HOME)/.mutt/cache/{headers,bodies}
	touch $(HOME)/.mutt/certificates
	install $(word 2, $^) $(HOME)/.mutt/$(word 2, $^)
	install $(word 3, $^) $(HOME)/.mutt/$(word 3, $^)
	@vim $(HOME)/.mutt/$(word 3, $^)
	@gpg -r gustavopantuza@gmail.com -e $(HOME)/.mutt/$(word 3, $^)
	@shred $(HOME)/.mutt/$(word 3, $^)
	@rm $(HOME)/.mutt/$(word 3, $^)
	@echo -e "$(BROWN)**\n$(END_COLOR)"
