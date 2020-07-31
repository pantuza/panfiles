# Make file for install vim parts

# defines the shell to the make application
SHELL := /bin/bash

# bashrc file name
VIMRC := vimrc

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
	@echo -e "\n${BLUE}Installing dependencies${END_COLOR}"
	[ -x /usr/bin/clang ] && echo "clang OK" || sudo zypper in -y llvm-clang
	[ -x /usr/bin/ctags ] && echo "ctags OK" || sudo zypper in -y ctags
	[ -x /usr/bin/aspell ] && echo "aspell OK" || sudo zypper in -y aspell aspell-pt_BR aspell-en
	@echo -e "\n${BLUE}Copying pt-BR and en_US dictionary for spell checks${END_COLOR}"
	@mv -vf spell/*.spl $(HOME)/.vim/spell/
	@echo -e "${BLUE}Installing plugins using Plug Vim:${END_COLOR}"
	vim +PlugInstall +qall
	@echo -e "${BLUE}Installing Golang tools binaries:${END_COLOR}"
	vim +GoInstallBinaries +qall
	@echo -e "$(BROWN)**\n$(END_COLOR)"
