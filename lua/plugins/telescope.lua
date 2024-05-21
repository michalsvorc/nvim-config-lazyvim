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
        require("telescope.builtin").quickfix()
      end,
      mode = "n",
      desc = "Quickfix",
    },
    {
      "<leader>sQ",
      function()
        require("telescope.builtin").quickfixhistory()
      end,
      mode = "n",
      desc = "Quickfix history",
    },
    -- Buffers
    {
      "<leader>/",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      mode = "n",
      desc = "Grep (current buffer)",
    },
    {
      "<leader>sb",
      function()
        local opts = { grep_open_files = true, search = "" }
        require("telescope.builtin").grep_string(opts)
      end,
      mode = "n",
      desc = "Grep (buffers)",
    },
    {
      "<leader>sb",
      function()
        local opts = { grep_open_files = true }
        require("telescope.builtin").grep_string(opts)
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
