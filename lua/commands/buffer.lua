-- Copy current buffer path
vim.api.nvim_create_user_command("CopyBufferAbsolutePath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end, {})

vim.api.nvim_create_user_command("CopyBufferFileName", function()
  local path = vim.fn.expand("%:t")
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
end, {})

vim.api.nvim_create_user_command("CopyBufferPathRelativeToCwd", function()
  local path = vim.fn.expand("%:p:~:.")
  vim.fn.setreg("+", path)
  print("Copied: " .. path)
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
