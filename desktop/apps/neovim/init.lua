-- Neovim entry point
require("options")
require("keymaps")

-- Indentation lua configuration
require("ibl").setup({ indent = { char = "┊" } })

-- mini.files configuration
require("mini.icons").setup()
require("mini.files").setup()

-- Telescope configuration
require("telescope").setup {
  defaults = {
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--hidden", "--type", "f", "--strip-cwd-prefix", }
    },
  },
}

require("telescope").load_extension("fzf")

-- Completion and LSP configuration
-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.enable({ "rust_analyzer", "hls", "clangd", "zls", "tinymist" })

-- luasnip setup
local luasnip = require("luasnip")

-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
    ["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
  },
}

-- Trouble configuration
require("trouble").setup()
-- Trouble maps
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>")
vim.keymap.set("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>")
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>")
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>")

-- everforest and lualine configuration
vim.g.everforest_background = "hard"
vim.g.everforest_enable_italic = 1
vim.g.everforest_disable_background = true
vim.cmd[[colorscheme everforest]]

require("lualine").setup({
  options = {
    theme = "everforest",
  },
})

require("nvim-autopairs").setup({
  check_ts = true,
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt" },
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on(
  "confirm_done",
  cmp_autopairs.on_confirm_done()
)

-- LuaSnip configuration
luasnip.config.set_config({
  -- Enable autotriggered snippets
  enable_autosnippets = true,

  -- Use Tab (or some other key if you prefer) to trigger visual selection
  store_selection_keys = "<Tab>",

  -- Text in the repeated node update as typing
  update_events = "TextChanged,TextChangedI",
})

-- Load snippets
local snippet_dir = vim.fn.stdpath("config") .. "/LuaSnip"
require("luasnip.loaders.from_lua").lazy_load({ paths = snippet_dir })

vim.keymap.set("n", "<Leader>L", function()
  require("luasnip.loaders.from_lua").clean()
  require("luasnip.loaders.from_lua").load({ paths = snippet_dir })
end, { desc = "Reload LuaSnip snippets" })
