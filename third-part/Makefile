#
# Third part software rules
#


PKGMGR := zypper


.PHONY: c

all: install


install: C


C: c
	sudo $(PKGMGR) install $(shell cat $+)
