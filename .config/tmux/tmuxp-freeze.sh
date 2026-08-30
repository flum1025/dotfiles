#!/usr/bin/env bash
# 全 tmux セッションを tmuxp のワークスペースファイルとして書き出す。
# 出力先は state 配下。C-r (tmuxp-restore.sh) がここから復元する。
#
# 復元するのはウィンドウ/ペインの構成と作業ディレクトリだけ。
# tmuxp load は shell_command をペインに send-keys するため、freeze が拾った
# 実行中コマンドをそのまま残すと復元のたびに再実行されてしまう (make が走る、
# claude はバージョン番号として記録されるので command not found になる 等)。
# そのため freeze 後にコマンドを落として start_directory へ畳む。
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

# ペインに残すのは focus と作業ディレクトリだけにする awk フィルタ
STRIP_COMMANDS='
function q(s) { gsub(/'"'"'/, "'"'"''"'"'", s); return "'"'"'" s "'"'"'" }
function flush_pane(   n, i) {
  if (!in_pane) return
  n = 0
  if (pane_focus)     keys[++n] = "focus: '"'"'true'"'"'"
  if (pane_dir != "") keys[++n] = "start_directory: " q(pane_dir)
  for (i = 1; i <= extra_n; i++) keys[++n] = extra[i]
  if (n == 0) print "  - blank"
  else {
    print "  - " keys[1]
    for (i = 2; i <= n; i++) print "    " keys[i]
  }
  in_pane = 0; pane_dir = ""; pane_focus = 0; extra_n = 0
  delete keys
}
function take(body) {
  if (body ~ /^focus:/)                       { pane_focus = 1 }
  else if (body ~ /^start_directory: /)       { pane_dir = substr(body, 18) }
  else if (body ~ /^shell_command: cd /)      { pane_dir = substr(body, 19) }
  else if (body ~ /^shell_command:/)          { }
  else if (body ~ /^cd \//)                   { pane_dir = substr(body, 4) }
  else if (body ~ /^[A-Za-z_][A-Za-z0-9_]*:/) { extra[++extra_n] = body }
}
/^  panes:[ \t]*$/       { flush_pane(); in_panes = 1; print; next }
in_panes && /^  - /      { flush_pane(); in_pane = 1; take(substr($0, 5)); next }
in_panes && /^    - cd / { pane_dir = substr($0, 10); next }
in_panes && /^    - /    { next }
in_panes && /^    /      { take(substr($0, 5)); next }
in_panes                 { flush_pane(); in_panes = 0 }
{ print }
END { flush_pane() }
'

n=0
failed=0
while IFS=$'\t' read -r s path; do
  out="$OUTDIR/$s.yaml"
  if ! "$MISE" x -- tmuxp freeze "$s" -f yaml -o "$out" --force --yes >>"$LOG" 2>&1; then
    failed=$((failed + 1))
    continue
  fi

  # tmuxp freeze はセッションの作業ディレクトリ (session_path) を書き出さない。
  # 復元時に new-session -c が効くよう、トップレベルの start_directory を補う。
  {
    if [ -n "$path" ]; then
      printf "start_directory: '%s'\n" "${path//\'/\'\'}"
    fi
    awk "$STRIP_COMMANDS" "$out"
  } >"$out.tmp" && mv "$out.tmp" "$out"

  n=$((n + 1))
done < <(tmux list-sessions -F $'#{session_name}\t#{session_path}')

# 閉じたセッションの定義が残っていると C-r で復活してしまうので掃除する。
# ただし n = 0 のとき (サーバごと終了した直後など) は全消しになるため触らない。
if [ "$n" -gt 0 ]; then
  live=$'\n'"$(tmux list-sessions -F '#{session_name}')"$'\n'
  for f in "$OUTDIR"/*.yaml; do
    [ -e "$f" ] || continue
    name="${f##*/}"
    name="${name%.yaml}"
    case "$live" in
      *$'\n'"$name"$'\n'*) ;;
      *) rm -f "$f" ;;
    esac
  done
fi

if [ "$failed" -gt 0 ]; then
  tmux display-message "tmuxp: froze $n, failed $failed -> $LOG"
else
  tmux display-message "tmuxp: froze $n session(s) -> $OUTDIR"
fi
