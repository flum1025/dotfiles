eval "$(/opt/homebrew/bin/brew shellenv)"
# eval "$(direnv hook zsh)"

alias vi='nvim'
alias vim="nvim"
# alias docker="colima nerdctl --"
# alias docker86='colima nerdctl -p x86 --'
alias brew='arch -arm64 brew'

export EDITOR=nvim
export GPG_TTY=$TTY

export PATH="$(brew --prefix curl)/bin:$PATH"
export PATH=$PATH:$HOME/.platformio/penv/bin
export PATH="/Users/flum/.local/bin:$PATH"

eval "$(~/.local/bin/mise activate zsh)"
