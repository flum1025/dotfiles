#!/bin/bash
# dotfiles ブートストラップ: git / chezmoi を用意し、リポジトリを ~/dotfiles へ展開して適用する。
#
#   curl -fsSL https://raw.githubusercontent.com/flum1025/dotfiles/master/qinstall.sh | bash
#
set -euo pipefail

REPO_HTTPS="https://github.com/flum1025/dotfiles.git"
DOTDIR="$HOME/dotfiles"

# --- git / curl の用意 ---
if [ "$(uname)" = "Linux" ]; then
  if ! command -v git >/dev/null 2>&1 || ! command -v curl >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y git curl
  fi
fi
# macOS は Xcode Command Line Tools の git を利用(未導入なら自動でインストーラが起動)
command -v git >/dev/null 2>&1 || xcode-select --install || true

# --- chezmoi の用意 ---
if ! command -v chezmoi >/dev/null 2>&1; then
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
  export PATH="$HOME/.local/bin:$PATH"
fi

# --- リポジトリ取得 ---
if [ ! -d "$DOTDIR/.git" ]; then
  git clone "$REPO_HTTPS" "$DOTDIR"
fi

# --- chezmoi 設定(ソース=~/dotfiles, symlinkモード) ---
mkdir -p "$HOME/.config/chezmoi"
cat > "$HOME/.config/chezmoi/chezmoi.toml" <<EOF
sourceDir = "$DOTDIR"
mode = "symlink"
EOF

# --- 適用(symlink 配置 + run_onchange でパッケージ導入) ---
chezmoi apply

echo
echo "Done. 新しいシェルを開くか 'exec \$SHELL -l' で反映してください。"
echo "(Linux でログインシェルを zsh にする場合: chsh -s \"\$(command -v zsh)\")"
