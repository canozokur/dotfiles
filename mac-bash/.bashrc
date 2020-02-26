#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='gls --color=auto'

export PROMPT_COMMAND="echo -ne '\033]0;${USER}@${HOSTNAME}\007';$PROMPT_COMMAND"

# export GOPATH
export GOPATH=$HOME/data/gocode
# export Go binary directory
export PATH=$PATH:$HOME/data/gocode/bin
# export bin dir in home
export PATH=$PATH:$HOME/bin

# <3 vi
export EDITOR=vi

# bash history
export HISTCONTROL='ignoredups:erasedups'

# chruby
# shellcheck disable=SC1091
source /usr/local/share/chruby/chruby.sh
# shellcheck disable=SC1091
source /usr/local/share/chruby/auto.sh

# ansible-playbook alias
alias ansible-playbook='ansible-playbook --diff'

# venv alias - all py virtual environments should be in ".venv" dir
alias venv='source .venv/bin/activate'

# openssl s_client alias
alias os='openssl s_client -connect'

# terraform alias
alias tf='terraform'

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
    gtr -dc 'a-zA-Z0-9' < /dev/urandom | fold -w "${1:-32}" | head -n 1
}

# fingerprint ssh key, compatible with EC2
function sshkey_fp() {
    openssl pkey -in "$@" -pubout -outform DER | openssl md5 -c
}

# decrypt ansible-vault encrypted string
function ansible-vault-decrypt-string() {
    echo -n "$1" | tr -d ' ' | ansible-vault decrypt /dev/stdin --output=/dev/stderr > /dev/null | cat
}

# encrypt a string with ansible-vault
function ansible-vault-encrypt-string() {
    echo -n "$1" | ansible-vault encrypt_string --stdin-name "$2"
}

function lintjs() {
    jq -C < "$1" | less -R
}

function setp() {
    export AWS_PROFILE=$1
}

function unsetp() {
   unset AWS_PROFILE
}

export BYOBU_PREFIX=/usr/local
export HOMEBREW_NO_AUTO_UPDATE=1

# powerline-go config
function _update_ps1() {
    PS1=$(/usr/local/bin/powerline-go -modules 'git,newline,aws,terraform-workspace,venv,user,ssh,cwd,perms,jobs,exit,root,termtitle' -cwd-max-depth 3 -cwd-mode fancy -error $? -numeric-exit-codes)
}

if [ "$TERM" != "linux" ] && [ -f "/usr/local/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1091
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# shellcheck disable=SC1091
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# included for google cloud sdk
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'
