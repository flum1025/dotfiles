#!/usr/bin/env bash
# 自動復元の直後に tmux が作る空セッションを捨てて、復元したセッションに移す。
#
# tmux は設定ファイルで復元しても、そのあと「起動時に要求されたセッション」を
# 別途作る。放置すると毎回 0 や 2 といった番号のセッションが 1 つ増える。
#
# 通常の `tmux new` を巻き込まないよう、自動復元が置いたマーカーが
# 新しいときだけ動く。
set -euo pipefail

STATE="$HOME/.local/state/tmuxp"
MARKER="$STATE/autorestore.marker"
me="${1:-}"

[ -n "$me" ] || exit 0

# 自動復元の直後 (15 秒以内) でなければ何もしない
[ -f "$MARKER" ] || exit 0
if [ -z "$(find "$MARKER" -maxdepth 0 -mmin -0.25 2>/dev/null)" ]; then
  rm -f "$MARKER"
  exit 0
fi
rm -f "$MARKER"

# 名前が数字だけ = tmux が自動採番したセッション。名前付きなら意図的なので触らない
case "$me" in '' | *[!0-9]*) exit 0 ;; esac

# 1 ペインしかない = まだ何も使っていない
[ "$(tmux list-panes -s -t "=$me" 2>/dev/null | wc -l | tr -d ' ')" = "1" ] || exit 0

# 移動先が無ければ消さない (消すとクライアントごと落ちる)
other="$(tmux list-sessions -F '#{session_name}' 2>/dev/null | grep -vx "$me" | head -1 || true)"
[ -n "$other" ] || exit 0

tmux switch-client -t "=$other"
tmux kill-session -t "=$me"
