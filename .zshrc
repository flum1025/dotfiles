source ~/.config/zsh/basic.zsh

source ~/.config/zsh/appearance.zsh

source ~/.config/zsh/alias.zsh

source ~/.config/zsh/plugin.zsh

# fzf(mise 管理)。最新 fzf のシェル統合を読み込む
command -v fzf >/dev/null && source <(fzf --zsh)
