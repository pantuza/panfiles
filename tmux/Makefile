#
# Makefile to rule tmux installation
#


CONF_FILE := tmux.conf

PKG_MANAGER := $(shell which zypper)


install: configure
	@echo "Installing tmux"
	@sudo $(PKG_MANAGER) install -y tmux

configure:
	@echo "Installing Tmux plugin manager TPM.."
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm || true
	@echo "Configuring tmux.."
	@install -m 0644 $(CONF_FILE) $(HOME)/.$(CONF_FILE)
