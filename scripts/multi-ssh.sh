#!/bin/bash
#
# http://tech.naviplus.co.jp/2014/01/09/tmuxで複数サーバの同時オペレーション/
#

if [ -n "$SESSION_NAME" ];then
  session=$SESSION_NAME
else
  session=multi-ssh-`date +%s`
fi
window=multi-ssh

### tmuxのセッションを作成
tmux new-session -d -n $window -s $session
 
### 各ホストにsshログイン
# 最初の1台はsshするだけ
tmux send-keys "ssh $1" C-m
shift

# 残りはpaneを作成してからssh
for i in $*;do
  tmux split-window
  tmux select-layout tiled
  tmux send-keys "ssh $i" C-m
done

### 最初のpaneを選択状態にする
tmux select-pane -t 0

### paneの同期モードを設定
# tmux set-window-option synchronize-panes on

### セッションにアタッチ
tmux attach-session -t $session
