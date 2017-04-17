set t_Co=256
set foldlevel=100
scriptencoding utf-8
set encoding=utf-8

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
