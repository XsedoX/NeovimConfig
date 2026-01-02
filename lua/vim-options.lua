vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Saving/quitting
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })

-- Split windows
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertical" })
vim.keymap.set("n", "<leader>sh", ": split<CR>", { desc = "Split horizontal" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize split sizes" })
vim.keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close split" })

-- Resize windows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ": vertical resize +2<CR>", { desc = "Increase window width" })

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting (stay in visual mode)
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Better new line (stay in normal mode)
vim.keymap.set("n", "<Enter>", "o<Esc>", { desc = "New line below" })
vim.keymap.set("n", "<S-Enter>", "O<Esc>", { desc = "New line above" })

-- Paste without yanking replaced text
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Delete without yanking
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete selection without yanking" })

-- Keep cursor centered while jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "G", "Gzz", { desc = "Go to end of file (centered)" })

-- Disable arrow keys in normal mode
vim.keymap.set("n", "<Up>", "<Nop>", { desc = "Disabled" })
vim.keymap.set("n", "<Down>", "<Nop>", { desc = "Disabled" })
vim.keymap.set("n", "<Left>", "<Nop>", { desc = "Disabled" })
vim.keymap.set("n", "<Right>", "<Nop>", { desc = "Disabled" })
vim.keymap.set("n", "<C-c>", "<Nop>", { desc = "Disabled" })

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank selection to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste from clipboard before cursor" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste from clipboard" })

-- Clear search highlight
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlight" })
