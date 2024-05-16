---@type LazySpec
return {
  "mikavilpas/yazi.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  keys = {
    {
      "<leader>e",
      function()
        require("yazi").yazi()
      end,
      desc = "File explorer",
    },
    {
      "<leader>fe",
      function()
        require("yazi").yazi()
      end,
      desc = "File explorer",
    },
    {
      "<leader>fE",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "File explorer (cwd)",
    },
  },
  ---@type YaziConfig
  opts = {
    open_for_directories = true,
    floating_window_scaling_factor = 1,
    yazi_floating_window_border = "none",
  },
}
