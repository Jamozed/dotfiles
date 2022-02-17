# dotfiles

Configuration files and scripts for my Linux system.

## Configs

- Bash (Shell)
- bspwm (Window Manager)
- Git (VCS)
- Neovim (Editor)
- picom (Compositor)
- sxhkd (Hotkey Daemon)
- Zathura (PDF Viewer)

## Scripts

- flactomp3 - Convert FLAC to MP3
- reflac - (Re)encode FLAC files
- repdf - Re-encode PDF files

## Usage

Once the repository has been cloned, the dotfiles can be installed by running
`./install.sh`. This will create symlinks for each of the configuration files
assuming there is not already a file present.

Neovim plugins must be installed by running `:PaqInstall` inside Neovim.
