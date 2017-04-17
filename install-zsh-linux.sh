apt update
apt install -y zsh gawk jq
chsh -s /usr/bin/zsh

ln -s -i ~/dotfiles/zsh/.zshrc ~
