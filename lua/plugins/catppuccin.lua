---@type LazySpec
return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    custom_highlights = function(C)
      return {
        WinSeparator = { fg = C.surface2 },
      }
    end,
  },
}
