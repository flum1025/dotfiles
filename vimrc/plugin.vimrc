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
set runtimepath+=~/.vim/bundle/neobundle.vim/
NeoBundle 'NigoroJr/rsense'
NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', {
    \ 'autoload' : { 'insert' : 1, 'filetype' : 'ruby', } }
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'open-browser.vim'
call neobundle#end()

" 補完の設定
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

let g:rsenseUseOmniFunc = 1

let g:netrw_nogx = 1
