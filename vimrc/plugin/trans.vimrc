command! -nargs=* -range=% Trans call s:trans_sentence(<f-args>)
command! -nargs=* -range=% TransAll call s:trans_all(<f-args>)
command! -nargs=* -range=% TransWord call s:trans_word(<f-args>)

function! s:getSelectionText()
  let tmp = @@
  silent normal gvy
  let selected = @@
  let @@ = tmp
  return  selected
endfunction

function! s:trans_all(...)
  let args = a:0 >= 1 ? a:1 : ''
  let target_text = join(getline(1, '$'), "\n")

  echo s:trans(target_text, '-b ' . args)
endfunction

function! s:trans_sentence(...)
  let args = a:0 >= 1 ? a:1 : ''
  let selected_text = s:getSelectionText()

  echo s:trans(selected_text, '-b ' . args)
endfunction

function! s:trans_word()
  let args = a:0 >= 1 ? a:1 : ''
  let selected_text = s:getSelectionText()

  echo s:trans(selected_text, args)
endfunction

function! s:trans(text, args)
  let result = system('echo ' . shellescape(a:text) . ' | trans -no-ansi ' . a:args)
  return result
endfunction
