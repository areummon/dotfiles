" <Leader> mapping
let mapleader = "\<Space>"
let maplocalleader = ","

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

" Luasnip key bindings
" Use Tab to expand and jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
imap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

" Vimtex Configuration
" Use `dsm` to delete surrounding math (replacing the default shortcut `ds$`)
nmap dsm <Plug>(vimtex-env-delete-math)
nmap csm <Plug>(vimtex-env-change-math)
nmap tsm <Plug>(vimtex-env-toggle-math)

" Use `ai` and `ii` for the item text object
omap ai <Plug>(vimtex-am)
xmap ai <Plug>(vimtex-am)
omap ii <Plug>(vimtex-im)
xmap ii <Plug>(vimtex-im)

" Use `am` and `im` for the inline math text object
omap am <Plug>(vimtex-a$)
xmap am <Plug>(vimtex-a$)
omap im <Plug>(vimtex-i$)
xmap im <Plug>(vimtex-i$)

" Use `<localleader>c` to trigger continuous compilation...
nmap <localleader>c <Plug>(vimtex-compile)

" Don't open QuickFix for warning messages if no errors are present
let g:vimtex_quickfix_open_on_warning = 0  
" Use Zathura as the VimTeX PDF viewer
let g:vimtex_view_method = 'zathura'
" Define a custom shortcut to trigger VimtexView
nmap <localleader>v <plug>(vimtex-view)
