

# Setting golang variables
set --global --export GOPATH $HOME/go
set --global --export GOBIN $GOPATH/bin
fish_add_path --global $GOBIN
set --global --export GO111MODULE on

# Exports tty to GPG
set --export GPG_TTY (tty)


# Exports terminal variable
set --export TERM xterm-256color


# Sets the daily update file path
# set --export DAILY_UPDATE_FILE {PATH_TO_DAILY_UPDATE_FILE}


# Set OS specific configurations
switch (uname)
    case Linux
        # Create aliases for ls and ll commands
        alias ls="exa"
        alias ll="exa -abghHliS"
    case Darwin
        # Configure grc plugin
        alias ls="grc --pty lsd"
        alias ll="grc --pty lsd -al"

        # Creates alias to always use GNU Make instead of BSDs
        alias make gmake

        # Always open Neo Vim when calling vim from command line
        alias vim nvim
end

# Loads all custom functions
source ~/.config/fish/functions/*.fish

# Dedup PATH variable that could be messed by external tools
dedup_path
