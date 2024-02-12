-- Copy buffer path
vim.cmd([[command! CopyBufferAbsolutePath lua vim.fn.setreg('+', vim.fn.expand('%:p'))]])
vim.cmd([[command! CopyBufferFileName lua vim.fn.setreg('+', vim.fn.expand('%:t'))]])
vim.cmd([[command! CopyBufferPathRelativeToCwd lua vim.fn.setreg('+', vim.fn.expand('%:p:~:.'))]])

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

-- Extract a quickfix sub-list
function SetQFList(start, finish)
  vim.cmd(string.format("call setqflist(getqflist()[%d:%d])", start, finish))
end
vim.cmd([[
  command! -nargs=* -complete=customlist,SetQFList SetQFList lua SetQFList(<f-args>)
]])
