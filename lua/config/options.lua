-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
if LazyVim.is_win() then
  if vim.fn.executable("pwsh") == 1 then
    LazyVim.terminal.setup("pwsh")
  elseif vim.fn.executable("powershell") == 1 then
    LazyVim.terminal.setup("powershell")
  end
end
vim.g.root_spec = { "cwd" }
