nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_global_extensions = [
  \'coc-stylelintplus',
  \'coc-prettier',
  \'coc-html',
  \'coc-eslint',
  \'coc-yaml',
  \'coc-vetur',
  \'coc-tsserver',
  \'coc-solargraph',
  \'coc-rls',
  \'coc-python',
  \'coc-phpls',
  \'coc-json',
  \'coc-java',
  \'coc-go',
  \'coc-flutter',
  \'coc-docker',
  \'coc-css',
  \'@yaegassy/coc-volar',
  \'coc-sql',
\]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
