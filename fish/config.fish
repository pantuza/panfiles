

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
