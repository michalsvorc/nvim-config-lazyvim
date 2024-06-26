local wk = require("which-key")
wk.register({
  g = {
    name = "git",
    f = {
      name = "find",
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
      "<leader>gfb",
      function()
        require("telescope.builtin").git_branches()
      end,
      desc = "Branches",
    },
    {
      "<leader>gfc",
      function()
        require("telescope.builtin").git_commits()
      end,
      desc = "Commits",
    },
    {
      "<leader>gfC",
      function()
        require("telescope.builtin").git_bcommits()
      end,
      desc = "Buffer commits",
    },
    {
      "<leader>gfr",
      function()
        require("telescope.builtin").git_bcommits_range()
      end,
      desc = "Buffer commits range",
    },
    {
      "<leader>gfs",
      function()
        require("telescope.builtin").git_status()
      end,
      desc = "Status",
    },
    {
      "<leader>gfS",
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
      "<leader>bb",
      function()
        local theme_opts = { previewer = false, initial_mode = "normal" }
        local opts = require("telescope.themes").get_dropdown(theme_opts)
        require("telescope.builtin").buffers(opts)
      end,
      mode = "n",
      desc = "Buffer Explorer",
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
      pickers = {
        buffers = {
          show_all_buffers = true,
          sort_lastused = true,
          mappings = {
            n = {
              ["<C-d>"] = "delete_buffer",
            },
          },
        },
      },
    })
  end,
}
