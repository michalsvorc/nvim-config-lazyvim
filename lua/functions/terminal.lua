TerminalOpen = function()
  local path = PrintDirForCurrentWindow()
  vim.cmd("lcd " .. path)
  vim.cmd("terminal")
  vim.cmd("startinsert")
end
