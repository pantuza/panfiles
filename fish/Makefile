# Make file for install fish shell

# defines the shell to the make application
SHELL := /bin/bash

CHSH := $(shell which chsh)

FISH_PATH = $(shell which fish)

.PHONY := install


install: config.fish
	@echo -e "\n${BROWN}# FISH SHELL INSTALL${END_COLOR}"
	@make -C ../third-party/ osshell
	@mkdir -vp ${HOME}/.config/fish
	@install -m 0644 config.fish ${HOME}/.config/fish/
	@make -C ../third-party/ python
	@${CHSH} -s $(call FISH_PATH) ${USER}
	@install functions/*.fish ~/.config/fish/functions/
	@echo -e "\n${BROWN}# OH MY FISH INSTALL${END_COLOR}"
	@curl -4 -L https://get.oh-my.fish | fish || true
	@fish --command "omf install fishbone"
	@fish --command "omf install battery"
	@fish --command "omf install await"
	@fish --command "omf install weather"
	@fish --command "omf install grc"
ifeq ($(shell uname -s),Darwin)
	$(call FISH_PATH) --command "set --universal grcplugin_ls -ilhaG"
else
	$(call FISH_PATH) --command "set --universal grcplugin_ls -ilha --color"
endif
	@echo -e "$(BROWN)**\n$(END_COLOR)"
