# Make file for install fish shell

# defines the shell to the make application
SHELL := /bin/bash

.PHONY := install


install: config.fish
	@echo -e "\n${BROWN}# FISH SHELL INSTALL${END_COLOR}"
	@make -C ../third-party/ osshell
	@mkdir -vp ${HOME}/.config/fish
	@install config.fish ${HOME}/.config/fish/ -m 0644
	@make -C ../third-party/ python
	@sudo pip install virtualfish
	@chsh --shell $(shell which fish)
	@curl -L http://get.oh-my.fish | fish
	@echo -e "$(BROWN)**\n$(END_COLOR)"
