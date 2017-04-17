if ! which brew >/dev/null 2>&1; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install ctags tmux reattach-to-user-namespace zsh jq gawk
source ~/dotfiles/lnfiles.sh

cat <<EOF >> ~/dotfiles/tmux/.tmux.conf
# Sierraでコピーできるようにする
set -g default-command "reattach-to-user-namespace -l ${SHELL}"
EOF

source ~/dotfiles/install-common.sh

open ~/dotfiles/PowerlineSymbols-Powerline.otf
