---@type LazySpec
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    custom_highlights = function(colors)
      return {
        WinSeparator = { fg = colors.surface2 },
      }
    end,
  },
}
