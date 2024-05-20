-- SPDX-FileCopyrightText: 2023 Michael Weimann <mail@michael-weimann.eu>
--
-- SPDX-License-Identifier: MIT

local M = {}

M.get_visual = function()
  local _, ls, cs = unpack(vim.fn.getpos("v"))
  local _, le, ce = unpack(vim.fn.getpos("."))

  -- nvim_buf_get_text requires start and end args be in correct order
  ls, le = math.min(ls, le), math.max(ls, le)
  cs, ce = math.min(cs, ce), math.max(cs, ce)

  return vim.api.nvim_buf_get_text(0, ls - 1, cs - 1, le - 1, ce, {})
end

return M
