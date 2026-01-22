-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local km = vim.keymap
local opts = { noremap = true, silent = true }

--#region scrolling
km.set("n", "<c-d>", "<c-d>zz", vim.tbl_extend("force", opts, { desc = "Scroll half down (centered)" }))
km.set("v", "<c-d>", "<c-d>zz", vim.tbl_extend("force", opts, { desc = "Scroll half down (centered)" }))
km.set("v", "<c-u>", "<c-u>zz", vim.tbl_extend("force", opts, { desc = "Scroll half up (centered)" }))
km.set("n", "<c-u>", "<c-u>zz", vim.tbl_extend("force", opts, { desc = "Scroll half up (centered)" }))
km.set("n", "G", "Gzz", vim.tbl_extend("force", opts, { desc = "Go to end of file (centered)" }))
km.set("v", "G", "Gzz", vim.tbl_extend("force", opts, { desc = "Go to end of file (centered)" }))
--#endregion
--#region escapes
km.set("t", "<Esc><Esc>", [[<C-\><C-n>]], vim.tbl_extend("force", opts, { desc = "Exit terminal mode" }))
km.set("t", "jk", [[<C-\><C-n>]], vim.tbl_extend("force", opts, { desc = "Exit terminal mode" }))
km.set("i", "jk", "<Esc>", opts)
km.set("t", "jj", [[<C-\><C-n>]], vim.tbl_extend("force", opts, { desc = "Exit terminal mode" }))
km.set("i", "jj", "<Esc>", opts)
--#endregion
