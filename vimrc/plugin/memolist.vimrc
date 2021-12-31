nnoremap mn :MemoNew<CR>
nnoremap ml :MemoList<CR>
nnoremap mg :MemoGrep<CR>

let g:memolist_path = "$HOME/memolist"
let g:memolist_memo_suffix = "md"

if dein#tap('denite.nvim')
  let g:memolist_denite = 1
  let g:memolist_denite_source = "file/rec"
endif
