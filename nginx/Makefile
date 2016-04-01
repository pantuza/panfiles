# Make file for Nginx webserver


# defines the shell to the make application
SHELL := /bin/bash


# Nginx project name o package manager
NGINX := nginx

NGINX_CONF_DIR := /etc/$(NGINX)


.PHONY := install


install:
	@echo -e "\n$(BROWN)# NGINX WEBSERVER INSTALL$(END_COLOR)"
	sudo zypper install $(NGINX)
	@sudo mkdir -vp $(NGINX_CONF_DIR)/rewrites
	@sudo mkdir -vp $(NGINX_CONF_DIR)/conf.d
	@echo -e "$(BROWN)**\n$(END_COLOR)"

uninstall:
	sudo zypper remove $(NGINX)
