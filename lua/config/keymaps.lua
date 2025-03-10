-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- For MacOS
map("n", "n", "nzzzv") -- perbaikan dari <n> menjadi n
map("n", "N", "Nzzzv") -- perbaikan dari <N> menjadi N
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- Comment keymaps for macOS support
-- macOS menggunakan Command+/ untuk comment
vim.keymap.set("n", "<M-/>", function()
  require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })
vim.keymap.set("x", "<M-/>", function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { noremap = true, silent = true })

-- For General Operating System
-- map("n", "<n>", "nzzzv")
-- map("n", "<N>", "Nzzzv")
-- -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
-- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
-- vim.keymap.set("n", "<C-_>", function()
--   require("Comment.api").toggle.linewise.current()
-- end, { noremap = true, silent = true })
-- vim.keymap.set("x", "<C-_>", function()
--   local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
--   vim.api.nvim_feedkeys(esc, "nx", false)
--   require("Comment.api").toggle.linewise(vim.fn.visualmode())
-- end, { noremap = true, silent = true })

-- multi select
vim.g.VM_maps = {
  ["Enter"] = "<C-c>ggl",
  ["Exit"] = "<Esc>",
}
vim.g.VM_maps["Complete"] = "<Tab>" -- Gunakan Tab untuk completion
-- undotree
vim.keymap.set("n", "<leader>uo", require("undotree").open, { noremap = true, silent = true })

-- mapping between screen
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C->", "<C-w>", { noremap = true, silent = true })

-- FLutter Bloc
vim.keymap.set("n", "<Leader>cfb", "<cmd>lua require('flutter-bloc').create_bloc()<cr>", {
  desc = "[C]reate [F]lutter [B]loc",
})

-- Create Cubit quickly
vim.keymap.set("n", "<Leader>cfc", "<cmd>lua require('flutter-bloc').create_cubit()<cr>", {
  desc = "[C]reate [F]lutter [C]ubit",
})
