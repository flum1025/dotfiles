#!/usr/bin/env bash
# 全 tmux セッションを tmuxp のワークスペースファイルとして書き出す。
# 出力先は ~/.config/tmuxp ではなく state 配下。手で育てる定義を上書きしないため。
set -euo pipefail

MISE="$HOME/.local/bin/mise"
OUTDIR="$HOME/.local/state/tmuxp"
LOG="$OUTDIR/freeze.log"

# run-shell の cwd はペインの作業ディレクトリになるため、
# プロジェクト側の .mise.toml / [env] を拾わないようにホームへ移す
cd "$HOME"
mkdir -p "$OUTDIR"

if [ ! -x "$MISE" ]; then
  tmux display-message "tmuxp-freeze: mise not found at $MISE"
  exit 1
fi

n=0
failed=0
while read -r s; do
  if "$MISE" x -- tmuxp freeze "$s" -f yaml -o "$OUTDIR/$s.yaml" --force --yes >>"$LOG" 2>&1; then
    n=$((n + 1))
  else
    failed=$((failed + 1))
  fi
done < <(tmux list-sessions -F '#{session_name}')

if [ "$failed" -gt 0 ]; then
  tmux display-message "tmuxp: froze $n, failed $failed -> $LOG"
else
  tmux display-message "tmuxp: froze $n session(s) -> $OUTDIR"
fi
