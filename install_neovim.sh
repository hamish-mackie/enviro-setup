mkdir -p ~/bin

mkdir -p data_neovim

echo "installing neovim"
curl -L --progress-bar https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz | tar xz -C data_neovim --strip-components=1

ln -sf $PWD/data_neovim/bin/nvim ~/bin/nvim 

echo "installing nv chad"
if [ -d "$HOME/.config/nvim" ]; then
  echo "could not install nvchad: warning: directory '$HOME/.config/nvim' already exists."
  # If you want to stop immediately, uncomment the next line:
  # exit 1
else
  echo "installing nv chad, neovim set up"
  git clone https://github.com/NvChad/starter "$HOME/.config/nvim"
fi

./helper_add_to_path.sh

cp -r neovim_config/* ~/.config/nvim/

source ~/.bashrc

nvim -c "sleep 250m | MasonInstallAll"
# nvim -c "sleep 250m | TSInstall cpp"
