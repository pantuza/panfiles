# Makefile for installing Neovim and my personal configurations

SHELL := /bin/bash

LAZYVIM_URL := https://github.com/LazyVim/starter
NEOVIM_PATH := ${HOME}/.config/nvim

OS_NAME := $(shell uname -s)

# Package Manager binary based on operating system
ifndef PKGMGR
PKGMGR=/opt/homebrew/bin/brew
endif
ifeq ($(OS_NAME),Linux)
    PKGMGR := $(shell which zypper || which yum)
endif

NVIM_CMD := /opt/homebrew/bin/nvim

.PHONY := install
install:
	@echo -e "\n${BROWN}# NEOVIM INSTALL${END_COLOR}"
	${PKGMGR} install neovim
	@test -d ${NEOVIM_PATH} && echo "LazyVim found. Skip cloning." || git clone ${LAZYVIM_URL} ${NEOVIM_PATH}
	@cp -rv lua/* ${NEOVIM_PATH}/lua/
	@$(NVIM_CMD) --headless "+Lazy! sync" +qa
	@echo -e "$(BROWN)**\n$(END_COLOR)"
