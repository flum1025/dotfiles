#OS Detection
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

if [ $OS == 'Mac' ]; then
  if ! which brew >/dev/null 2>&1; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew install ctags tmux reattach-to-user-namespace zsh jq gawk
  open ~/dotfiles/PowerlineSymbols-Powerline.otf
elif [ $OS == 'Linux' ]; then
  apt update
  apt install -y vim-gnome tmux git ctags build-essential curl zsh gawk jq
fi

ln -s -i ~/dotfiles/vimrc/.vimrc ~
ln -s -i ~/dotfiles/tmux/.tmux.conf ~
ln -s -i ~/dotfiles/zsh/.zshrc ~

mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo 'launch tmux and prefix+I'
exec $SHELL -l

chsh -s /usr/bin/zsh
