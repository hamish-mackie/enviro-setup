#!/usr/bin/env bash
set -e

# Variables
BIN_DIR="$HOME/bin"
INSTALL_DIR="$PWD/data_node"

# Ensure directories exist
mkdir -p "$BIN_DIR"
mkdir -p "$INSTALL_DIR"

# Download and extract Node.js
NODE_VERSION="v20.12.2"
NODE_URL="https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.xz"
echo "Installing Node.js and npm..."
curl -L --progress-bar "$NODE_URL" | tar -xJ -C "$INSTALL_DIR" --strip-components=1

# Link binaries
ln -sf "$INSTALL_DIR/bin/node" "$BIN_DIR/node"
ln -sf "$INSTALL_DIR/bin/npm" "$BIN_DIR/npm"
ln -sf "$INSTALL_DIR/bin/npx" "$BIN_DIR/npx"

# Setup PATH
if ! echo "$PATH" | grep -q "$BIN_DIR"; then
  echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
  echo 'Updated ~/.bashrc with $HOME/bin in PATH.'
fi

# Reload bash config
source ~/.bashrc

echo "Node.js and npm installation complete!"
echo "You can now run node, npm, and npx directly from the terminal."
