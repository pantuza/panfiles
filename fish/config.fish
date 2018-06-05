

# Setting golang path
set -gx GOPATH "$HOME/go"

# Exports tty to GPG
set --export GPG_TTY (tty)
