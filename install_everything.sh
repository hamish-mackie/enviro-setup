#!/usr/bin/env bash
set -eu

# run bashrc setup first
./install_bashrc.sh

# install Rust (cargo/rustup)
./install_cargo.sh
source ~/.bashrc

# run other installers (order flexible, but neovim last)
./install_unzip.sh
./install_zellij.sh
./install_node.sh
./install_fd_find.sh
./install_ripgrep.sh
./install_btop.sh
./install_lazy_git.sh

# install Ruff
./install_ruff.sh

# install jinja-lsp with cargo
cargo install jinja-lsp

# finally, install Neovim
./install_neovim.sh

echo "All tools installed."

