-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- Telescope

--- Quickfix list
map("n", "<leader>sq", ":lua require('telescope.builtin').quickfix()<CR>", { desc = "Quickfix" })
map("n", "<leader>sQ", ":lua require('telescope.builtin').quickfixhistory()<CR>", { desc = "Quickfix history" })

--- Buffers
map(
  "n",
  "<leader>sBg",
  ":lua require('telescope.builtin').grep_string({ grep_open_files=true, search='' })<CR>",
  { desc = "Grep (buffers)" }
)
map(
  "n",
  "<leader>sBw",
  ":lua require('telescope.builtin').grep_string({ grep_open_files=true })<CR>",
  { desc = "Selection (buffers)" }
)

-- Telescope live grep args
-- https://github.com/nvim-telescope/telescope-live-grep-args.nvim
local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

map("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Grep (current buffer)" })
map(
  "n",
  "<leader>sg",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "Grep +args (root dir)" }
)
map(
  "n",
  "<leader>sG",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args({ cwd = false })<CR>",
  { desc = "Grep +args (cwd)" }
)
map("n", "<leader>sw", live_grep_args_shortcuts.grep_word_under_cursor, { desc = "Word +args (root dir)" })
map(
  "n",
  "<leader>sW",
  ":lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor({ cwd = false })<CR>",
  { desc = "Word +args (cwd)" }
)
map("v", "<leader>sw", live_grep_args_shortcuts.grep_visual_selection, { desc = "Selection +args (root dir)" })

-- Compare clipboard with visual selection
map("x", "<leader>d", CompareToClipboard, { desc = "Compare clipboard with visual selection" })

-- Disabled
--- Lazygit Current File History
vim.keymap.del("n", "<leader>gf")
