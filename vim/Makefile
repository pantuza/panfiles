# Make file for install vim parts

# defines the shell to the make application
SHELL := /bin/bash

# bashrc file name
VIMRC := vimrc

# CoC plugin configuration file
COC_CFG := coc-settings.json

OS_NAME := $(shell uname -s)


PKG_MGR := zypper
ifeq ($(OS_NAME),Linux)
    PKG_MGR := $(shell which zypper || which yum)
endif



.PHONY := install
install: ${VIMRC}
	@echo -e "\n${BROWN}# VIM INSTALL${END_COLOR}"
	@echo -e "${BLUE}placing ${VIMRC} file at '$(HOME)/.$(VIMRC)'${END_COLOR}"
	install -m 0644 ${VIMRC} $(HOME)/.$(VIMRC)
	@echo -e "${BLUE}creating VIM directories:${END_COLOR}"
	mkdir -pv $(HOME)/.vim/{plugin,doc,spell,syntax,colors}
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	install -m 0644 colors/pantuza.vim $(HOME)/.vim/colors 
	cp -rvf autoload/* $(HOME)/.vim/autoload/
	@echo -e "\n${BLUE}Installing COC autocomplete dependencies ${END_COLOR}"
ifeq ($(OS_NAME),Darwin)
	brew install yarn aspell golang
else
	[ -x /usr/bin/yarn ] && echo "yarn OK" || sudo $(PKG_MGR) install -y nodejs && sudo npm install yarn -g
endif
	@sudo yarn global add typescript --prefix /usr/local/
	install -m 0644 $(COC_CFG) $(HOME)/.vim/
	@echo -e "\n${BLUE}Installing aspell dependencies${END_COLOR}"
ifneq ($(OS_NAME),Darwin)
	[ -x /usr/bin/clang ] && echo "clang OK" || sudo $(PKG_MGR) install -y llvm-clang || sudo $(PKG_MGR) install -y clang
	[ -x /usr/bin/ctags ] && echo "ctags OK" || sudo $(PKG_MGR) install -y ctags
	[ -x /usr/bin/aspell ] && echo "aspell OK" || sudo $(PKG_MGR) install -y aspell aspell-pt_BR aspell-en
endif
	@echo -e "\n${BLUE}Copying pt-BR and en_US dictionary for spell checks${END_COLOR}"
	@cp -vf spell/*.spl $(HOME)/.vim/spell/
	@echo -e "${BLUE}Installing plugins using Plug Vim:${END_COLOR}"
	vim +PlugInstall +qall
	@echo -e "${BLUE}Installing Golang tools binaries:${END_COLOR}"
ifeq ($(OS_NAME),Darwin)
	brew install golang
else
	$(MAKE) godev -C ../third-party/
endif
	vim +GoInstallBinaries +qall
	GO111MODULE=on go get golang.org/x/tools/gopls@latest
	@echo -e "$(BROWN)**\n$(END_COLOR)"
