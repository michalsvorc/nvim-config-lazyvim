PrintDirForCurrentWindow = function()
  local oil_ok, oil = pcall(require, "oil")
  local oil_path = nil

  if oil_ok then
    oil_path = oil.get_current_dir()
  end

  if oil_path and oil_path ~= "" then
    return vim.fn.fnameescape(oil_path)
  else
    local buffer_name = vim.fn.expand("%")
    if string.match(buffer_name, "^fugitive://") then
      return vim.fn.fnameescape(vim.fn.getcwd())
    end

    local buffer_path = vim.fn.expand("%:p:h")
    if buffer_path and buffer_path ~= "" then
      return vim.fn.fnameescape(buffer_path)
    else
      return vim.fn.fnameescape(vim.fn.getcwd())
    end
  end
end
