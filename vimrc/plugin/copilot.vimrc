imap <silent><script><expr> <C-b> copilot#Accept("\<CR>")
imap <silent><script><expr> <C-j> copilot#Next()
imap <silent><script><expr> <C-k> copilot#Previous()

let g:copilot_no_tab_map = v:true

let g:copilot_filetypes = #{
  \   gitcommit: v:true,
  \   markdown: v:true,
  \   text: v:true,
  \ }
