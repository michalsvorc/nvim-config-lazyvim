-- Compare clipboard with visual selection
-- https://www.reddit.com/r/neovim/comments/uodipg/how_to_compare_clipboard_with_visual_selection/
local function compare_to_clipboard()
  local ftype = vim.bo.filetype
  vim.cmd('normal! "xy')
  vim.cmd("vsplit")
  vim.cmd("enew")
  vim.cmd("normal! P")
  vim.cmd("setlocal buftype=nowrite")
  vim.bo.filetype = ftype
  vim.cmd("diffthis")
  vim.cmd('execute "normal! \\<C-w>\\<C-w>"')
  vim.cmd("enew")
  vim.bo.filetype = ftype
  vim.cmd('normal! "xP')
  vim.cmd("diffthis")
end

vim.api.nvim_create_user_command("CompareToClipboard", compare_to_clipboard, {})
