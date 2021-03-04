#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH=$PATH:$HOME/.local/bin
export EDITOR='nvim'
export TERM=screen-256color

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ll='ls --color=auto -lh'
alias la='ls --color=auto -lah'
alias l='ls --color=auto -CF'
alias clc='clear
alias emacs='emacs -nw'
alias g='git'

PS1='[\u@\h \W]\$ '
