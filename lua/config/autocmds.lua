-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Start insert mode whenever a terminal buffer is opened.
vim.cmd([[autocmd! TermOpen * startinsert]])

-- When a terminal buffer is closed, deletes the associated buffer.
-- Prevents terminal buffer staying open with an exit status message.
-- https://github.com/neovim/neovim/issues/14986#issuecomment-902705190
vim.cmd([[
  augroup TerminalClose
    autocmd!
    autocmd TermClose * execute 'bdelete! ' .. expand('<abuf>')
  augroup END
]])

-- Load quickfix filter.
-- https://neovim.io/doc/user/quickfix.html
vim.cmd("packadd cfilter")
