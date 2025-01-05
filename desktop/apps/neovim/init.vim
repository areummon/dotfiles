" <Leader> mapping
let mapleader = "\<Space>"

" Line configuration
set number
set shiftwidth=4 smarttab
set tabstop=8 softtabstop=0

" Copy to the system clipboard
set clipboard=unnamedplus

" Autoclosing pairs
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Airline configuration
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Open Minifiles window
nnoremap <leader>mf <cmd>lua MiniFiles.open()<cr>
