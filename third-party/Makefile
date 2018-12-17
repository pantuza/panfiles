#
# Third part software rules
#


# Package Manager binary based on operating system
ifeq ($(shell uname -s),Darwin)
$(info Using brew as package manager. Darwin OS)
PKGMGR := brew
else
$(info Using zypper as package manager. Considering OpenSUSE as the OS)
PKGMGR := zypper
endif


PACKMAN_REPO := "http://ftp.gwdg.de/pub/linux/packman/suse/openSUSE_Tumbleweed/packman.repo"


all: install


install: repos cdev network rubydev pythondev browsing osmgr videos docs \
	development audio irccli jdk godev images filesystem security cloud

repos:
	sudo zypper addrepo --refresh --check --name "Packman" $(PACKMAN_REPO)
	sudo zypper --gpg-auto-import-keys refresh

cdev: c
	sudo $(PKGMGR) install -y $(shell cat $+)

network: net
	sudo $(PKGMGR) install -y $(shell cat $+)

cloud: virt
	sudo $(PKGMGR) install -y $(shell cat $+)
	sudo pip install docker-compose
	sudo usermod --append --groups docker ${USER}
	sudo systemctl enable docker.service
	sudo systemctl start docker.service

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

osshell: shell
	sudo $(PKGMGR) install -y $(shell cat $+)

images: image
	sudo $(PKGMGR) install -y $(shell cat $+)

filesystem: fs
	sudo $(PKGMGR) install -y $(shell cat $+)

mathematics: math
	sudo $(PKGMGR) install -y $(shell cat $+)

security: sec
	sudo $(PKGMGR) install -y $(shell cat $+)
