#
# Third part software rules
#


PKGMGR := zypper


.PHONY: c

all: install


install: cdev network rubydev pythondev browsing osmgr videos


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

