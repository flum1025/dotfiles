func! s:before_for_deoplete()
  if deoplete#is_enabled()
    call deoplete#disable()
    let g:deoplete_is_enable_before_multi_cursors = 1
  else
    let g:deoplete_is_enable_before_multi_cursors = 0
  endif
endfunc

func! s:after_for_deoplete()
  if g:deoplete_is_enable_before_multi_cursors
    call deoplete#enable()
  endif
endfunc

func! s:before_for_vim_vue()
  let g:vue_disable_pre_processors = 1
endfunc

func! s:after_for_vim_vue()
  let g:vue_disable_pre_processors = 0
endfunc

func! Multiple_cursors_before()
  call s:before_for_deoplete()
  call s:before_for_vim_vue()
endfunc

func! Multiple_cursors_after()
  call s:after_for_deoplete()
  call s:after_for_vim_vue()
endfunc
