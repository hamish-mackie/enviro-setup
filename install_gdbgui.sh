#!/bin/bash

mkdir -p ~/bin
mkdir -p data_gdbgui

echo "Installing gdbgui"
curl -L --progress-bar https://github.com/cs01/gdbgui/releases/download/v0.15.0.1/gdbgui_linux.zip -o gdbgui.zip

unzip -q gdbgui.zip -d data_gdbgui

mv "$PWD/data_gdbgui/gdbgui_0.15.0.1" "$PWD/data_gdbgui/gdbgui"

chmod +x data_gdbgui/gdbgui
ln -sf "$PWD/data_gdbgui/gdbgui" ~/bin/gdbgui

rm gdbgui.zip

./helper_add_to_path.sh
