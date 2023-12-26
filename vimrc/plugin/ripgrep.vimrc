if executable('rg')
  function! FZGrep(query, fullscreen)
    call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(a:query), 1, fzf#vim#with_preview(), a:fullscreen)
  endfunction

  function! FZGrepI(query, fullscreen)
    call fzf#vim#grep("rg --column --hidden --line-number --no-heading --color=always --ignore-case -- ".shellescape(a:query), 1, fzf#vim#with_preview(), a:fullscreen)
  endfunction

  let $FZF_DEFAULT_COMMAND = 'rg --files -uu'

  noremap fzf :Files<CR>
  noremap gzg :GFiles<CR>
  nnoremap g,re :RG<CR>
  nnoremap g,e :call FZGrepI(expand("<cfile>"), 0)<cr>
  vnoremap g,re :call FZGrepI(GetSelectionText(), 0)<cr>
  command! -nargs=* -bang RG call FZGrep(<q-args>, <bang>0)
endif
