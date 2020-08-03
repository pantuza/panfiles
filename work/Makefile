
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


install: slack zoom spotify


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
