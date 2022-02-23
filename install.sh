#!/usr/bin/env sh
# install.sh
# Script for installing dotfiles

# Print the message $1 to stderr and potentially exit
error() { echo "$(basename "$0"): $1" >&2; exit 1; }
warn() { echo "$(basename "$0"): $1" >&2; }

# Check XDG environment variables, and set the to default if unset
if [ -z "$XDG_CONFIG_HOME" ]; then XDG_CONFIG_HOME="$HOME/.config"; fi
if [ -z "$XDG_DATA_HOME" ]; then XDG_DATA_HOME="$HOME/.local/share"; fi

# Set directory variables
DIR="$(dirname $(realpath "$0"))"
DIR_CONFIG="$DIR/config"
DIR_SCRIPT="$DIR/script"

# Install the file $3 from the source $2 to destination $1
#install() {
#	if [ -L "$1/$3" ]; then echo "$3: already installed"; return; fi
#	mkdir -p "$(dirname "$1/$3")"; ln -isv "$2/$3" "$1/$3"
#}

# Install the file $3 from the source $1 to the destination $2
install() {
	if ! [ -e "$1/$3" ]; then echo "$3: dotfile missing"; return; fi
	if   [ -L "$2/$3" ]; then echo "$3: already installed"; return; fi
	mkdir -p "$(dirname "$2/$3")"; ln -isv "$1/$3" "$2/$3"
}

# Install symbolic links for config files if they do not already exist
install "$DIR_CONFIG" "$XDG_CONFIG_HOME" 'alacritty/alacritty.yml'
install "$DIR_CONFIG" "$XDG_CONFIG_HOME" 'bspwm/bspwmrc'
install "$DIR_CONFIG" "$XDG_CONFIG_HOME" 'dunst/dunstrc'
install "$DIR_CONFIG" "$XDG_CONFIG_HOME" 'git/config'
install "$DIR_CONFIG" "$XDG_CONFIG_HOME" 'npm/npmrc'
install "$DIR_CONFIG" "$XDG_CONFIG_HOME" 'nvim/init.lua'
install "$DIR_CONFIG" "$XDG_CONFIG_HOME" 'picom/picom.conf'
install "$DIR_CONFIG" "$XDG_CONFIG_HOME" 'polybar/config'
install "$DIR_CONFIG" "$XDG_CONFIG_HOME" 'rofi/config.rasi'
install "$DIR_CONFIG" "$XDG_CONFIG_HOME" 'sxhkd/sxhkdrc'
install "$DIR_CONFIG" "$XDG_CONFIG_HOME" 'zathura/zathurarc'

install "$DIR_CONFIG" "$XDG_CONFIG_HOME" 'chromium-flags.conf'

install "$DIR_CONFIG" "$HOME" '.bashrc'

# Install symbolic links for scripts if they do not already exist
install "$DIR_SCRIPT" "$HOME/.local/bin" 'flactomp3'
install "$DIR_SCRIPT" "$HOME/.local/bin" 'reflac'
install "$DIR_SCRIPT" "$HOME/.local/bin" 'repdf'

# Ensure that required programs are installed
if ! command -v git > /dev/null; then error 'git: Not found in PATH'; fi

# Install Neovim Paq plugin manager if it is not already installed
if [ ! -d "$XDG_DATA_HOME/nvim/site/pack/paqs/start/paq-nvim" ]; then
	git clone https://github.com/savq/paq-nvim.git "$XDG_DATA_HOME/nvim/site/pack/paqs/start/paq-nvim";
fi
