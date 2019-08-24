#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=${PATH}:/home/grb/.gem/ruby/2.6.0/bin
export EDITOR='vim'
export TERM=screen-256color

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ll='ls --color=auto -lh'
alias la='ls --color=auto -lah'
alias l='ls --color=auto -CF'

PS1='[\u@\h \W]\$ '

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh
