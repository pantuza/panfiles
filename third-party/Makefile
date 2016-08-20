#
# Third part software rules
#

# Package Manager
PKGMGR := zypper

PACKMAN_REPO := "http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_13.2/"


all: install


install: repos cdev network rubydev pythondev browsing osmgr videos docs \
	development audio irccli jdk godev

repos:
	sudo zypper addrepo --refresh \
		--check \
		--name "Packman Repository" \
		$(PACKMAN_REPO) \
		"ftp.gwdg.de-suse"

cdev: c
	sudo $(PKGMGR) install -y $(shell cat $+)

network: net
	sudo $(PKGMGR) install -y $(shell cat $+)

rubydev: ruby
	sudo $(PKGMGR) install -y $(shell cat $+)

pythondev: python
	sudo $(PKGMGR) install -y $(shell cat $+)

browsing: browser
	sudo $(PKGMGR) install -y $(shell cat $+)

osmgr: os
	sudo $(PKGMGR) install -y $(shell cat $+)

videos: video
	sudo $(PKGMGR) install -y $(shell cat $+)

docs: doc
	sudo $(PKGMGR) install -y $(shell cat $+)

development: dev
	sudo $(PKGMGR) install -y $(shell cat $+)

audios: audio
	sudo $(PKGMGR) install -y $(shell cat $+)

irccli: irc
	sudo $(PKGMGR) install -y $(shell cat $+)

jdk: java
	sudo $(PKGMGR) install -y $(shell cat $+)

godev: go
	sudo $(PKGMGR) install -y $(shell cat $+)

builds: build
	sudo $(PKGMGR) install -y $(shell cat $+)

email: mail
	sudo $(PKGMGR) install -y $(shell cat $+)

db: database
	sudo $(PKGMGR) install -y $(shell cat $+)
