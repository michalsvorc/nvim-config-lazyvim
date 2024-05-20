-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local wk = require("which-key")

-- Disable default keymaps
--- Lazygit
vim.keymap.del("n", "<leader>gf")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>gb")
--- Terminal utility
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")

-- Compare clipboard with visual selection
map("x", "<leader>d", CompareToClipboard, { desc = "Compare clipboard with visual selection" })

-- Buffers
map("n", "<leader>be", ":lua require('telescope.builtin').buffers()<CR>", { desc = "Buffer Explorer" })
map("n", "<leader>bo", BufferDeleteOthers, { desc = "Delete other buffers" })

-- Terminal
local wk_group_terminal = {
  t = {
    name = "terminal",
  },
}
map("n", "<leader>tt", ":term<CR>", { desc = "Terminal buffer" })
map("n", "<leader>ts", ":split | term<CR>", { desc = "Terminal split" })
map("n", "<leader>tv", ":vsplit | term<CR>", { desc = "Terminal vsplit" })
map("n", "<leader>ft", function()
  require("telescope.builtin").buffers({
    default_text = "term:// ",
  })
end, { desc = "Find terminal buffers" })

wk.register(wk_group_terminal, { prefix = "<leader>" })
