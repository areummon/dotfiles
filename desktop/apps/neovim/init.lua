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

-- Kanagawa configuration
require('kanagawa').setup({
    transparent = true,         -- do not set background color
    colors = {
	theme = {
	    all = {
		ui = {
		    bg_gutter = "none"
		}
	    }
	}
    },
    overrides = function(colors)
    local theme = colors.theme
    return {
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },

        -- Save an hlgroup with dark background and dimmed foreground
        -- so that you can use it where your still want darker windows.
        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

        -- Popular plugins that open floats will link to NormalFloat by default;
        -- set their background accordingly if you wish to keep them dark and borderless
        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    }
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
