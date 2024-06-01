---@type LazySpec
return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      width = 140,
    },
  },
  keys = {
    {
      "<leader>z",
      function()
        require("zen-mode").toggle()
      end,
      desc = "Zen mode toggle",
    },
  },
}
