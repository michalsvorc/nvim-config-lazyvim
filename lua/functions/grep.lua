-- SPDX-FileCopyrightText: 2023 Michael Weimann <mail@michael-weimann.eu>
--
-- SPDX-License-Identifier: MIT

local helpers = require("telescope-live-grep-args.helpers")

local M = {}

M.grep_under_default_opts = {
  prefix = "-g '!.git/' -g '!*.{spec,test}.*' -. ",
  quote = true,
  trim = true,
}

M.process_grep_under_text = function(value, opts)
  opts = opts or {}
  opts = vim.tbl_extend("force", M.grep_under_default_opts, opts)

  if opts.trim then
    value = vim.trim(value)
  end

  if opts.quote then
    value = helpers.quote(value, opts)
  end

  if opts.prefix then
    value = opts.prefix .. value
  end

  return value
end

return M
