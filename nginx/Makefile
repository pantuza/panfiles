# Make file for Nginx webserver


# defines the shell to the make application
SHELL := /bin/bash


# Nginx project name o package manager
NGINX := nginx

NGINX_DIR := /etc/$(NGINX)
NGINX_CONF_FILE := nginx.conf
TEST_CONF := test.conf

SYSTEMCTL := $(shell which systemctl)

.PHONY := install


install:
	@echo -e "\n$(BROWN)# NGINX WEBSERVER INSTALL$(END_COLOR)"
	sudo zypper --non-interactive install $(NGINX)
	@sudo mkdir -vp $(NGINX_DIR)/rewrites
	@sudo mkdir -vp $(NGINX_DIR)/conf.d
	@sudo install -v -m 0644 $(NGINX_CONF_FILE) $(NGINX_DIR)/$(NGINX_CONF_FILE)
	@sudo install -v -m 0644 $(TEST_CONF) $(NGINX_DIR)/conf.d
	@echo -e "$(BROWN)**\n$(END_COLOR)"

born:
	sudo $(SYSTEMCTL) enable $(NGINX).service
	sudo $(SYSTEMCTL) start $(NGINX).service

uninstall:
	sudo $(SYSTEMCTL) disable $(NGINX).service
	sudo $(SYSTEMCTL) stop $(NGINX).service
	sudo zypper --non-interactive remove $(NGINX)
