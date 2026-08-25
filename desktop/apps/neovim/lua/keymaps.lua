-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Mini.files
vim.keymap.set("n", "<leader>mf", "<cmd>lua MiniFiles.open()<cr>")

-- Buffers
vim.keymap.set("n", "<leader>n", ":bnext<cr>")
vim.keymap.set("n", "<leader>p", ":bprevious<cr>")
vim.keymap.set("n", "<leader>d", ":bdelete<cr>")

-- VimTeX: math text objects and shortcuts
vim.keymap.set("n", "dsm", "<Plug>(vimtex-env-delete-math)")
vim.keymap.set("n", "csm", "<Plug>(vimtex-env-change-math)")
vim.keymap.set("n", "tsm", "<Plug>(vimtex-env-toggle-math)")

for _, mode in ipairs({ "o", "x" }) do
  vim.keymap.set(mode, "ai", "<Plug>(vimtex-am)")
  vim.keymap.set(mode, "ii", "<Plug>(vimtex-im)")
  vim.keymap.set(mode, "am", "<Plug>(vimtex-a$)")
  vim.keymap.set(mode, "im", "<Plug>(vimtex-i$)")
end

-- VimTeX: compile and view
vim.keymap.set("n", "<localleader>c", "<Plug>(vimtex-compile)")
vim.keymap.set("n", "<localleader>v", "<Plug>(vimtex-view)")

-- Typst: watch in a terminal split
local function git_root()
  local git_dir = vim.fn.finddir(".git", ".;")
  if git_dir ~= "" then
    return vim.fn.fnamemodify(git_dir, ":h")
  end
  return vim.fn.getcwd()
end

vim.api.nvim_create_user_command("TypstWatch", function()
  vim.o.splitright = true
  vim.cmd.vsp()
  vim.cmd("vertical resize 20")
  vim.cmd("terminal typst watch --root " .. git_root() .. " " .. vim.fn.expand("%:p"))
  vim.cmd.wincmd("h")
end, {})

vim.keymap.set("n", "<leader>fc", "<cmd>TypstWatch<cr>", { silent = true })

-- Open current PDF in Zathura
vim.keymap.set("n", "<leader>fr", function()
  vim.cmd("silent !zathura --fork " .. vim.fn.expand("%:p:r") .. ".pdf &")
end, { silent = true })
