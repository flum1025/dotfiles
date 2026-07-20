#!/bin/bash
# dotfiles ブートストラップ: mise を用意し、リポジトリを ~/dotfiles へ展開して
# `mise bootstrap`(dotfiles配置 + ログインシェル + ツール導入)を一括実行する。
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
command -v git >/dev/null 2>&1 || xcode-select --install || true

# --- mise の用意 ---
if ! command -v mise >/dev/null 2>&1; then
  curl -fsSL https://mise.run | sh
fi
export PATH="$HOME/.local/bin:$PATH"

# --- リポジトリ取得 ---
if [ ! -d "$DOTDIR/.git" ]; then
  git clone "$REPO_HTTPS" "$DOTDIR"
fi

# --- グローバル config を seed(mise に [dotfiles]/[bootstrap]/[tools] を読ませる) ---
# この symlink は [dotfiles] の自己管理エントリと一致するため、以後 mise が管理する。
mkdir -p "$HOME/.config/mise"
ln -sf "$DOTDIR/.config/mise/config.toml" "$HOME/.config/mise/config.toml"

# --- 一括セットアップ(dotfiles 配置 → login_shell → tools 導入) ---
mise bootstrap

echo
echo "Done. 新しいシェルを開くか 'exec \$SHELL -l' で反映してください。"
