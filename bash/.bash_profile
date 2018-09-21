git_branch() {
  branch=$(git branch 2>/dev/null | sed -n -e 's/^\* \(.*\)/\1/p')
  if [ $(echo $?) = 0 -a "$branch" != "" ]; then
    echo :$branch
  fi
}
export PS1='\[\033[36m\]\u@\h\[\033[0m\] \[\033[32m\]\W\[\033[0m\]\[\033[35m\]$(git_branch)\[\033[0m\] $ '

alias count_rb='wc -l `find ./ -name "*.rb"`'
alias la='ls -la'
alias lfind='mdfind -onlyin ./ '
#エイリアス
alias la='ls -aG'
alias ll='ls -lG'


export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
