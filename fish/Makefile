# Make file for install fish shell

# defines the shell to the make application
SHELL := /bin/bash

CHSH := $(shell which chsh)

OS_NAME := $(shell uname -s)

USER := $(shell whoami)


.PHONY := install
install: config.fish
	@echo -e "\n${BROWN}# FISH SHELL INSTALL${END_COLOR}"
ifeq ($(OS_NAME),Darwin)
	@brew install fish
	echo "$(shell which fish)" | sudo tee -a /etc/shells
	$(eval FISH_CMD = "$(shell which fish)")
	fish_add_path --append /opt/homebrew/bin
else
	@make -C ../third-party/ osshell
	@make -C ../third-party/ python
	$(eval FISH_CMD = $(shell which fish))
endif
	@mkdir -vp ${HOME}/.config/fish
	@install -m 0644 config.fish $(HOME)/.config/fish/
	@${CHSH} -s $(FISH_CMD) ${USER}
ifeq ($(OS_NAME),Darwin)
	@cp -rv functions/ $(HOME)/.config/fish/functions/
else
	@install -m 0644 functions/*.fish $(HOME)/.config/fish/functions/
endif
	@echo -e "\n${BROWN}# OH MY FISH INSTALL${END_COLOR}"
	@curl -4 -L https://get.oh-my.fish | $(FISH_CMD) || true
	@$(FISH_CMD) --command "omf install fishbone"
	@$(FISH_CMD) --command "omf install battery"
	@$(FISH_CMD) --command "omf install await"
	@$(FISH_CMD) --command "omf install weather"
	@$(FISH_CMD) --command "omf install grc"
	@$(FISH_CMD) --command "omf install fzf"
ifeq ($(OS_NAME),Darwin)
	$(FISH_CMD) --command "set --universal grcplugin_ls -ilhaG"
else
	$(FISH_CMD) --command "set --universal grcplugin_ls -ilha --color"
endif
	@echo -e "$(BROWN)**\n$(END_COLOR)"
