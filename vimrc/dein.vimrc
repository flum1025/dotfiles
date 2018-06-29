if has('nvim')
  let s:dein_dir = expand('~/.cache/nvim/dein')
else
  let s:dein_dir = expand('~/.cache/vim/dein')
endif

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければgithub から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" function for hook
let s:plugin_dir = '~/dotfiles/vimrc/plugin/'
function! RequirePlugin(path)
  execute "source" s:plugin_dir . a:path
endfunction

let s:toml      = '~/dotfiles/vimrc/toml/dein.toml'
let s:lazy_toml = '~/dotfiles/vimrc/toml/dein_lazy.toml'
let s:syntax_toml = '~/dotfiles/vimrc/toml/dein_syntax.toml'

" TOMLを読み込み、キャッシュしておく
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 0})
  call dein#load_toml(s:syntax_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" vimprocだけは最初にインストール
if dein#check_install(['vimproc'])
  call dein#install(['vimproc'])
endif
" もし,未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

