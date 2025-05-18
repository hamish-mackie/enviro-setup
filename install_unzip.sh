#!/usr/bin/env bash
set -euo pipefail

# 1. Prepare data_unzip directory
mkdir -p data_unzip
cd data_unzip

# 2. Download the unzip .deb package
apt download unzip

# 3. Extract its contents
dpkg -x unzip_*.deb extracted

# 4. Create ~/bin if needed
mkdir -p ~/bin

# 5. Symlink the unzip binary into ~/bin
ln -sf "$PWD/extracted/usr/bin/unzip" ~/bin/unzip

# 6. Go back to original directory
cd -

echo "unzip is now available as ~/bin/unzip"
echo "If you want to run it just by typing 'unzip', make sure ~/bin is in your PATH (e.g. via ./helper_add_to_path.sh)."
