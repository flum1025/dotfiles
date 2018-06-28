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
colorscheme onedark

if !has('nvim')
  set ttymouse=sgr
endif
