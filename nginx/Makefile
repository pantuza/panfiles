# Make file for Nginx webserver


# defines the shell to the make application
SHELL := /bin/bash


# Nginx project name o package manager
NGINX := nginx


.PHONY := install


install:
	@echo -e "\n$(BROWN)# NGINX WEBSERVER INSTALL$(END_COLOR)"
	sudo zypper install $(NGINX)
	@echo -e "$(BROWN)**\n$(END_COLOR)"

uninstall:
	sudo zypper remove $(NGINX)
