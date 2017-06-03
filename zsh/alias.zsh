#エイリアス
alias l='ls'
alias la='ls -aG'
alias ll='ls -lG'
alias count_rb='wc -l `find ./ -name "*.rb"`'
alias lfind='mdfind -onlyin ./ '

#関数
file_count(){
  wc -l `find ./ -name "$1"`
}
