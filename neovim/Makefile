# Makefile for installing Neovim and my personal configurations

SHELL := /bin/bash

LAZYVIM_URL := https://github.com/LazyVim/starter
NEOVIM_PATH := ${HOME}/.config/nvim


ifeq ($(PKGMGR),/usr/local/bin/brew)
	NVIM_CMD := /usr/local/bin/nvim
else
	NVIM_CMD := /opt/homebrew/bin/nvim
endif


.PHONY := install
install:
	@echo -e "\n${BROWN}# NEOVIM INSTALL${END_COLOR}"
	${PKGMGR} install neovim
	@echo -e "${BROWN}Intalling fonts..${END_COLOR}"
	@$(PKGMGR) tap homebrew/cask-fonts
	@$(PKGMGR) install font-hack-nerd-font
	@echo -e "${BROWN}Intalling LazyVim..${END_COLOR}"
	@test -d ${NEOVIM_PATH} && echo "LazyVim found. Skip cloning." || git clone ${LAZYVIM_URL} ${NEOVIM_PATH}
	@echo -e "${BROWN}Configuring LazyVim..${END_COLOR}"
	@cp -rv lua/* ${NEOVIM_PATH}/lua/
	@echo -e "${BROWN}Intalling plugins..${END_COLOR}"
	@$(NVIM_CMD) --headless "+Lazy! sync" +qa
	@echo -e "$(BROWN)**\n$(END_COLOR)"
