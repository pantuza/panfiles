# Make file for install vim parts

# defines the shell to the make application
SHELL := /bin/bash

# bashrc file name
VIMRC := vimrc

# VIM plugins urls 
SRC_URL := http://www.vim.org/scripts/download_script.php?src_id=
NERDTREE := 17123
TAGLIST := 19574
CVIM := 21803
CLANG_COMPLETE := 19588

.PHONY := install


install: ${VIMRC}
	@echo -e "\n${BROWN}# VIM INSTALL${END_COLOR}"
	@echo -e "${BLUE}placing ${VIMRC} file at '$(USER_HOME)/.$(VIMRC)'${END_COLOR}"
	install ${VIMRC} $(USER_HOME)/.$(VIMRC) -m 0644
	# Download and install plugins
	@echo -e "${BLUE}creating VIM directories:${END_COLOR}"
	mkdir -pv $(USER_HOME)/.vim/{plugin,doc}
	@echo -e "\n${BLUE}Downloading NERD tree plugin${END_COLOR}"
	wget -O $(USER_HOME)/.vim/nerdtree.zip ${SRC_URL}${NERDTREE}
	unzip $(USER_HOME)/.vim/nerdtree.zip -d $(USER_HOME)/.vim/
	@echo -e "\n${BLUE}Downloading Tag List plugin${END_COLOR}"
	wget -O $(USER_HOME)/.vim/taglist.zip ${SRC_URL}${TAGLIST}
	unzip $(USER_HOME)/.vim/taglist.zip -d $(USER_HOME)/.vim/
	@echo -e "\n${BLUE}Downloading c.vim plugin${END_COLOR}"
	wget -O $(USER_HOME)/.vim/cvim.zip ${SRC_URL}${CVIM}
	unzip $(USER_HOME)/.vim/cvim.zip -d $(USER_HOME)/.vim/
	@echo -e "\n${BLUE}Downloading clang_complete plugin${END_COLOR}"
	wget -O $(USER_HOME)/.vim/clang_complete.vmb ${SRC_URL}${CLANG_COMPLETE}
	vim $(USER_HOME)/.vim/clang_complete.vmb -c 'so %' -c 'q'
	@echo -e "\n${BLUE}Installing dependencies${END_COLOR}"
	[ -x /usr/bin/clang ] && echo "clang OK" || sudo zypper in clang
	[ -x /usr/bin/ctags ] && echo "ctags OK" || sudo zypper in ctags
	@echo -e "\n${BLUE}Removing downloaded files${END_COLOR}"
	rm -fv $(USER_HOME)/.vim/{*.zip,*.vmb}
	@echo -e "$(BROWN)**\n$(END_COLOR)"
