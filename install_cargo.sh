#!/usr/bin/env bash
set -euo pipefail

# 1. Setup target dirs
mkdir -p ~/bin
mkdir -p data_cargo/cargo
mkdir -p data_cargo/rustup

export CARGO_HOME="$PWD/data_cargo/cargo"
export RUSTUP_HOME="$PWD/data_cargo/rustup"

echo "Installing cargo via rustup-init into data_cargo…"

# 2. Download rustup-init
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o data_cargo/rustup-init.sh
chmod +x data_cargo/rustup-init.sh

# 3. Install minimal Rust toolchain
./data_cargo/rustup-init.sh -y --no-modify-path --profile minimal

# 4. Symlink cargo and rustc
ln -sf "$CARGO_HOME/bin/cargo" ~/bin/cargo
ln -sf "$CARGO_HOME/bin/rustc" ~/bin/rustc
ln -sf "$CARGO_HOME/bin/rustup" ~/bin/rustup

# 5. Ensure ~/bin is in PATH
./helper_add_to_path.sh

# 6. Set default toolchain to stable
"$CARGO_HOME/bin/rustup" default stable

echo "Cargo installed to ~/bin/cargo, default toolchain set to stable."
