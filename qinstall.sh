#!/bin/bash
# dotfiles ブートストラップ: Homebrew(macOS)/ mise を用意し、リポジトリを ~/dotfiles へ
# 展開して `mise bootstrap`(dotfiles配置 + パッケージ + ログインシェル + tools)を一括実行する。
#
#   curl -fsSL https://raw.githubusercontent.com/flum1025/dotfiles/master/qinstall.sh | bash
#
set -euo pipefail

REPO_HTTPS="https://github.com/flum1025/dotfiles.git"
DOTDIR="$HOME/dotfiles"

if [ "$(uname)" = "Darwin" ]; then
  # Homebrew(Xcode CLT も同時に導入される)。.zprofile と [bootstrap.packages] が依存する
  if ! command -v brew >/dev/null 2>&1; then
    NONINTERACTIVE=1 /bin/bash -c \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  # Linux: git / curl
  if ! command -v git >/dev/null 2>&1 || ! command -v curl >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y git curl
  fi
fi

# --- mise の用意 ---
if ! command -v mise >/dev/null 2>&1; then
  curl -fsSL https://mise.run | sh
fi
export PATH="$HOME/.local/bin:$PATH"

# --- リポジトリ取得 / 更新 ---
if [ ! -d "$DOTDIR/.git" ]; then
  git clone "$REPO_HTTPS" "$DOTDIR"
else
  git -C "$DOTDIR" pull --ff-only || true
fi

# --- グローバル config を seed(mise に [dotfiles]/[bootstrap]/[tools] を読ませる) ---
mkdir -p "$HOME/.config/mise"
ln -sf "$DOTDIR/.config/mise/config.toml" "$HOME/.config/mise/config.toml"

# --- 一括セットアップ(dotfiles 配置 → パッケージ → login_shell → tools 導入) ---
mise bootstrap

echo
echo "Done. 新しいシェルを開くか 'exec \$SHELL -l' で反映してください。"
echo "秘密情報(~/.gitconfig の user/署名鍵, ~/.ssh, ~/.npmrc, ~/.envrc など)は別途設定が必要です。"
