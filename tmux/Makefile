#
# Makefile to rule tmux installation
#


CONF_FILE := tmux.conf

PKG_MANAGER := $(shell which zypper)


install: configure
	@echo "Installing tmux"
	@sudo $(PKG_MANAGER) -y install tmux

configure:
	@echo "Configuring tmux"
	@install -m 0644 $(CONF_FILE) $(HOME)/.$(CONF_FILE)
