#!/usr/bin/env bash

set -euo pipefail

# Directory where we'll install the 'unzip' binary
INSTALL_DIR="$HOME/bin"

mkdir -p "$INSTALL_DIR"

# Check if ~/.bin is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  echo "WARNING: $INSTALL_DIR is not in your PATH."
  echo "You should add the following line to your shell config (e.g. ~/.bashrc or ~/.zshrc):"
  echo "    export PATH=\"$INSTALL_DIR:\$PATH\""
  echo
fi

cd /tmp
echo "Downloading unzip source..."
curl -LO https://downloads.sourceforge.net/infozip/unzip60.tar.gz

echo "Extracting..."
tar xvf unzip60.tar.gz
cd unzip60

echo "Compiling..."
make -f unix/Makefile generic

echo "Installing into $INSTALL_DIR..."
cp unzip "$INSTALL_DIR"/unzip

echo
echo "Done! 'unzip' is now installed at: $INSTALL_DIR/unzip"
echo "If you haven’t already, make sure $INSTALL_DIR is in your PATH."
