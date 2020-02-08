if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v _pyenv_virtualenv_hook 1>/dev/null 2>&1; then
  eval "$(pyenv virtualenv-init -)"
fi

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
