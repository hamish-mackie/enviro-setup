mkdir -p ~/bin
mkdir -p data_fd

echo "Installing fd (fd-find)..."
curl -L --progress-bar https://github.com/sharkdp/fd/releases/download/v9.0.0/fd-v9.0.0-x86_64-unknown-linux-musl.tar.gz \
    | tar xz -C data_fd --strip-components=1

ln -sf "$PWD/data_fd/fd" ~/bin/fd

./helper_add_to_path.sh
