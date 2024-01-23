-- Copy buffer path
vim.cmd([[command! CopyBufferAbsolutePath lua vim.fn.setreg('+', vim.fn.expand('%:p'))]])
vim.cmd([[command! CopyBufferFileName lua vim.fn.setreg('+', vim.fn.expand('%:t'))]])
vim.cmd([[command! CopyBufferPathRelativeToCwd lua vim.fn.setreg('+', vim.fn.expand('%:p:~:.'))]])
