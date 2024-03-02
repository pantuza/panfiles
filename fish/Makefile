# Make file for install fish shell

CHSH := $(shell which chsh)

ifndef PKGMGR
ifeq ($(shell test -e /usr/local/bin/fish && echo "exist"),exist)
	PKGMGR=/usr/local/bin/brew
	FISH_CMD := /usr/local/bin/fish
else
	PKGMGR=/opt/homebrew/bin/brew
	FISH_CMD := /opt/homebrew/bin/fish
endif
endif

# Current shell
CURRENT_SHELL := $(shell sudo plutil -p /var/db/dslocal/nodes/Default/users/pantuza.plist | grep -A1 shell | tail -1 | cut -d \" -f2)


.PHONY := install
install: config.fish
	@echo -e "\n${BROWN}# FISH SHELL INSTALL${END_COLOR}"
	@if [ ! -x $(FISH_CMD) ]; then \
		echo "$(FISH_CMD)" | sudo tee -a /etc/shells; \
	fi;
ifeq ($(OS_NAME),Darwin)
	$(PKGMGR) install fish
	$(FISH_CMD) --command "fish_add_path --append /opt/homebrew/bin" || true
ifneq ($(CURRENT_SHELL),$(FISH_CMD))
	@${CHSH} -s $(FISH_CMD) ${USER_NAME}
endif
else
	@make -C ../third-party/ osshell
	@make -C ../third-party/ python
	$(eval FISH_CMD = $(shell which fish))
	@${CHSH} -s $(FISH_CMD) ${USER_NAME}
endif
	@mkdir -vp ${HOME}/.config/fish
	@install -m 0644 config.fish $(HOME)/.config/fish/
ifeq ($(OS_NAME),Darwin)
	@cp -rv functions/ $(HOME)/.config/fish/functions/
else
	@install -m 0644 functions/*.fish $(HOME)/.config/fish/functions/
endif
	@echo -e "\n${BROWN}# OH MY FISH INSTALL${END_COLOR}"
	@$(FISH_CMD) --command "omf version > /dev/null" || { \
		curl -4 -L https://get.oh-my.fish | $(FISH_CMD) || true; \
	};
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
