
SLACK_RPM_URL := "https://downloads.slack-edge.com/linux_releases/slack-4.8.0-0.1.fc21.x86_64.rpm"

SLACK_RPM_NAME := slack.rpm

install: slack


slack:
	@echo "Installing Slack from RPM"
	wget $(SLACK_RPM_URL) -O $(SLACK_RPM_NAME)
	sudo rpm --install --nodeps $(SLACK_RPM_NAME)
