#!/bin/bash

set -e

mkdir -p ~/bin
mkdir -p data_lazygit/tmp

echo "installing lazygit"
curl -L --progress-bar https://github.com/jesseduffield/lazygit/releases/download/v0.42.0/lazygit_0.42.0_Linux_x86_64.tar.gz | tar xz -C data_lazygit/tmp

mv data_lazygit/tmp/lazygit data_lazygit/
rm -rf data_lazygit/tmp

ln -sf "$PWD/data_lazygit/lazygit" ~/bin/lazygit

./helper_add_to_path.sh

