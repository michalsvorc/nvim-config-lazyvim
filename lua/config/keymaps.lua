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
-- +quit/session
--- Quit All
vim.keymap.del("n", "<leader>qq")

-- Compare clipboard with visual selection
map("x", "<leader>d", CompareToClipboard, { desc = "Compare clipboard with visual selection" })

-- Buffers
map("n", "<leader>bs", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bo", BufferDeleteOthers, { desc = "Delete Other Buffers" })

-- Windows
map("n", "<leader>wt", "<C-W>T", { desc = "Open Window as a tab" })

-- Terminal
map("n", "<leader>tt", ":vsplit | term<CR>", { desc = "Terminal vertical" })
map("n", "<leader>ts", ":split | term<CR>", { desc = "Terminal horizontal" })
map("n", "<leader>tb", ":term<CR>", { desc = "Terminal buffer" })
map("n", "<leader>ft", function()
  require("telescope.builtin").buffers({
    default_text = "term:// ",
  })
end, { desc = "Find terminal buffers" })

wk.add({
  { "<leader>t", group = "terminal" },
})
