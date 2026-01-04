-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local km = vim.keymap
local opts = { noremap = true, silent = true }

km.set("n", "<C-d>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Scroll half down (centered)" }))
km.set("v", "<C-d>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Scroll half down (centered)" }))
km.set("v", "<C-u>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "Scroll half up (centered)" }))
km.set("n", "<C-u>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "Scroll half up (centered)" }))
km.set("n", "d", '"_d', opts)
km.set("v", "d", '"_d', opts)
