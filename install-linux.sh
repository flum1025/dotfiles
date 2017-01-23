ln -s -i ~/dotfiles/vimrc/.vimrc ~

mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

git clone https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

gem install rsense

mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s -i ~/dotfiles/tmux/.tmux.conf ~
echo 'launch tmux and prefix+I'

source ~/.profile

