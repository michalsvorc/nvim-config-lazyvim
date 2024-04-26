-- Lint fix
vim.cmd([[command! -nargs=0 -bar AliFix execute "!npm run lint:fix " .. expand('%') .. " &> /dev/null"]])
