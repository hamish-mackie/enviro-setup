#!/usr/bin/env bash
#
# dump_dir.sh
# -------------
# Usage: dump_dir.sh [TARGET_DIR] [OUTPUT_FILE]
# 
# - TARGET_DIR:   Directory to process (defaults to current directory)
# - OUTPUT_FILE:  File to write all output to (defaults to ./dump.txt)
#
# Requirements:
#   • tree must be installed (e.g. `sudo apt install tree` or `brew install tree`)
#   • bash/sh compatible shell

set -euo pipefail

# Parse arguments
TARGET_DIR="${1:-.}"
OUTPUT_FILE="${2:-dump.txt}"

# Make sure TARGET_DIR exists
if [[ ! -d "$TARGET_DIR" ]]; then
  echo "Error: '$TARGET_DIR' is not a directory." >&2
  exit 1
fi

# Begin dumping
{
  # 1) Directory structure
  echo "=== Directory tree of '$TARGET_DIR' ==="
  tree "$TARGET_DIR" || {
    echo "(warning: 'tree' command failed—continuing without tree output)" >&2
  }
  echo
  echo "=== File contents ==="
  
  # 2) Find and cat each file
  #    We use find to list all files; adjust -type filter if you want to skip dotfiles, binaries, etc.
  find "$TARGET_DIR" -type f | sort | while IFS= read -r file; do
    echo
    echo "----- Begin: $file -----"
    cat "$file" || echo "(could not cat $file)" >&2
    echo "-----  End: $file  -----"
  done
} > "$OUTPUT_FILE"

echo "All done. Output written to '$OUTPUT_FILE'."

