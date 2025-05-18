#!/usr/bin/env bash
set -euo pipefail

# 1. Prepare directories
mkdir -p ~/bin
mkdir -p data_btop

echo "Installing btop…"

# 2. Download & extract the .tbz archive directly
curl -L --progress-bar \
  https://github.com/aristocratos/btop/releases/download/v1.4.3/btop-x86_64-linux-musl.tbz \
  | tar xj -C data_btop --strip-components=1

# 3. Symlink into ~/bin
ln -sf "$PWD/data_btop/btop/bin/btop" ~/bin/btop

# 4. Ensure ~/bin is on your PATH
./helper_add_to_path.sh

echo "btop installed to ~/bin/btop"

