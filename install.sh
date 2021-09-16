#!/usr/bin/env sh
DIR="$(dirname $(realpath "$0"))"
DIR_CONFIG="$DIR/config"
DIR_SCRIPT="$DIR/script"

# Check XDG environment variables, and set the to default if unset
if [ -z "$XDG_CONFIG_HOME" ]; then XDG_CONFIG_HOME="$HOME/.config"; fi
if [ -z "$XDG_DATA_HOME" ]; then XDG_DATA_HOME="$HOME/.local/share"; fi

# Print the message $1 to stderr and potentially exit
error() { echo "$(basename "$0"): $1" >&2; exit 1; }
warn() { echo "$(basename "$0"): $1" >&2; }

# Install the file $3 from the source $2 to destination $1
install() {
	if [ -L "$1/$3" ]; then warn "$3: Already installed"; return; fi
	if [ -e "$1/$3" ]; then warn "$3: File exists"; return; fi
	mkdir -p "$(dirname "$1/$3")"; ln -s "$2/$3" "$1/$3"
}

# Install symbolic links for config files if they do not already exist
install "$XDG_CONFIG_HOME" "$DIR_CONFIG" 'bspwm/bspwmrc'
install "$XDG_CONFIG_HOME" "$DIR_CONFIG" 'git/config'
install "$XDG_CONFIG_HOME" "$DIR_CONFIG" 'nvim/init.lua'
install "$XDG_CONFIG_HOME" "$DIR_CONFIG" 'zathura/zathurarc'

install "$HOME" "$DIR_CONFIG" '.bashrc'

# Install symbolic links for scripts if they do not already exist
install "$HOME/.local/bin" "$DIR_SCRIPT" 'flactomp3'
install "$HOME/.local/bin" "$DIR_SCRIPT" 'reflac'
install "$HOME/.local/bin" "$DIR_SCRIPT" 'repdf'

# Ensure that required programs are installed
if ! command -v git > /dev/null; then error 'git: Not found in PATH'; fi

# Install Neovim Paq plugin manager if it is not already installed
if [ ! -d "$XDG_DATA_HOME/nvim/site/pack/paqs/start/paq-nvim" ]; then
	git clone https://github.com/savq/paq-nvim.git "$XDG_DATA_HOME/nvim/site/pack/paqs/start/paq-nvim";
fi
