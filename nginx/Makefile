# Make file for Nginx webserver


# defines the shell to the make application
SHELL := /bin/bash


# Nginx project name o package manager
NGINX := nginx

NGINX_CONF_DIR := /etc/$(NGINX)
NGINX_CONF_FILE := nginx.conf


.PHONY := install


install:
	@echo -e "\n$(BROWN)# NGINX WEBSERVER INSTALL$(END_COLOR)"
	sudo zypper --non-interactive install $(NGINX)
	@sudo mkdir -vp $(NGINX_CONF_DIR)/rewrites
	@sudo mkdir -vp $(NGINX_CONF_DIR)/conf.d
	@install -m 0644 $(NGINX_CONF_FILE) $(NGINX_CONF_DIR)/$(NGINX_CONF_FILE)
	@echo -e "$(BROWN)**\n$(END_COLOR)"

uninstall:
	sudo zypper --non-interactive remove $(NGINX)
