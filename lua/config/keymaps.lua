-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Telescope
-- Disabled
--- Lazygit Current File History
vim.keymap.del("n", "<leader>gf")

-- Telescope
--- Quickfix list
map("n", "<leader>sq", function()
  require("telescope.builtin").quickfix()
end, { desc = "Quickfix" })
map("n", "<leader>sQ", function()
  require("telescope.builtin").quickfixhistory()
end, { desc = "Quickfix history" })

--- Buffers
map("n", "<leader>sBg", function()
  require("telescope.builtin").grep_string({ grep_open_files = true, search = "" })
end, { desc = "Grep (buffers)" })
map("n", "<leader>sBw", function()
  require("telescope.builtin").grep_string({ grep_open_files = true })
end, { desc = "Selection (buffers)" })

--- Telescope live grep args
--- https://github.com/nvim-telescope/telescope-live-grep-args.nvim
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

map("n", "<leader>/", function()
  require("telescope.builtin").current_buffer_fuzzy_find()
end, { desc = "Grep (current buffer)" })
map("n", "<leader>sg", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Grep +args (root dir)" })
map("n", "<leader>sG", function()
  require("telescope").extensions.live_grep_args.live_grep_args({ cwd = false })
end, { desc = "Grep +args (cwd)" })
map("n", "<leader>sw", live_grep_args_shortcuts.grep_word_under_cursor, { desc = "Word +args (root dir)" })
map("n", "<leader>sW", function()
  require("telescope-live-grep-args.shortcuts").grep_word_under_cursor({ cwd = false })
end, { desc = "Word +args (cwd)" })
map("v", "<leader>sw", live_grep_args_shortcuts.grep_visual_selection, { desc = "Selection +args (root dir)" })

-- Compare clipboard with visual selection
map("x", "<leader>d", CompareToClipboard, { desc = "Compare clipboard with visual selection" })

-- Buffers
map("n", "<leader>be", ":lua require('telescope.builtin').buffers()<CR>", { desc = "Buffer Explorer" })
map("n", "<leader>bo", BufferDeleteOthers, { desc = "Delete other buffers" })

