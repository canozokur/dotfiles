#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

_set_liveuser_PS1() {
    PS1='[\u@\h \W]\$ '
    if [ "$(whoami)" = "liveuser" ] ; then
        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
        if [ -n "$iso_version" ] ; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}
_set_liveuser_PS1
unset -f _set_liveuser_PS1

ShowInstallerIsoInfo() {
    local file=/usr/lib/endeavouros-release
    if [ -r $file ] ; then
        cat $file
    else
        echo "Sorry, installer ISO info is not available." >&2
    fi
}


alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
# alias pacdiff=eos-pacdiff
################################################################################

# BEGIN ANSIBLE MANAGED BLOCK FOR pyenv
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
#export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# END ANSIBLE MANAGED BLOCK FOR pyenv
# BEGIN ANSIBLE MANAGED BLOCK FOR powerline
# powerline-go config
function _update_ps1() {
  PS1=$(/usr/bin/powerline-go -modules 'termtitle,git,aws,kube,terraform-workspace,venv,newline,cwd,perms,jobs,exit' -cwd-max-depth 3 -cwd-mode fancy -error $? -numeric-exit-codes -shell bash)
}

if [ "$TERM" != "linux" ] && [ -f "/usr/bin/powerline-go" ]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
# END ANSIBLE MANAGED BLOCK FOR powerline
# BEGIN ANSIBLE MANAGED BLOCK FOR histcontrol
# ignore duplicates in bash history
export HISTCONTROL=ignoreboth:erasedups
# END ANSIBLE MANAGED BLOCK FOR histcontrol
# BEGIN ANSIBLE MANAGED BLOCK FOR terraform alias
alias tf='terraform'
# END ANSIBLE MANAGED BLOCK FOR terraform alias
# BEGIN ANSIBLE MANAGED BLOCK FOR vim alias
alias vi='nvim'
alias vim='nvim'
# END ANSIBLE MANAGED BLOCK FOR vim alias
# BEGIN ANSIBLE MANAGED BLOCK FOR ansible-playbook alias
alias apl='ansible-playbook'
# END ANSIBLE MANAGED BLOCK FOR ansible-playbook alias
# BEGIN ANSIBLE MANAGED BLOCK FOR go-path
export GOPATH=$HOME/go:$HOME/data/go
export PATH="${PATH}:$HOME/go/bin"
# END ANSIBLE MANAGED BLOCK FOR go-path
# BEGIN ANSIBLE MANAGED BLOCK FOR nvm
source /usr/share/nvm/init-nvm.sh
# END ANSIBLE MANAGED BLOCK FOR nvm
# BEGIN ANSIBLE MANAGED BLOCK FOR base64decode alias
b64d() {
  local secret="$1"
  echo -n "${secret}" | base64 -d
}
# END ANSIBLE MANAGED BLOCK FOR base64decode alias
# BEGIN ANSIBLE MANAGED BLOCK FOR git clone  func
gitclone(){ pushd ~/data/git; git clone "$@" "$(echo "$@" | sed -E 's#^.*([:/])([^/]+/[^/]+)$#\2#' | sed -E 's#\.git$##')"; popd;}
# END ANSIBLE MANAGED BLOCK FOR git clone  func
# BEGIN ANSIBLE MANAGED BLOCK FOR curl timing func
alias cuti="curl -w '
time_namelookup:  %{time_namelookup}
time_connect:  %{time_connect}
time_appconnect:  %{time_appconnect}
time_pretransfer:  %{time_pretransfer}
time_redirect:  %{time_redirect}
time_starttransfer:  %{time_starttransfer}
----------
time_total:  %{time_total}\n' -o /dev/null -s"
# END ANSIBLE MANAGED BLOCK FOR curl timing func
# BEGIN ANSIBLE MANAGED BLOCK FOR fzf
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
# END ANSIBLE MANAGED BLOCK FOR fzf
# BEGIN ANSIBLE MANAGED BLOCK FOR inspec
function inspec { docker run -it --volume=$(pwd)/credentials.json:/secrets/key.json --env=GOOGLE_APPLICATION_CREDENTIALS=/secrets/key.json --rm -v $(pwd):/share inspec-usermode "$@" --chef-license=accept-silent; }
# END ANSIBLE MANAGED BLOCK FOR inspec
# BEGIN ANSIBLE MANAGED BLOCK FOR gcloud (and SDK)
function setgp() {
  export CLOUDSDK_CORE_PROJECT=$1
}

function unsetgp() {
  unset CLOUDSDK_CORE_PROJECT
}
# END ANSIBLE MANAGED BLOCK FOR gcloud (and SDK)
# BEGIN ANSIBLE MANAGED BLOCK FOR pwgen
alias pwgen='pwgen -y -n -c 18 1'
# END ANSIBLE MANAGED BLOCK FOR pwgen
# BEGIN ANSIBLE MANAGED BLOCK FOR editor
export VISUAL=vim
export EDITOR=vim
# END ANSIBLE MANAGED BLOCK FOR editor
# BEGIN ANSIBLE MANAGED BLOCK FOR tfenv
export PATH="$HOME/.tfenv/bin:$PATH"
# END ANSIBLE MANAGED BLOCK FOR tfenv
# BEGIN ANSIBLE MANAGED BLOCK FOR kubectl
alias k='kubectl'
alias ky='kubectl -o yaml'
alias kd='kubectl describe'
_completion_loader kubectl
complete -o default -F __start_kubectl k
complete -o default -F __start_kubectl ky
# END ANSIBLE MANAGED BLOCK FOR kubectl
# BEGIN ANSIBLE MANAGED BLOCK FOR csvquery
function csvquery {
  echo "Running: sqlite3 :memory: -cmd '.mode csv' -cmd '.import ${1} csvtable' -cmd '.mode column' """${2}""""
  sqlite3 :memory: -cmd '.mode csv' -cmd '.import '"${1}"' csvtable' -cmd '.mode column' "${2}"
}
# END ANSIBLE MANAGED BLOCK FOR csvquery
function setp() {
  export AWS_PROFILE=$1
}

function unsetp() {
  unset AWS_PROFILE
}
# BEGIN ANSIBLE MANAGED BLOCK FOR gcloud auth plugin
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
# END ANSIBLE MANAGED BLOCK FOR gcloud auth plugin
# BEGIN ANSIBLE MANAGED BLOCK FOR ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
# END ANSIBLE MANAGED BLOCK FOR ssh-agent

# Created by `pipx` on 2023-06-13 08:55:46
export PATH="$PATH:/home/canozokur/.local/bin"
# BEGIN ANSIBLE MANAGED BLOCK FOR firefox two finger swipe
export MOZ_USE_XINPUT2=1
# END ANSIBLE MANAGED BLOCK FOR firefox two finger swipe

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# krew configuration
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# zellij conf
ZELLIJ_AUTO_ATTACH=true
if [[ -z "$ZELLIJ" ]]; then
  if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
    zellij attach -c
  else
    zellij --layout compact
  fi

  if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
    exit
  fi
fi

# read machine specific exports if they exist
[ -s "$HOME/.bash_exports" ] && \. "$HOME/.bash_exports"
