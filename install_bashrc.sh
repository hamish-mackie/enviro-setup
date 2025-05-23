#!/bin/bash
mkdir -p ~/bin

backup_dir="$HOME/backup"
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
dest_dir="$backup_dir/$timestamp"
mkdir -p "$dest_dir"

cp "$HOME/.bashrc" "$dest_dir"

echo "Backup of .bashrc completed at $dest_dir"

ln -sf "$PWD/configs/bashrc/.bashrc" ~/.bashrc
ln -sf "$PWD/configs/bashrc/.config_aliases" ~/.config_aliases
ln -sf "$PWD/configs/tmux/.tmux.conf" ~/.tmux.conf
