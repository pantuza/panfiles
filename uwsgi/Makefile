# Make file for uWSGI settings


# defines the shell to the make application
SHELL := /bin/bash


# uWSGI
UWSGI := uwsgi
UWSGI_DIR := /etc/uwsgi
VASSALS := $(UWSGI_DIR)/vassals
SKELETON := skel.ini


.PHONY := install


install: $(SKELETON)
	@echo -e "\n$(BROWN)# UWSGI CONFIGURATION INSTALL$(END_COLOR)"
	zypper install $(UWSGI)
	@mkdir -pv $(VASSALS)
	install $(SKELETON) $(VASSALS)/$(SKELETON)
	@echo -e "$(BROWN)**\n$(END_COLOR)"
