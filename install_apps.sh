cp copy_to_home_dir/. ~/ -r

mkdir -p ~/bin

mkdir -p temp_files
cd temp_files


echo "installing ripgrep"
mkdir -p ripgrep
curl -L --progress-bar https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz | tar xz -C ripgrep --strip-components=1

ln -sf $PWD/ripgrep/rg ~/bin/rg
echo "installing neovim"
mkdir -p neovim
curl -L --progress-bar https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz | tar xz -C neovim --strip-components=1

ln -sf $PWD/neovim/bin/nvim ~/bin/nvim 
cd ..

echo "installing nv chad"
if [ -d "$HOME/.config/nvim" ]; then
  echo "could not install nvchad: warning: directory '$HOME/.config/nvim' already exists."
  # If you want to stop immediately, uncomment the next line:
  # exit 1
else
  echo "installing nv chad, neovim set up"
  git clone https://github.com/NvChad/starter "$HOME/.config/nvim"
  echo "run nvim and :MasonInstallAll to install plugins"
fi

LINE_TO_ADD='PATH=$PATH:~/bin'
FILE="$HOME/.bashrc"

# Check if the line already exists
if ! grep -Fq "$LINE_TO_ADD" "$FILE"; then
    echo "$LINE_TO_ADD" >> "$FILE"
    echo "Added '$LINE_TO_ADD' to $FILE"
else
    echo "'$LINE_TO_ADD' already present in $FILE"
fi


