inoremap <silent> jj <Esc>
noremap <silent> sq :q<CR>

" 分割したウィンドウ間の移動
nnoremap <silent> sw <C-w>w
nnoremap <silent> sh <C-w>h
nnoremap <silent> sj <C-w>j
nnoremap <silent> sk <C-w>k
nnoremap <silent> sl <C-w>l

" タブ関連
nnoremap <silent> st :tabnew<CR>
nnoremap <silent> sn gt
nnoremap <silent> sp gT
nnoremap <silent> sT :Unite tab<CR>

" 保存時にsudo権限で無理やり保存
cnoremap w!! w !sudo tee > /dev/null %<CR>
