#
# Makefile to rule tmux installation
#


CONF_FILE := tmux.conf

ALACRITTY_CFG := alacritty.yml


.PHONY := install
install: configure
	@echo "OS: $(OS_NAME)"
	@echo "${BROWN}Installing tmux..${END_COLOR}"
ifeq ($(OS_NAME),Darwin)
	@$(PKGMGR) install tmux
else
	@sudo $(PKGMGR) install -y tmux
endif


configure:
	@echo "${BROWN}Installing Tmux plugin manager TPM..${END_COLOR}"
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
	@echo "${BROWN}Configuring tmux..${END_COLOR}"
	@install -m 0644 $(CONF_FILE) $(HOME)/.$(CONF_FILE)
ifeq ($(OS_NAME),Darwin)
	@mkdir -pv $(HOME)/.config/alacritty
	@install -m 0644 $(ALACRITTY_CFG) $(HOME)/.config/alacritty/$(ALACRITTY_CFG)
endif
