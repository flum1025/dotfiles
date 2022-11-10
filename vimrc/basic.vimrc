set t_Co=256
set foldlevel=100
scriptencoding utf-8
set encoding=utf-8
set number
set showmode
set title
set ruler
set showcmd
set expandtab
set ts=2 sw=2 sts=0
set clipboard+=unnamed
set backspace=2
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
set mouse=a
set laststatus=2
set whichwrap=b,s,h,l,<,>,[,]
set noswapfile
set nobackup
set viminfo=
set noundofile
set splitbelow
set splitright
set incsearch
set hlsearch
set autoread
set showmatch
set startofline
set tags=./tags;
set cmdheight=0

if !has('nvim')
  set ttymouse=sgr
endif

if executable('win32yank.exe')
  let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': 'win32yank.exe -i',
      \      '*': 'win32yank.exe -i',
      \    },
      \   'paste': {
      \      '+': 'win32yank.exe -o',
      \      '*': 'win32yank.exe -o',
      \   },
      \   'cache_enabled': 1,
      \ }
endif

autocmd InsertEnter,WinEnter * checktime

let g:omni_sql_no_default_maps = 1
