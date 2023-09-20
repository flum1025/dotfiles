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
  \'coc-rust-analyzer',
  \'coc-jedi',
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

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')
command! -nargs=0 CR :CocRestart

autocmd BufWritePre *.ts,*.js,*.py,*.rb,*.go silent! call CocAction('runCommand', 'editor.action.organizeImport')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
