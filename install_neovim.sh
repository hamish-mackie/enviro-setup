#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$SCRIPT_DIR/data_neovim"
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.config"

echo "installing neovim"
curl -L --progress-bar https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz \
  | tar xz -C "$SCRIPT_DIR/data_neovim" --strip-components=1

ln -sf "$SCRIPT_DIR/data_neovim/bin/nvim" "$HOME/.local/bin/nvim"
ln -sfn "$SCRIPT_DIR/dotfiles/nvim" "$HOME/.config/nvim"

source "$HOME/.bashrc"

nvim

echo "install Hack Nerd Font: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip"
echo "install JetBrainsMono Nerd Font: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip"
