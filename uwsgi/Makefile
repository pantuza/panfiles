# Make file for uWSGI settings


# defines the shell to the make application
SHELL := /bin/bash


# uWSGI
UWSGI := uwsgi


# uWSGI files
EMPEROR := emperor.ini
SERVICE := emperor.uwsgi.service
VASSALS := $(UWSGI_DIR)/vassals
SKELETON := skel.ini


# Directories
UWSGI_DIR := /etc/uwsgi
SYSD_DIR := /etc/systemd/system/
LOG_DIR := /var/log/uwsgi 


# Process ownership
UWSGI_UID := nginx
UWSGI_GID := nginx


.PHONY := install


install: $(SKELETON)
	@echo -e "\n$(BROWN)# UWSGI CONFIGURATION INSTALL$(END_COLOR)"
	sudo zypper install $(UWSGI)
	@mkdir -pv $(VASSALS)
	@mkdir -pv $(LOG_DIR)
	@chown $(UID):$(GID) $(LOG_DIR) -Rv
	install $(EMPEROR) $(UWSGI_DIR)/$(EMPEROR)
	install $(SERVICE) $(SYSD_DIR)/$(SERVICE)
	install $(SKELETON) $(VASSALS)/$(SKELETON)
	@echo -e "$(BROWN)**\n$(END_COLOR)"
