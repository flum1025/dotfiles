ln -s -i ~/dotfiles/vimrc/.vimrc ~
echo "alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim \"$@\"'" >> ~/.bash_profile
echo "alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim \"$@\"'" >> ~/.bash_profile

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s -i ~/dotfiles/tmux/.tmux.conf ~
echo 'launch tmux and prefix+I'
