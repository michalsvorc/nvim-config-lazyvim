-- Copy current buffer path
vim.cmd([[command! CopyBufferAbsolutePath lua vim.fn.setreg('+', vim.fn.expand('%:p'))]])
vim.cmd([[command! CopyBufferFileName lua vim.fn.setreg('+', vim.fn.expand('%:t'))]])
vim.cmd([[command! CopyBufferPathRelativeToCwd lua vim.fn.setreg('+', vim.fn.expand('%:p:~:.'))]])

-- Close other buffers except the current one
function BufferDeleteOthers()
  local current_buf = vim.fn.bufnr("%") -- Get current buffer number
  local buflist = vim.fn.getbufinfo({ buflisted = 1 }) -- Get a list of all listed buffers
  for _, buf in ipairs(buflist) do
    if buf.bufnr ~= current_buf then
      vim.api.nvim_buf_delete(buf.bufnr, { force = true })
    end
  end
end
vim.cmd([[command! BufferDeleteOthers lua BufferDeleteOthers()]])
