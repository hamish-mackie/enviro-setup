#!/usr/bin/env bash
set -e

sudo apt-get update
sudo apt-get install -y build-essential pkg-config libssl-dev

./install_bashrc.sh
# Reload environment so bin directory is availiable
source ~/.bashrc

# Environment setup
./install_node.sh
./install_fd_find.sh
./install_ripgrep.sh
./install_cargo.sh
./install_ruff.sh
./install_btop.sh
./install_lazy_git.sh
./install_unzip.sh
./install_zellij.sh

./install_neovim.sh

# Ensure rustup and nightly toolchain
rustup install nightly
rustup default nightly

# Verify installation
which cargo
cargo --version
rustc --version

# Open Neovim to trigger plugin setup
nvim

