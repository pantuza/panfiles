
# Place where we download RPM files
DOWNLOADS_DIR := $(HOME)/Downloads

# Slack variables
SLACK_RPM_URL := "https://downloads.slack-edge.com/linux_releases/slack-4.8.0-0.1.fc21.x86_64.rpm"
SLACK_RPM_NAME := slack.rpm

# Zoom variables
ZOOM_RPM_URL := "https://www.zoom.us/client/latest/zoom_openSUSE_x86_64.rpm"
ZOOM_RPM_NAME := zoom.rpm

# Spotify variables
SPOTIFY_PKG := spotify-easyrpm
SPOTIFY_DEPS := patch rpm-build

# Mendeley variables
MENDELEY_BZ2_URL := "https://www.mendeley.com/autoupdates/installer/Linux-x64/stable-incoming"
MENDELEY_BZ2_NAME := mendeley.tar.bz2

# Path to link binary
TARGET_BIN_PATH := /usr/local/bin

# User bin directory
HOME_BIN := $(HOME)/bin

#
# Available targets
#
install: slack zoom spotify mendeley


slack:
	@echo "Installing Slack from RPM"
	wget -q $(SLACK_RPM_URL) -O $(DOWNLOADS_DIR)/$(SLACK_RPM_NAME)
	sudo rpm --install --force --nodeps $(DOWNLOADS_DIR)/$(SLACK_RPM_NAME)


zoom:
	@echo "Installing Zoom from RPM"
	wget -q $(ZOOM_RPM_URL) -O $(DOWNLOADS_DIR)/$(ZOOM_RPM_NAME)
	sudo zypper --no-gpg-checks install -y $(DOWNLOADS_DIR)/$(ZOOM_RPM_NAME)


spotify:
	@echo "Installing Spotify"
	sudo zypper install -y $(SPOTIFY_DEPS) $(SPOTIFY_PKG)
	spotify-easyrpm --quite

mendeley:
	@echo "Installing Mendeley from Tar Bz2"
	wget -q $(MENDELEY_BZ2_URL) -O $(DOWNLOADS_DIR)/$(MENDELEY_BZ2_NAME)
	mkdir -p $(HOME_BIN)/mendeley
	tar -xjvf $(DOWNLOADS_DIR)/$(MENDELEY_BZ2_NAME) -C $(HOME_BIN)/mendeley --strip-components 1
	sudo ln -svf $(HOME_BIN)/mendeley/bin/mendeleydesktop $(TARGET_BIN_PATH)/mendeley
