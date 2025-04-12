-- Indentation lua configuration
require("ibl").setup{ indent = { char = "┊" } }

-- mini.files configuration
require('mini.icons').setup()
require('mini.files').setup()

-- Telescope configuration
require('telescope').setup {
 defaults = {
 },
pickers = {
   find_files = {
      find_command = { "fd", "--hidden", "--type", "f", "--strip-cwd-prefix", }
   },
 }
}

-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
 -- A list of parser names, or "all" (the listed parsers MUST always be installed)
 ensure_installed = {},

 -- Install parsers synchronously (only applied to `ensure_installed`)
 sync_install = false,

 -- Automatically install missing parsers when entering buffer
 -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
 auto_install = false,

 -- List of parsers to ignore installing (or "all")
 ignore_install = {},

 ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
 -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

 highlight = {
   enable = true,

   -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
   -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
   -- the name of the parser)
   -- list of language that will be disabled
   disable = {},
   -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
   --disable = function(lang, buf)
	--local max_filesize = 100 * 1024 -- 100 KB
	--local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
	--if ok and stats and stats.size > max_filesize then
	   --return true
	--end
   --end,

   -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
   -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
   -- Using this option may slow down your editor, and you may see some duplicate highlights.
   -- Instead of true it can also be a list of languages
   additional_vim_regex_highlighting = false,
 },
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- Completition and LSP configuration
-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'rust_analyzer', 'hls', 'clangd' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Trouble configuration
require('trouble').setup()
-- Trouble maps
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>")
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>")
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>")
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>")

-- nord and lulaine configuration
vim.g.nord_disable_background = true 
require('nord').set()

vim.cmd[[colorscheme nord]]

require('lualine').setup({
  options = {
    theme = 'nord'
  }
})

-- Luasnip configuration for snippets
luasnip.config.set_config({ -- Setting LuaSnip config

  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",

  -- Text in the repeated node update as typing
  update_events = 'TextChanged,TextChangedI',
})

-- Identify plaintex as latex
vim.g.tex_flavor = "latex"

-- Load snippets 
require("luasnip.loaders.from_lua").lazy_load({paths = "~/nixos-config/desktop/apps/neovim/LuaSnip/"})

vim.keymap.set('n', '<Leader>L', '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/nixos-config/desktop/apps/neovim/LuaSnip/"})<CR>')
