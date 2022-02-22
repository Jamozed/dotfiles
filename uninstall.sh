#!/usr/bin/env sh
# uninstall.sh
# Script for uninstalling dotfiles

# Print the message $1 to stderr and potentially exit
error() { echo "$(basename "$0"): $1" >&2; exit 1; }
warn() { echo "$(basename "$0"): $1" >&2; }

# Check XDG environment variables, and set the to default if unset
if [ -z "$XDG_CONFIG_HOME" ]; then XDG_CONFIG_HOME="$HOME/.config"; fi
if [ -z "$XDG_DATA_HOME" ]; then XDG_DATA_HOME="$HOME/.local/share"; fi

# Set directory variables
DIR="$(dirname $(realpath "$0"))"

# Uninstall the file $1
uninstall() { if [ -L "$1" ]; then rm -iv "$1"; return; fi }

# Uninstall symbolic links for config files if they exist
uninstall "$XDG_CONFIG_HOME/alacritty/alacritty.yml"
uninstall "$XDG_CONFIG_HOME/bspwm/bspwmrc"
uninstall "$XDG_CONFIG_HOME/git/config"
uninstall "$XDG_CONFIG_HOME/npm/npmrc"
uninstall "$XDG_CONFIG_HOME/nvim/init.lua"
uninstall "$XDG_CONFIG_HOME/picom/picom.conf"
uninstall "$XDG_CONFIG_HOME/polybar/config"
uninstall "$XDG_CONFIG_HOME/sxhkd/sxhkdrc"
uninstall "$XDG_CONFIG_HOME/zathura/zathurarc"

uninstall "$HOME/.bashrc"

# Uninstall symbolic links for scripts if they exist
uninstall "$HOME/.local/bin/flactomp3"
uninstall "$HOME/.local/bin/reflac"
uninstall "$HOME/.local/bin/repdf"
