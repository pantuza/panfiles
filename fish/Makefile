# Make file for install fish shell

# defines the shell to the make application
SHELL := /bin/bash

.PHONY := install


install: config.fish
	@echo -e "\n${BROWN}# FISH SHELL INSTALL${END_COLOR}"
	@make -C ../third-party/ osshell
	@mkdir -vp ${HOME}/.config/fish
	@install config.fish ${HOME}/.config/fish/ -m 0644
	@make -C ../third-party/ python
	@sudo pip install virtualfish
	@chsh --shell "$(shell which fish)"
	@curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
	@echo "rvm default" >> ~/.config/fish/config.fish
	@install functions/*.fish ~/.config/fish/functions/
	@curl -L http://get.oh-my.fish | fish
	@omf install fishbone
	@omf install battery
	@omf install await
	@omf install rvm
	@omf install weather
	@echo -e "$(BROWN)**\n$(END_COLOR)"
