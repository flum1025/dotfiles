#!/usr/bin/env bash
# ワークスペースディレクトリ内の定義をまとめて tmuxp で復元する。
# ファイル名 = セッション名の前提。既に存在するセッションは飛ばす。
set -euo pipefail

MISE="$HOME/.local/bin/mise"
WORKDIR="${TMUXP_RESTORE_DIR:-$HOME/.config/tmuxp}"
LOG="$HOME/.local/state/tmuxp/restore.log"

cd "$HOME"
mkdir -p "$(dirname "$LOG")"

if [ ! -x "$MISE" ]; then
  tmux display-message "tmuxp-restore: mise not found at $MISE"
  exit 1
fi

if [ ! -d "$WORKDIR" ]; then
  tmux display-message "tmuxp-restore: no workspace dir ($WORKDIR)"
  exit 1
fi

shopt -s nullglob
files=("$WORKDIR"/*.yaml "$WORKDIR"/*.yml "$WORKDIR"/*.json)
if [ ${#files[@]} -eq 0 ]; then
  tmux display-message "tmuxp-restore: no workspace files in $WORKDIR"
  exit 0
fi

loaded=0
skipped=0
failed=0
for f in "${files[@]}"; do
  s=$(basename "$f")
  s="${s%.*}"
  if tmux has-session -t "=$s" 2>/dev/null; then
    skipped=$((skipped + 1))
    continue
  fi
  if "$MISE" x -- tmuxp load -d -y --no-progress "$f" >>"$LOG" 2>&1; then
    loaded=$((loaded + 1))
  else
    failed=$((failed + 1))
  fi
done

tmux display-message "tmuxp: loaded $loaded, skipped $skipped, failed $failed"
