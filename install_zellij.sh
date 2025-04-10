#!/usr/bin/env bash
set -e

mkdir -p ~/bin
mkdir -p data_zellij

echo "Installing Zellij..."

# Download the latest musl-based prebuilt binary
curl -L --progress-bar https://github.com/zellij-org/zellij/releases/download/v0.39.2/zellij-x86_64-unknown-linux-musl.tar.gz \
    | tar xz -C data_zellij

# Link binary to ~/bin
ln -sf "$PWD/data_zellij/zellij" ~/bin/zellij

cp -r $PWD/zellij_config/* ~/.config/zellij/

echo "Done! To run Zellij, use: ~/bin/zellij"
echo "To run it as just 'zellij', make sure ~/bin is in your PATH."

# Optional: update PATH in shell profile
if ! echo "$PATH" | grep -q "$HOME/bin"; then
  echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
  echo 'Updated ~/.bashrc to include ~/bin in PATH. Reload your shell or run: source ~/.bashrc'
fi
