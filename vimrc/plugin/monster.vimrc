" Set async completion.
let g:monster#completion#rcodetools#backend = "async_rct_complete"

" Use deoplete.nvim
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}
