# Make file for install fish shell

# defines the shell to the make application
SHELL := /bin/bash

CHSH := $(shell which chsh)

.PHONY := install


install: config.fish
	@echo -e "\n${BROWN}# FISH SHELL INSTALL${END_COLOR}"
	@make -C ../third-party/ osshell
	@mkdir -vp ${HOME}/.config/fish
	@install -m 0644 config.fish ${HOME}/.config/fish/
	@make -C ../third-party/ python
	@${CHSH} -s $(shell which fish) ${USER}
	@make -C ../ruby install
	@curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
	@echo "rvm default" >> ~/.config/fish/config.fish
	@install functions/*.fish ~/.config/fish/functions/
	@curl -L http://get.oh-my.fish | fish || true
	@fish --command "omf install fishbone"
	@fish --command "omf install battery"
	@fish --command "omf install await"
	@fish --command "omf install rvm"
	@fish --command "omf install weather"
	@fish --command "omf install grc"
ifeq ($(shell uname -s),Darwin)
	$(shell which fish) --command "set --universal grcplugin_ls -ilhaG"
else
	$(shell which fish) --command "set --universal grcplugin_ls -ilha --color"
endif
	@echo -e "$(BROWN)**\n$(END_COLOR)"
