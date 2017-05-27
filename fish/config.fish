

# Setting golang path
set -gx GOPATH "$HOME/go"

# Virtualfish - Python virtualenv at fish shell
eval (python -m virtualfish compat_aliases auto_activation)

# Inicialize Pyenv
pyenv-init
