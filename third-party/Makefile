#
# Third part software rules
#


PACKMAN_REPO := "http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/packman.repo"


all: install


install: repos cdev network ebpf rubydev pythondev browsing osmgr videos docs \
	development audio irccli jdk godev images filesystem security cloud
	@echo "--"
	@echo "All dependencies installed!"

repos:
	$(SUDO) zypper addrepo --refresh --check --name "Packman" $(PACKMAN_REPO) || true
	$(SUDO) zypper --gpg-auto-import-keys refresh

cdev: c
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

network: net
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

.PHONY: ebpf
ebpf: ebpf
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

cloud: virt
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)
	$(SUDO) pip install docker-compose
	$(SUDO) usermod --append --groups docker ${USER}
	$(SUDO) systemctl enable docker.service
	$(SUDO) systemctl start docker.service

rubydev: ruby
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

pythondev: python
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

browsing: browser
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

osmgr: os
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

videos: video
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) --allow-vendor-change $(shell cat $+)

docs: doc
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

development: dev
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

.PHONY: audio
audio:
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $@)

irccli: irc
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

jdk: java
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

godev: go
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

builds: build
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

email: mail
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

db: database
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

osshell: shell
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

images: image
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

filesystem: fs
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

mathematics: math
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)

security: sec
	$(SUDO) $(PKGMGR) install $(INSTALL_OPTS) $(shell cat $+)
