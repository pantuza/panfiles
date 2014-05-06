#
# Third part software rules
#


PKGMGR := zypper


.PHONY: c

all: install


install: C net


C: c
	sudo $(PKGMGR) install $(shell cat $+)

network: net
	sudo $(PKGMGR) install $(shell cat $+)
