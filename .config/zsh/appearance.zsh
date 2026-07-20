# プロンプト設定
#PROMPT='[%~:%n] %# '
PROMPT='%n@%m %F{green}%c%f $ '

autoload -Uz vcs_info
setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{magenta}:%c%u%b%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd(){ vcs_info }

PROMPT='%n@%m %F{green}%c%f${vcs_info_msg_0_} $ '
