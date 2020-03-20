

# Setting golang paths
set -gx GOPATH "$HOME/go"
set -gx GOBIN "$GOPATH/bin"
set -gx PATH "$PATH $GOBIN"

# Exports tty to GPG
set --export GPG_TTY (tty)


# Exports terminal variable
set --export TERM xterm-256color


# Sets the daily update file path
# set --export DAILY_UPDATE_FILE {PATH_TO_DAILY_UPDATE_FILE}
