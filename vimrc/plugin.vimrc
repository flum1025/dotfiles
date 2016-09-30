set runtimepath+=~/.vim/bundle/neobundle.vim

if has("lua")
  source ~/dotfiles/vimrc/plugin/neocomplete.vimrc
endif

source ~/dotfiles/vimrc/plugin/nerdtree.vimrc
source ~/dotfiles/vimrc/plugin/switch.vimrc
source ~/dotfiles/vimrc/plugin/vim-rails.vimrc
source ~/dotfiles/vimrc/plugin/unite-rails.vimrc
" source ~/dotfiles/vimrc/plugin/monster.vimrc
source ~/dotfiles/vimrc/plugin/fastfold.vimrc

call neobundle#begin(expand('~/.vim/bundle/'))
  source ~/dotfiles/vimrc/plugin/rsense.vimrc
  source ~/dotfiles/vimrc/plugin/vimshell.vimrc
  source ~/dotfiles/vimrc/plugin/vimproc.vimrc
  source ~/dotfiles/vimrc/plugin/fzf.vimrc
  source ~/dotfiles/vimrc/plugin/fugitive.vimrc
  source ~/dotfiles/vimrc/plugin/open-browser.vimrc
  source ~/dotfiles/vimrc/plugin/vim-endwise.vimrc
  source ~/dotfiles/vimrc/plugin/syntastic.vimrc
  source ~/dotfiles/vimrc/plugin/vim-ref.vimrc
  source ~/dotfiles/vimrc/plugin/vim-tags.vimrc
  source ~/dotfiles/vimrc/plugin/lightline.vimrc
  source ~/dotfiles/vimrc/plugin/vim-gitgutter.vimrc
  source ~/dotfiles/vimrc/plugin/vim-submode.vimrc
  source ~/dotfiles/vimrc/plugin/vim-bracketed-paste.vimrc
  source ~/dotfiles/vimrc/plugin/vim-markdown.vimrc
  source ~/dotfiles/vimrc/plugin/vim-quickrun.vimrc
call neobundle#end()

