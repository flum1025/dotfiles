let g:quickrun_config = {
\   '*': {'runmode': 'async:remote:vimproc'},
\ }

noremap <F4> :QuickRun<CR>
inoremap <F4> <Esc>:QuickRun<CR>
