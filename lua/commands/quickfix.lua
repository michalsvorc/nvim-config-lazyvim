local function quickfix_toggle()
  local quickfix_open = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      quickfix_open = true
      break
    end
  end
  if quickfix_open then
    vim.cmd("cclose")
  else
    vim.cmd("copen")
  end
end

local function quickfix_add_current()
  local file = vim.fn.expand("%:p")
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  local text = vim.fn.getline(".")
  local entry = {
    filename = file,
    lnum = line,
    col = col,
    text = text,
  }
  local qflist = vim.fn.getqflist()

  if not qflist or type(qflist) ~= "table" then
    qflist = {}
  end

  table.insert(qflist, entry)
  vim.fn.setqflist(qflist, "r")
end

vim.api.nvim_create_user_command("QuickfixToggle", quickfix_toggle, {})
vim.api.nvim_create_user_command("QuickfixAddCurrent", quickfix_add_current, {})
