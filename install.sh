#!/usr/bin/env sh
DIR="$(dirname $(realpath "$0"))"

# Check XDG environment variables, and set the to default if unset
if [ -z "$XDG_CONFIG_HOME" ]; then XDG_CONFIG_HOME="$HOME/.config"; fi

mkdir -p "$XDG_CONFIG_HOME/git" && ln -s "$DIR/.config/git/config" "$XDG_CONFIG_HOME/git/config"
mkdir -p "$XDG_CONFIG_HOME/nvim" && ln -s "$DIR/.config/nvim/init.lua" "$XDG_CONFIG_HOME/nvim/init.lua"
mkdir -p "$XDG_CONFIG_HOME/zathura" && ln -s "$DIR/.config/zathura/zathurarc" "$XDG_CONFIG_HOME/zathura/zathurarc"
