ln -s -i ~/dotfiles/vimrc/.vimrc ~
echo "alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim \"\$@\"'" >> ~/.bash_profile
echo "alias vim='env_LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim \"\$@\"'" >> ~/.bash_profile

mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

git clone https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "alias tim='tmux new-session \; source-file ~/dotfiles/tmux/tim.conf'" >> ~/.bash_profile
ln -s -i ~/dotfiles/tim/tim.app/ /Applications/

mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s -i ~/dotfiles/tmux/.tmux.conf ~
echo 'launch tmux and prefix+I'

source ~/.bash_profile
