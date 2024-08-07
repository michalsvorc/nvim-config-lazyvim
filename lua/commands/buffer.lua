local paths = require("functions.path")
local regname = "+"

-- Copy current buffer path
vim.api.nvim_create_user_command("CopyBufferAbsolutePath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg(regname, path)
  print("Copied: " .. path)
end, {})

vim.api.nvim_create_user_command("CopyBufferFileName", function()
  local filename = vim.fn.expand("%:t")
  vim.fn.setreg(regname, filename)
  print("Copied: " .. filename)
end, {})

vim.api.nvim_create_user_command("CopyBufferCwdPath", function()
  local path = vim.fn.expand("%:p:~:.")
  vim.fn.setreg(regname, path)
  print("Copied: " .. path)
end, {})

vim.api.nvim_create_user_command("CopyBufferProjectRootPath", function()
  local project_root_path = paths.get_project_root()
  local current_buffer_path = vim.api.nvim_buf_get_name(0)
  local relative_path = vim.fn.fnamemodify(current_buffer_path, ":." .. project_root_path)
  vim.fn.setreg(regname, relative_path)
  print("Copied: " .. relative_path)
end, {})

-- Close other buffers except the current one
local function buffer_delete_others()
  local current_buf = vim.fn.bufnr("%")
  local buflist = vim.fn.getbufinfo({ buflisted = 1 })
  for _, buf in ipairs(buflist) do
    if buf.bufnr ~= current_buf then
      vim.api.nvim_buf_delete(buf.bufnr, { force = true })
    end
  end
end
vim.api.nvim_create_user_command("BufferDeleteOthers", buffer_delete_others, {})
