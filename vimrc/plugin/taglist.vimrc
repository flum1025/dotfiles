NeoBundle 'vim-scripts/taglist.vim'

let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
nmap <silent> <leader>tl :TlistToggle<CR>
