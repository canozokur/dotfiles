#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

if [ -f /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
fi

# Fix terminal colors for servers
alias ssh='TERM=xterm ssh'
alias vagrant='TERM=xterm vagrant'
alias chefdk='docker run --rm -it -v ~/data/chef-repo:/repo -v ~/.ssh:/root/.ssh chefdk /bin/bash'

# <3 vi
export EDITOR=vi

# bash history
export HISTCONTROL='ignoredups:erasedups'

# chruby
source /usr/share/chruby/chruby.sh
chruby 2.4

# ansible-playbook alias
alias ansible-playbook='ansible-playbook --diff'

# venv alias - all py virtual environments should be in ".venv" dir
alias venv='source .venv/bin/activate'

# openssl s_client alias
alias os='openssl s_client -connect'

# curl timing
alias cuti="curl -w '
time_namelookup:  %{time_namelookup}\n
time_connect:  %{time_connect}\n
time_appconnect:  %{time_appconnect}\n
time_pretransfer:  %{time_pretransfer}\n
time_redirect:  %{time_redirect}\n
time_starttransfer:  %{time_starttransfer}\n
----------\n
time_total:  %{time_total}\n' -o /dev/null -s"

## FUNCTIONS
# generate random string func
gen_rand_str () {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}
