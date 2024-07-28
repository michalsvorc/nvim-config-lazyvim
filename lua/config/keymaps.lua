-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local wk = require("which-key")

-- Disable default keymaps
--- grug-far
vim.keymap.del("n", "<leader>sr")
--- Lazygit
vim.keymap.del("n", "<leader>gf")
vim.keymap.del("n", "<leader>gG")
vim.keymap.del("n", "<leader>gb")
--- Terminal utility
vim.keymap.del("n", "<leader>ft")
vim.keymap.del("n", "<leader>fT")
--- +quit/session
---- Quit All
vim.keymap.del("n", "<leader>qq")
--- Command history
vim.keymap.del("n", "<leader>:")
--- Buffers
---- Switch Buffer
vim.keymap.del("n", "<leader>,")
---- Switch to Other Buffer
vim.keymap.del("n", "<leader>`")

-- Compare clipboard with visual selection
map("x", "<leader>d", CompareToClipboard, { desc = "Compare clipboard with visual selection" })

-- Commands
map("n", "<leader>:", ":<C-F>", { desc = "Commands" })

-- Buffers
map("n", "<leader>,", "<cmd>e #<cr>", { desc = "Switch Buffer" })
map("n", "<leader>bo", BufferDeleteOthers, { desc = "Delete Other Buffers" })

-- Windows
map("n", "<leader>wt", "<C-W>T", { desc = "Open Window as a tab" })

-- Terminal
map("n", "<leader>tt", ":vsplit | lua TerminalOpen()<CR>", { desc = "Terminal vertical" })
map("n", "<leader>ts", ":split | lua TerminalOpen()<CR>", { desc = "Terminal horizontal" })
map("n", "<leader>tb", ":lua TerminalOpen()<CR>", { desc = "Terminal as buffer" })
map("n", "<leader>ft", function()
  require("telescope.builtin").buffers({
    default_text = "term:// ",
  })
end, { desc = "Find terminal buffers" })

wk.add({
  { "<leader>t", group = "terminal" },
})

-- Quickfix
wk.add({
  { "<leader>q", group = "Quickfix Toggle" },
})
map("n", "<leader>q", QuickfixToggle, { desc = "Quickfix Toggle" })
map("n", "<leader>a", QuickfixAddCurrent, { desc = "Quickfix add current" })
map("n", "[Q", "<cmd>colder<CR>", { desc = "Previous Quickfix list" })
map("n", "]Q", "<cmd>cnewer<CR>", { desc = "Next Quickfix list" })

-- Session
