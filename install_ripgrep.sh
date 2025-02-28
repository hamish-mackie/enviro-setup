mkdir -p ~/bin

mkdir -p data_ripgrep

echo "installing ripgrep"
curl -L --progress-bar https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz | tar xz -C data_ripgrep --strip-components=1

ln -sf $PWD/data_ripgrep/rg ~/bin/rg

./helper_add_to_path.sh
