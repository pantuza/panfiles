# Make file for install ruby

# RVM binary path
RVM := ~/.rvm/bin/rvm

RVM_OPTS :=
ifeq ($(OS_NAME),Darwin)
	RVM_OPTS := --with-openssl-dir=$(shell $(PKGMGR) --prefix openssl)
endif


.PHONY: install
install:
	@echo "\n${BROWN}# RUBY INSTALL${END_COLOR}"
	@make -C ../third-party rubydev
	@echo "\n${BROWN} • Installing RVM..${END_COLOR}"
	@curl -sSL https://rvm.io/mpapis.asc | gpg --import -
	@curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
	@curl -sSL https://get.rvm.io | bash
	@echo "\n${BROWN} • Configure RVM on Fish shell..${END_COLOR}"
	@curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
	@grep "rvm default" ~/.config/fish/config.fish > /dev/null \
		&& echo "RVM already in fish config" \
		|| echo "\n# Configure ruby RVM for fish\nrvm default" >> ~/.config/fish/config.fish
	@echo "\n${BROWN} • Intalling latest Ruby version using RVM..${END_COLOR}"
	@$(RVM) autolibs enable && $(RVM) install ruby --latest $(RVM_OPTS)
	@echo "$(BROWN)**\n$(END_COLOR)"
