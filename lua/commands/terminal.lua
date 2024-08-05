local paths = require("functions.path")

local function terminal_open(args)
  local arg_is_empty = not args.args or args.args == ""
  local path = arg_is_empty and paths.get_current_window() or args.args
  vim.cmd("lcd " .. path)
  vim.cmd("terminal")
  vim.cmd("startinsert")
end

vim.api.nvim_create_user_command("TerminalOpen", terminal_open, { nargs = "?" })
