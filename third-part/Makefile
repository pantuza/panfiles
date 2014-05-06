#
# Third part software rules
#


PKGMGR := zypper


.PHONY: c

all: install


install: cdev net ruby


cdev: c
	sudo $(PKGMGR) install $(shell cat $+)

network: net
	sudo $(PKGMGR) install $(shell cat $+)

rubydev: ruby
	sudo $(PKGMGR) install $(shell cat $+)

pythondev: python
	sudo $(PKGMGR) install $(shell cat $+)

