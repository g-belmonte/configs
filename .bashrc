#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# build prompts
export PS1="[\u@\h:\w]\\$ "
export PS2=">"

# Configure environment variables
export PATH=$PATH:$HOME/.local/bin
export EDITOR='nvim'
export TERM=screen-256color

# Configure aliases
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ll='ls --color=auto -lh'
alias la='ls --color=auto -lah'
alias l='ls --color=auto -CF'
alias clc='clear'
alias emacs='emacs -nw'
alias g='git'

[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
