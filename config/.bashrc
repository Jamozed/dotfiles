# .bashrc
# Config file for bash
# Located in ~

HISTCONTROL=ignoreboth
HISTFILE="$XDG_DATA_HOME/bash/history"

shopt -s histappend

alias ls='ls -v --color=auto --group-directories-first --si'
alias diff='diff --color=auto'
alias grep='grep --color=auto'

alias echo='env echo'

alias startx='startx "$XDG_CONFIG_HOME/X11/xinitrc"'
