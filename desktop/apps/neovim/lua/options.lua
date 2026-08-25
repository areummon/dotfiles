-- Editor options (migrated from init.vim)
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 0
vim.opt.clipboard = "unnamedplus"

-- Providers (disable unused)
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Identify plaintex as latex
vim.g.tex_flavor = "latex"

-- VimTeX options
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_view_method = "zathura"
