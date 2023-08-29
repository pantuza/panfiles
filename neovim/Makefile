# Makefile for installing Neovim and my personal configurations

SHELL := /bin/bash

LAZYVIM_URL := https://github.com/LazyVim/starter
NEOVIM_PATH := ${HOME}/.config/nvim

OS_NAME := $(shell uname -s)

# Package Manager binary based on operating system
ifndef PKGMGR
ifeq ($(shell test -e /usr/local/bin/brew && echo "exist"),exist)
	PKGMGR=/usr/local/bin/brew
	NVIM_CMD := /usr/local/bin/nvim
else
	PKGMGR=/opt/homebrew/bin/brew
	NVIM_CMD := /opt/homebrew/bin/nvim
endif
endif
ifeq ($(OS_NAME),Linux)
    PKGMGR := $(shell which zypper || which yum)
endif


.PHONY := install
install:
	@echo -e "\n${BROWN}# NEOVIM INSTALL${END_COLOR}"
	${PKGMGR} install neovim 
	@echo "${BROWN}Intalling fonts..${END_COLOR}"
	@$(PKGMGR) tap homebrew/cask-fonts
	@$(PKGMGR) install font-hack-nerd-font
	@echo "${BROWN}Intalling LazyVim..${END_COLOR}"
	@test -d ${NEOVIM_PATH} && echo "LazyVim found. Skip cloning." || git clone ${LAZYVIM_URL} ${NEOVIM_PATH}
	@echo "${BROWN}Configuring LazyVim..${END_COLOR}"
	@cp -rv lua/* ${NEOVIM_PATH}/lua/
	@echo "${BROWN}Intalling plugins..${END_COLOR}"
	@$(NVIM_CMD) --headless "+Lazy! sync" +qa
	@echo -e "$(BROWN)**\n$(END_COLOR)"
