source ~/.config/zsh/basic.zsh

source ~/.config/zsh/appearance.zsh

source ~/.config/zsh/alias.zsh

source ~/.config/zsh/plugin.zsh

# fzf(mise 管理)。最新 fzf のシェル統合を読み込む
command -v fzf >/dev/null && source <(fzf --zsh)

# fnox(mise 管理)。機密を階層的に自動ロード。~/.config/fnox/config.toml を参照
command -v fnox >/dev/null && eval "$(fnox activate zsh)"
