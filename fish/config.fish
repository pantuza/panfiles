

# Setting golang variables
set --global --export GOPATH $HOME/go
set --global --export GOBIN $GOPATH/bin
set --global --export PATH $PATH $GOBIN
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
        alias ls="ls --color"
        alias ll="ls -ilha --color"
    case Darwin
        # Configure grc plugin
        alias ls="grc --pty ls -G"
        alias ll="grc --pty ls -ilhaG"

        # Creates alias to always use GNU Make instead of BSDs
        alias make gmake
end

# Loads all custom functions
source ~/.config/fish/functions/*.fish
