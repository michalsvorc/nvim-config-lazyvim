local path = require("functions.path")

TerminalOpen = function()
  local cwd = path.get_current_window()
  vim.cmd("lcd " .. cwd)
  vim.cmd("terminal")
  vim.cmd("startinsert")
end
