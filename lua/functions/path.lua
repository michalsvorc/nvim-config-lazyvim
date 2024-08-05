local function get_cwd()
  local cwd = vim.fn.getcwd()
  return vim.fn.fnameescape(cwd)
end

local function get_project_root()
  local root = LazyVim.root.get({ normalize = true })
  return root
end

local function get_current_window()
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
      return get_cwd()
    end

    local buffer_path = vim.fn.expand("%:p:h")
    if buffer_path and buffer_path ~= "" then
      return vim.fn.fnameescape(buffer_path)
    else
      return get_cwd()
    end
  end
end

return {
  get_cwd = get_cwd,
  get_project_root = get_project_root,
  get_current_window = get_current_window,
}
