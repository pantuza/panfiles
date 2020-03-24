
# defines the shell to the make application
SHELL := /bin/bash


# i3wm directory
I3_DIR := ${HOME}/.config/i3

# i3wm configuration file
I3_CFG := config

# i3status directory
I3_STATUS_DIR := ${HOME}/.config/i3status

# i3wm status bar configuration file
I3_STATUS_CFG := i3status.conf

# X resources file
XRESOURCE := Xresources

I3_SESSION_PLUGIN := "https://raw.githubusercontent.com/joepestro/i3session/master/i3session"


# Typeface Hack
HACK_FONT_URL := "https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip"


# System fonts directory
SYS_FONTS_PATH := "/usr/share/fonts"


.PHONY := install



install: font $(I3_CFG)
	@echo -e "\n# i3 Window Manager Install"
	@sudo zypper install -y i3
	@echo -e "\n# Installing dependency i3-py"
	@sudo pip install i3-py --upgrade
	@echo -e "\n# Downloading Session plugin"
	@wget ${I3_SESSION_PLUGIN} -P ${HOME}/bin/
	@chmod +x ${HOME}/bin/i3session
	@sudo ln -sf ${HOME}/bin/i3session /usr/bin/i3session
	@echo -e "\n# Creating i3wm user directories"
	@mkdir -pv ${I3_DIR}
	@mkdir -pv ${I3_STATUS_DIR}
	@echo -e "\n# Copying personal configuration file"
	@cp -vf ${I3_CFG} ${I3_DIR}/config
	@cp -vf ${I3_STATUS_CFG} ${I3_STATUS_DIR}/config
	@echo -e "\n# Copying X server init file"
	@cp -vf xinitrc ${HOME}/.xinitrc
	@echo -e "\n# Copying X resource configuration file"
	@cp -vf ${XRESOURCE} ${HOME}/.Xresources
	@echo -e "# Done!\n**\n"


font:
	@echo "Hack font installation"
	@wget $(HACK_FONT_URL)
	@unzip "Hack*ttf.zip"
	@sudo mkdir -vp $(SYS_FONTS_PATH)/Hack
	@sudo mv -vf ttf/* $(SYS_FONTS_PATH)/Hack/
	@fc-cache -vf
	@fc-list | grep "Hack" --color
	@rm -rvf ttf "Hack*ttf.zip"
