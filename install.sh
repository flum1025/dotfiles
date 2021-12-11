#OS Detection
if [ "$(uname)" == 'Darwin' ]; then
  OS='Mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  OS='Linux'
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

askYesOrNo() {
  while true ; do
    read -p "$1 (y/n)?" answer
    case $answer in
      [yY] | [yY]es | YES )
        return 0;;
      [nN] | [nN]o | NO )
        return 1;;
      * ) echo "Please answer yes or no.";;
    esac
  done
}

if [ $OS == 'Mac' ]; then
  if ! which brew >/dev/null 2>&1; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew install tmux ctags gawk jq reattach-to-user-namespace
elif [ $OS == 'Linux' ]; then
  apt update
  apt install -y tmux ctags gawk jq git build-essential curl
fi

echo "Install tmux config"
ln -s -i ~/dotfiles/tmux/.tmux.conf ~
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
. ~/.tmux/plugins/tpm/bin/install_plugins

echo "Install git config"
cat << EOS >> ~/.gitconfig
[include]
  path = ~/dotfiles/git/.gitconfig
EOS

askYesOrNo "Do you want to use 'Neovim'?"
if [ $? -eq 0 ]; then
  echo "Setup 'Neovim'"
  if ! which nvim >/dev/null 2>&1; then
    if [ $OS == 'Mac' ]; then
      brew install neovim/neovim/neovim ripgrep
    elif [ $OS == 'Linux' ]; then
      apt install -y software-properties-common
      add-apt-repository ppa:neovim-ppa/unstable
      apt update
      apt install -y neovim ripgrep
    fi
  else
    echo "Already installed 'Neovim'"
  fi

  echo "Install vim config"
  mkdir -p ${HOME}/.config/nvim/
  ln -s -i ~/dotfiles/vimrc/.vimrc ${HOME}/.config/nvim/init.vim
else
  echo "Setup 'Vim'"
  if ! which vim >/dev/null 2>&1; then
    if [ $OS == 'Mac' ]; then
      brew install vim --with-lua
    elif [ $OS == 'Linux' ]; then
      apt install -y vim-gnome
    fi
  else
    echo "Already installed 'Vim'"
  fi

  echo "Install vim config"
  ln -s -i ~/dotfiles/vimrc/.vimrc ~
fi

askYesOrNo "Do you want to use 'zsh'?"
if [ $? -eq 0 ]; then
  echo "Setup 'zsh'"
  if ! which zsh >/dev/null 2>&1; then
    if [ $OS == 'Mac' ]; then
      brew install zsh
    elif [ $OS == 'Linux' ]; then
      apt install -y zsh
    fi
  else
    echo "Already installed 'zsh'"
  fi

  echo "Install zsh config"
  ln -s -i ~/dotfiles/zsh/.zshrc ~
  chsh -s /usr/bin/zsh
else
  echo "Install Bash config"
  ln -s -i ~/dotfiles/bash/.bash_profile ~
fi

askYesOrNo "Do you install 'Powerline icon font'?"
if [ $? -eq 0 ]; then
  open ~/dotfiles/PowerlineSymbols-Powerline.otf
fi

exec $SHELL -l
