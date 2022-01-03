if executable('rg')
  function! FZGrep(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --hidden --follow --glob "!.git/*" --color=always --ignore-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  function! FZGrepI(query, fullscreen)
    call fzf#vim#grep("rg --column --line-number --no-heading --color=always --ignore-case -- ".shellescape(a:query), 1, fzf#vim#with_preview(), a:fullscreen)
  endfunction

  noremap fzf :GFiles<CR>
  nnoremap g,re :Rg<CR>
  nnoremap g,e :call FZGrepI(expand("<cfile>"), 0)<cr>
  vnoremap g,re :call FZGrepI(GetSelectionText(), 0)<cr>
  command! -nargs=* -bang RG call FZGrep(<q-args>, <bang>0)
endif
