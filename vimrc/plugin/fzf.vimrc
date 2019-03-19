function! FZFHFilesFunc()
  call fzf#run(fzf#wrap('FZFHFilesFunc', {
        \ 'source': 'rg --files --hidden --follow --glob "!.git" --glob "!.DS_Store"',
        \ 'options': '-x +s --sort --prompt "> "',
        \ 'down':    '40%'}))
endfunction

function! GetSelectionText()
  let tmp = @@
  silent normal gvy
  let selected = @@
  let @@ = tmp
  return  selected
endfunction

function! FZFJumpFileFunc(file_path)
  if a:file_path == ''
    echo '[Error] <cfile> return empty string.'
    return 0
  endif

  let file_dir = expand("%:h")
  let dist_file_path = file_dir . "/" . a:file_path
  if filereadable(dist_file_path)
    call FZFOpenFileFunc(fnamemodify(dist_file_path, ":."))
    return
  endif

  call FZFOpenFileFunc(fnamemodify(a:file_path, ":t"))
endfunction

function! FZFOpenFileFunc(query)
  call fzf#run(fzf#wrap('FZFHFilesFunc', {
        \ 'source': 'rg --files --hidden --follow --glob "!.git" --glob "!.DS_Store"',
        \ 'options': '-x +s --sort --prompt "> " --query=' . shellescape(a:query),
        \ 'down':    '40%'}))
endfunction
