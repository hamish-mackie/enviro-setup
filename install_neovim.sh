mkdir -p ~/bin

mkdir -p data_neovim

echo "installing neovim"
curl -L --progress-bar https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz | tar xz -C data_neovim --strip-components=1

ln -sf $PWD/data_neovim/bin/nvim ~/bin/nvim 

./helper_add_to_path.sh

mkdir -p ~/.config/nvim

cp -r $PWD/nvim_config/* ~/.config/nvim/

source ~/.bashrc

nvim

echo "install hack nerd font: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/Hack.zip"
echo "instal jet brains nerd font: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip"
