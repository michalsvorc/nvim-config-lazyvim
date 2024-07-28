---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-telescope/telescope-live-grep-args.nvim" },
  keys = {
    -- Disabled keys

    --- Search
    ---- Resume
    {
      "<leader>sR",
      false,
    },
    --- Grep
    ---- Grep (Root Dir)
    {
      "<leader>sg",
      false,
    },
    ---- Grep (cwd)
    {
      "<leader>sG",
      false,
    },
    ---- Selection (Root Dir)
    {
      "<leader>sw",
      mode = "v",
      false,
    },
    ---- Selection (cwd)
    {
      "<leader>sW",
      mode = "v",
      false,
    },

    --- Git
    ---- Git Commits
    {
      "<leader>gc",
      false,
    },
    { "<leader>s.", "<cmd>Telescope resume<cr>", desc = "Resume" },
    -- Git
    {
      "<leader>gb",
      function()
        require("telescope.builtin").git_branches()
      end,
      desc = "Branches ⌕",
    },
    {
      "<leader>gC",
      function()
        require("telescope.builtin").git_commits()
      end,
      desc = "Commits ⌕",
    },
    {
      "<leader>gu",
      function()
        require("telescope.builtin").git_bcommits()
      end,
      desc = "Buffer commits ⌕",
    },
    {
      "<leader>gU",
      function()
        require("telescope.builtin").git_bcommits_range()
      end,
      desc = "Buffer commits range ⌕",
    },
    {
      "<leader>gS",
      function()
        require("telescope.builtin").git_stash()
      end,
      desc = "Stash ⌕",
    },
    {
      "<leader>gF",
      function()
        require("telescope.builtin").git_files()
      end,
      desc = "Files ⌕",
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
        local theme_opts = {
          previewer = false,
          initial_mode = "normal",
          layout_config = {
            width = 0.7,
            height = 0.5,
          },
        }
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
        layout_strategy = "flex",
        layout_config = {
          prompt_position = "bottom",
          horizontal = {
            preview_cutoff = 100,
            preview_width = 0.6,
          },
          vertical = {
            preview_cutoff = 0.4,
          },
          flex = {
            flip_columns = 160,
          },
          height = 0.99,
          width = 0.99,
        },
        mappings = {
          n = {
            ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
          },
          i = {
            ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
        file_ignore_patterns = { ".git/" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
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
