local path = require("functions.path")

local function terminal_open()
  local cwd = path.get_current_window()
  vim.cmd("lcd " .. cwd)
  vim.cmd("terminal")
  vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("TerminalOpen", terminal_open, {})
