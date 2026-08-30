#!/usr/bin/env bash
# サーバ起動時、セッションが 1 つも無ければ保存済みの定義から復元する。
# tmux は設定ファイルを読む時点ではセッションを 1 つも持っていないので、
# ここが「まっさらかどうか」を判定できる唯一のタイミングになる。
set -euo pipefail

STATE="$HOME/.local/state/tmuxp"

# 既にセッションがあるなら、サーバ起動ではなく prefix + r による再読み込み。何もしない
[ -z "$(tmux list-sessions -F '#{session_name}' 2>/dev/null)" ] || exit 0

"$HOME/.config/tmux/tmuxp-restore.sh"

# 復元した直後に tmux が別途作る「番号だけの空セッション」を捨ててよい、という印。
# tmuxp-drop-phantom.sh がこれを見て動く。誤って通常の tmux new を消さないよう
# 有効期間を短くし、1 回使ったら消える
: >"$STATE/autorestore.marker"
