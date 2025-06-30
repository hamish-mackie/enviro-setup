#!/usr/bin/env bash
set -euo pipefail

# 0) Make sure ~/.bashrc exists
[ -f "$HOME/.bashrc" ] || : > "$HOME/.bashrc"

# 1) Add loader block exactly once
dotfiles_dir="$PWD/configs/bashrc"
dotfiles_rc="$dotfiles_dir/.bashrc"
dotfiles_alias="$dotfiles_dir/.config_alias"
loader_start="# >>> dotfiles loader >>>"

if ! grep -Fq "$loader_start" "$HOME/.bashrc"; then
    {
        cat <<EOF
$loader_start
if [ -f "$dotfiles_rc" ]; then
    . "$dotfiles_rc"
fi
if [ -f "$dotfiles_alias" ]; then
    . "$dotfiles_alias"
fi
# <<< dotfiles loader <<<
EOF
        cat "$HOME/.bashrc"
    } > "$HOME/.bashrc.tmp" && mv "$HOME/.bashrc.tmp" "$HOME/.bashrc"
    echo "Loader block added to ~/.bashrc"
else
    echo "Loader block already present – skipped"
fi

# 2) Other dotfiles
ln -sf "$PWD/configs/tmux/.tmux.conf" ~/.tmux.conf

