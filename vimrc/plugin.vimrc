let filelist =  expand("~/dotfiles/vimrc/plugin/*.vimrc")
let splitted = split(filelist, "\n")
for file in splitted
  execute "source" file
endfor
