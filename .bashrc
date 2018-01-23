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

# export GOPATH
export GOPATH=$HOME/data/gocode

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
time_namelookup:  %{time_namelookup}
time_connect:  %{time_connect}
time_appconnect:  %{time_appconnect}
time_pretransfer:  %{time_pretransfer}
time_redirect:  %{time_redirect}
time_starttransfer:  %{time_starttransfer}
----------
time_total:  %{time_total}\n' -o /dev/null -s"

# vagrant rdp
alias vrdp="vagrant rdp -- -r clipboard:PRIMARYCLIPBOARD -g 1600x900"

## FUNCTIONS
# generate random string func
gen_rand_str () {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}

# fingerprint ssh key, compatible with EC2
function sshkey_fp() {
    openssl pkey -in $@ -pubout -outform DER | openssl md5 -c
}
