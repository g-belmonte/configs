#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=${PATH}:/home/grb/.local/bin
export EDITOR='vim'
export TERM=screen-256color

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ll='ls --color=auto -lh'
alias la='ls --color=auto -lah'
alias l='ls --color=auto -CF'
alias emacs='emacs -nw'

PS1='[\u@\h \W]\$ '
