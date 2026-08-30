#!/usr/bin/env bash
# ステータスラインの再描画に相乗りして、セッション構成の変化を検知する。
#
# tmux にはタイマーが無く、定期実行できるのはフォーマット内挿 (#()) だけ。
# status-right から毎秒呼ばれるので、ここでは指紋を取るだけに留め、
# 変化が「止まった」次の tick で 1 回だけ freeze する (末尾デバウンス)。
# sleep もロックも待機プロセスも要らない。
#
# 何も出力しないこと。標準出力はそのままステータスラインに出る。
set -uo pipefail

STATE="$HOME/.local/state/tmuxp"
LAST="$STATE/tick.fp"
PENDING="$STATE/tick.pending"

mkdir -p "$STATE"

# 保存対象になっている情報だけを指紋にする。
# tmux 呼び出し 1 回ぶんで、freeze の 1/20 以下のコストしかかからない
fp=$(tmux list-panes -a -F '#{session_name}	#{session_path}	#{window_index}	#{window_name}	#{window_layout}	#{pane_index}	#{pane_current_path}' 2>/dev/null | shasum | cut -d' ' -f1)
[ -n "$fp" ] || exit 0

if [ "$fp" != "$(cat "$LAST" 2>/dev/null)" ]; then
  # まだ動いている最中。保存は次の tick 以降に持ち越す
  printf '%s' "$fp" >"$LAST"
  : >"$PENDING"
  exit 0
fi

# 前回と同じ = 変化が止まった
[ -e "$PENDING" ] || exit 0
rm -f "$PENDING"

# freeze は 1 秒ほどかかる。#() を待たせないよう投げっぱなしにする
"$HOME/.config/tmux/tmuxp-freeze.sh" >/dev/null 2>&1 &

exit 0
