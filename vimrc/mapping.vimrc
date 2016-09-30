inoremap <silent> jj <Esc>
inoremap <C-s> <Esc>:w<CR>
inoremap <C-d> <Esc>:w
noremap <C-s> :w<CR>
noremap <C-d> :w
noremap <silent> sq :q<CR>
noremap <silent> zzz :q!<CR>
noremap :jq :%!jq '.'<CR>

noremap <F10> :<C-u>sp<CR>:e<Space>~/dotfiles/command<CR>

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

" 保存時にsudo権限で無理やり保存
"cnoremap w!! w !sudo tee > /dev/null %<CR>
