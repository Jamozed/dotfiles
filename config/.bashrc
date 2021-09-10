# .bashrc
# Config file for bash
# Located in ~

HISTCONTROL=ignoreboth
HISTFILE="$XDG_DATA_HOME/bash/history"

shopt -s histappend

alias l='ls'
alias la='ls -Al'
alias ll='ls -l'
alias ls='ls -v --color=auto --group-directories-first --si'

alias diff='diff --color=auto'
alias grep='grep --color=auto'

alias ssh='TERM=xterm-color ssh'

alias r='ranger'

alias echo='env echo'
