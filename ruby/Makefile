# Make file for install ruby

# defines the shell to the make application
SHELL := /bin/bash

.PHONY := install


install:
	@echo -e "\n${BROWN}# RUBY INSTALL${END_COLOR}"
	@make -C ../third-party rubydev
	@curl -sSL https://get.rvm.io | bash
	@curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
	@grep "rvm default" ~/.config/fish/config.fish > /dev/null \
		&& echo "RVM already in fish config" \
		|| echo -e "\n# Configure ruby RVM for fish\nrvm default" >> ~/.config/fish/config.fish
	@echo -e "$(BROWN)**\n$(END_COLOR)"
