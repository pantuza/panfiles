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
	sudo $(PKGMGR) install $(shell cat $+)

network: net
	sudo $(PKGMGR) install $(shell cat $+)

rubydev: ruby
	sudo $(PKGMGR) install $(shell cat $+)

pythondev: python
	sudo $(PKGMGR) install $(shell cat $+)

browsing: browser
	sudo $(PKGMGR) install $(shell cat $+)

osmgr: os
	sudo $(PKGMGR) install $(shell cat $+)

videos: video
	sudo $(PKGMGR) install $(shell cat $+)

docs: doc
	sudo $(PKGMGR) install $(shell cat $+)

development: dev
	sudo $(PKGMGR) install $(shell cat $+)

audios: audio
	sudo $(PKGMGR) install $(shell cat $+)

irccli: irc
	sudo $(PKGMGR) install $(shell cat $+)

jdk: java
	sudo $(PKGMGR) install $(shell cat $+)

godev: go
	sudo $(PKGMGR) install $(shell cat $+)

builds: build
	sudo $(PKGMGR) install $(shell cat $+)

email: mail
	sudo $(PKGMGR) install $(shell cat $+)

db: database
	sudo $(PKGMGR) install $(shell cat $+)
