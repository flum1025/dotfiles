if [ "$(uname)" == 'Darwin' ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
  sudo apt install -y git
else
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi

git clone https://github.com/flum1025/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
