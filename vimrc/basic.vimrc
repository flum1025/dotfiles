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
colorscheme onedark

if !has('nvim')
  set ttymouse=sgr
endif

autocmd InsertEnter,WinEnter * checktime

" Vim本体がBracketed Paste Modeに対応していない時の為の設定。
if &term =~ "xterm" || &term =~ "screen"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"

    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    vnoremap <special> <expr> <Esc>[200~ XTermPasteBegin("c")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif
