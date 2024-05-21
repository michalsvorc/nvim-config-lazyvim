local wk = require("which-key")
wk.register({
  g = {
    name = "git",
    s = {
      name = "search",
    },
  },
}, { prefix = "<leader>" })

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
    -- Git
    {
      "<leader>gsb",
      function()
        require("telescope.builtin").git_branches()
      end,
      desc = "Branches",
    },
    {
      "<leader>gsc",
      function()
        require("telescope.builtin").git_commits()
      end,
      desc = "Commits",
    },
    {
      "<leader>gsC",
      function()
        require("telescope.builtin").git_bcommits()
      end,
      desc = "Buffer commits",
    },
    {
      "<leader>gsr",
      function()
        require("telescope.builtin").git_bcommits_range()
      end,
      desc = "Buffer commits range",
    },
    {
      "<leader>gss",
      function()
        require("telescope.builtin").git_status()
      end,
      desc = "Status",
    },
    {
      "<leader>gsS",
      function()
        require("telescope.builtin").git_stash()
      end,
      desc = "Stash",
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
