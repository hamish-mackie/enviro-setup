#!/usr/bin/env bash
set -euo pipefail

# Standard locations
export CARGO_HOME="${CARGO_HOME:-$HOME/.cargo}"
export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"
export PATH="$CARGO_HOME/bin:$PATH"

# Ensure dirs
mkdir -p "$CARGO_HOME" "$RUSTUP_HOME"

# Persist to ~/.bashrc (idempotent)
grep -q 'CARGO_HOME=' ~/.bashrc || {
  {
    echo 'export CARGO_HOME="$HOME/.cargo"'
    echo 'export RUSTUP_HOME="$HOME/.rustup"'
    echo 'export PATH="$CARGO_HOME/bin:$PATH"'
  } >> ~/.bashrc
}

# Remove old shims
rm -f ~/bin/cargo ~/bin/rustc ~/bin/rustup || true

# Install rustup and minimal toolchain
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal
source "$CARGO_HOME/env"

# Toolchains
rustup update
rustup default stable
rustup toolchain install nightly
rustup component add rustfmt --toolchain nightly

# Verify
hash -r
which rustup
rustup show
cargo -V
rustc -V
rustup run nightly rustc -V

echo "Rust installed in $CARGO_HOME and $RUSTUP_HOME"

