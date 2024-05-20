local function builtin()
  return require("telescope.builtin")
end

---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-telescope/telescope-live-grep-args.nvim", "ThePrimeagen/harpoon" },
  keys = {
    -- Disable default keymaps
    --- Git Commits
    {
      "<leader>gc",
      false,
    },
    --- Git Status
    {
      "<leader>gs",
      false,
    },
    -- Quickfix list
    {
      "<leader>sq",
      function()
        builtin().quickfix()
      end,
      mode = "n",
      desc = "Quickfix",
    },
    {
      "<leader>sQ",
      function()
        builtin().quickfixhistory()
      end,
      mode = "n",
      desc = "Quickfix history",
    },
    -- Buffers
    {
      "<leader>/",
      function()
        builtin().current_buffer_fuzzy_find()
      end,
      mode = "n",
      desc = "Grep (current buffer)",
    },
    {
      "<leader>sb",
      function()
        builtin().grep_string({ grep_open_files = true, search = "" })
      end,
      mode = "n",
      desc = "Grep (buffers)",
    },
    {
      "<leader>sb",
      function()
        builtin().grep_string({ grep_open_files = true })
      end,
      mode = "v",
      desc = "Selection (buffers)",
    },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { height = 0.99, width = 0.99 },
      },
    })
    telescope.load_extension("harpoon")
  end,
}
