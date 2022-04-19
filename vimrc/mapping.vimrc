map , <leader>
inoremap <C-s> <Esc>:w<CR>
noremap <C-s> :w<CR>
noremap <silent> zzz :q!<CR>
noremap :jq :%!jq '.'<CR>
" Shift-Left
noremap ;2D <Esc>b
" Shift-Right
noremap ;2C <Esc>w
" ^[f
noremap <Esc>f <Esc>w

noremap <F10> :<C-u>sp<CR>:e<Space>~/dotfiles/vimrc/command<CR>
nnoremap <C-f> :let @* = expand('%')<CR>

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
nnoremap so <C-w>_<C-w>\|
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
