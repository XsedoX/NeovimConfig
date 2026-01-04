-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local km = vim.keymap
local opts = { noremap = true, silent = true }

km.set("n", "<C-d>", "<C-d>zz", opts)
km.set("v", "<C-d>", "<C-d>zz", opts)
km.set("v", "<C-u>", "<C-u>zz", opts)
km.set("n", "<C-u>", "<C-u>zz", opts)
