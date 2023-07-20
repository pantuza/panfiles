# Makefile for installing Neovim and my personal configurations

SHELL := /bin/bash

LAZYVIM_URL := https://github.com/LazyVim/starter
NEOVIM_PATH := ${HOME}/.config/nvim

OS_NAME := $(shell uname -s)

# Package Manager binary based on operating system
PKG_MGR := brew
ifeq ($(OS_NAME),Linux)
    PKG_MGR := $(shell which zypper || which yum)
endif



.PHONY := install
install:
	@echo -e "\n${BROWN}# NEOVIM INSTALL${END_COLOR}"
	${PKG_MGR} install neovim
	@test -d ${NEOVIM_PATH} && echo "LazyVim found. Skip cloning." || git clone ${LAZYVIM_URL} ${NEOVIM_PATH}
	@nvim --headless "+Lazy! sync" +qa
	@echo -e "$(BROWN)**\n$(END_COLOR)"
