#!/usr/bin/env bash
set -e

# 1. Create a temporary working directory and change into it
TMPDIR=$(mktemp -d)
cd "$TMPDIR"

# 2. Download the 'unzip' package (no sudo needed, just downloads the deb file)
apt download unzip

# 3. Extract the .deb into a subfolder
dpkg -x unzip_*.deb extracted

# 4. Create ~/bin if it doesn't exist
mkdir -p ~/bin

# 5. Copy the extracted unzip binary to ~/bin, renaming it
cp extracted/usr/bin/unzip ~/bin/unzip

# 6. Make sure it’s executable
chmod +x ~/bin/unzip

# Optional cleanup of the temporary directory
rm -rf "$TMPDIR"

echo "All done! You can now run it using: ~/bin/unzip"
echo "If you want to just type 'unzip', ensure ~/bin is in your PATH."
