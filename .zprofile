eval "$(/opt/homebrew/bin/brew shellenv)"

alias vi='nvim'
alias vim="nvim"

export EDITOR=nvim
export GPG_TTY=$TTY

export PATH="$(brew --prefix curl)/bin:$PATH"
export PATH="/Users/flum/.local/bin:$PATH"

eval "$(~/.local/bin/mise activate zsh)"
