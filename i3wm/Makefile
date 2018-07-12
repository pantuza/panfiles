
# defines the shell to the make application
SHELL := /bin/bash


# i3wm directory
I3_DIR := ${HOME}/.config/i3

# i3wm configuration file
I3_CFG := config

I3_SESSION_PLUGIN := "https://raw.githubusercontent.com/joepestro/i3session/master/i3session"

.PHONY := install


install: $(I3_CFG)
	@echo -e "\n# i3 Window Manager Install"
	@sudo zypper install -y i3
	@echo -e "\n# Installing dependency i3-py"
	@sudo pip2.7 install i3-py --upgrade
	@echo -e "\n# Downloading Session plugin"
	@wget ${I3_SESSION_PLUGIN} -P ${HOME}/bin/
	@chmod +x ${HOME}/bin/i3session
	@sudo ln -sf ${HOME}/bin/i3session /usr/bin/i3session
	@echo -e "\n# Copying personal configuration file"
	@cp -vf ${I3_CFG} ${I3_DIR}/config
	@echo -e "\n# Copying X server init file"
	@cp -vf xinitrc ${HOME}/.xinitrc
	@echo -e "# Done!\n**\n"
