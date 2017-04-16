if has("osx")
  let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"
elseif has("unix")
  let Tlist_Ctags_Cmd = "/usr/bin/ctags"
endif
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
nmap <silent> <leader>tl :TlistToggle<CR>
