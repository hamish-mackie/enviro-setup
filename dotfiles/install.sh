#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$DOTFILES_DIR/bin"
SHELL_DIR="$DOTFILES_DIR/shell"
CONFIG_DIR="$DOTFILES_DIR/config"
TMUX_DIR="$DOTFILES_DIR/tmux"
NVIM_DIR="$DOTFILES_DIR/nvim"

LOCAL_BASE="$HOME/.local"
LOCAL_BIN_DIR="$LOCAL_BASE/bin"
LOCAL_SHELL_DIR="$LOCAL_BASE/shell"
LOCAL_CONFIG_DIR="$LOCAL_BASE/config"

[ -f "$HOME/.bashrc" ] || : > "$HOME/.bashrc"

LOADER_START="# >>> dotfiles loader >>>"
LOADER_END="# <<< dotfiles loader <<<"

LOADER_BLOCK=$(cat <<EOF
$LOADER_START
# shared dotfiles bin
if [ -d "$BIN_DIR" ]; then
    case ":\$PATH:" in
        *":$BIN_DIR:"*) ;;
        *) export PATH="$BIN_DIR:\$PATH" ;;
    esac
fi

# local-only bin
if [ -d "$LOCAL_BIN_DIR" ]; then
    case ":\$PATH:" in
        *":$LOCAL_BIN_DIR:"*) ;;
        *) export PATH="$LOCAL_BIN_DIR:\$PATH" ;;
    esac
fi

# shared shell config
[ -f "$SHELL_DIR/bashrc" ] && . "$SHELL_DIR/bashrc"
[ -f "$SHELL_DIR/aliases" ] && . "$SHELL_DIR/aliases"

# local-only shell config
[ -f "$LOCAL_SHELL_DIR/bashrc" ] && . "$LOCAL_SHELL_DIR/bashrc"
[ -f "$LOCAL_SHELL_DIR/aliases" ] && . "$LOCAL_SHELL_DIR/aliases"
$LOADER_END
EOF
)

TMP_BASHRC="$(mktemp)"

awk -v start="$LOADER_START" -v end="$LOADER_END" '
BEGIN { skip=0 }
$0 == start { skip=1; next }
$0 == end   { skip=0; next }
skip == 0   { print }
' "$HOME/.bashrc" > "$TMP_BASHRC"

{
    printf '%s\n' "$LOADER_BLOCK"
    cat "$TMP_BASHRC"
} > "$HOME/.bashrc"

rm -f "$TMP_BASHRC"

mkdir -p \
    "$HOME/.config" \
    "$HOME/.config/lazygit" \
    "$HOME/.config/zellij" \
    "$LOCAL_BIN_DIR" \
    "$LOCAL_SHELL_DIR" \
    "$LOCAL_CONFIG_DIR"

ln -sf "$CONFIG_DIR/lazygit/config.yml" "$HOME/.config/lazygit/config.yml"
ln -sf "$CONFIG_DIR/zellij/config.kdl" "$HOME/.config/zellij/config.kdl"
ln -sf "$TMUX_DIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sfn "$NVIM_DIR" "$HOME/.config/nvim"

chmod +x "$BIN_DIR"/* 2>/dev/null || true

[ -f "$LOCAL_SHELL_DIR/bashrc" ] || cat > "$LOCAL_SHELL_DIR/bashrc" <<'EOF'
# local-only bashrc additions
EOF

[ -f "$LOCAL_SHELL_DIR/aliases" ] || cat > "$LOCAL_SHELL_DIR/aliases" <<'EOF'
# local-only aliases
EOF

echo "Dotfiles installed."
echo "Reload with: source ~/.bashrc"
