### Vim Commands ###

# General
  gx        検索
  fzf       FZFでファイル検索
  :e path   ファイルを開く
  setf ruby ファイルタイプ変更
  <F4>      ruby実行
  vsh       vimShell起動
  :TagsGenerate!    tags作成
  dir       NERDTree
  g,e       grep
  g,re      再帰Grep
  viw       単語選択
  ctrl+__   コメントアウト

# HTML
  cit       <div>text</div> => <div></div>
  S         こんにちは ← vで選択後にS<div>と入力 => <div>こんにちは</div> 
  dst       <div>こんにちは</div> ← dstと入力 => こんにちは
  cst       <div>こんにちは</div> ← cst<span>と入力 => <span>こんにちは</span>


# Window
  # Split
    ss    水平
    sv    垂直

  # Cursor Move
    sh    左
    sj    下
    sk    上
    sl    右
    sw    次

  # Window Move
    sH    左
    sJ    下
    sK    上
    sL    右
    sr    回転

  # Resize
    <C-w>_    縦に最大化
    <C-w>|    横に最大化
    so        縦横最大化
    s=        大きさを揃える
    s>        幅を増やす
    s<        幅を減らす
    s+        高さを増やす
    s-        高さを減らす

  # Tab
    st    新しいタブ
    sT    タブ一覧
    sn    次のタブ
    sp    前のタブ
    sd    新しいタブ＋NERDTree
