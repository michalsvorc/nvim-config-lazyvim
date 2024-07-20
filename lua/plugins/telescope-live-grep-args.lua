-- SPDX-FileCopyrightText: 2023 Michael Weimann <mail@michael-weimann.eu>
--
-- SPDX-License-Identifier: MIT

local root = require("lazyvim.util.root")
local grep = require("functions.grep")
local visual = require("functions.visual")

local function live_grep_args(opts)
  return require("telescope").extensions.live_grep_args.live_grep_args(opts)
end

local function grep_text(cwd)
  live_grep_args({ default_text = grep.grep_under_default_opts.prefix, cwd = cwd })
end

local function grep_word_under_cursor(cwd)
  local word_under_cursor = vim.fn.expand("<cword>")
  word_under_cursor = grep.process_grep_under_text(word_under_cursor)

  live_grep_args({
    default_text = word_under_cursor,
    cwd = cwd,
  })
end

local function grep_visual_selection(cwd)
  local selection = visual.get_visual()
  local text = selection[1] or ""
  text = grep.process_grep_under_text(text)
  live_grep_args({ default_text = text, cwd = cwd })
end

local key_prefix = "<leader>s"

---@type LazySpec
return {
  "nvim-telescope/telescope-live-grep-args.nvim",
  keys = {
    {
      key_prefix .. "g",
      function()
        local cwd = root()
        grep_text(cwd)
      end,
      mode = "n",
      desc = "Grep+ (Root Dir)",
    },
    {
      key_prefix .. "G",
      function()
        local cwd = nil
        grep_text(cwd)
      end,
      mode = "n",
      desc = "Grep+ (cwd)",
    },
    {
      key_prefix .. "w",
      function()
        local cwd = root()
        grep_word_under_cursor(cwd)
      end,

      mode = "n",
      desc = "Selection+ (Root Dir)",
    },
    {
      key_prefix .. "W",
      function()
        local cwd = nil
        grep_word_under_cursor(cwd)
      end,

      mode = "n",
      desc = "Selection+ (cwd)",
    },
    {
      key_prefix .. "w",
      function()
        local cwd = root()
        grep_visual_selection(cwd)
      end,
      mode = "v",
      desc = "Selection+ (Root Dir)",
    },
    {
      key_prefix .. "W",
      function()
        local cwd = nil
        grep_visual_selection(cwd)
      end,
      mode = "v",
      desc = "Selection+ (cwd)",
    },
  },
}
