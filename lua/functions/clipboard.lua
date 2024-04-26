-- Compare clipboard with visual selection
-- https://www.reddit.com/r/neovim/comments/uodipg/how_to_compare_clipboard_with_visual_selection/
function CompareToClipboard()
  local ftype = vim.api.nvim_eval("&filetype")
  vim.cmd(string.format(
    [[
    execute "normal! \"xy"
    vsplit
    enew
    normal! P
    setlocal buftype=nowrite
    set filetype=%s
    diffthis
    execute "normal! \<C-w>\<C-w>"
    enew
    set filetype=%s
    normal! "xP
    diffthis
  ]],
    ftype,
    ftype
  ))
end
