nnoremap mn :MemoNew<CR>
nnoremap ml :MemoList<CR>
nnoremap mg :MemoGrep<CR>

let g:memolist_path = "$HOME/memolist"
let g:memolist_memo_suffix = "md"
let g:memolist_unite = 1
let g:memolist_unite_source = "file_rec"
let g:memolist_unite_option = "-auto-preview -start-insert"
