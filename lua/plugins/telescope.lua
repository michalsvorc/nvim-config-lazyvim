return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
  },
  keys = {
    {
      "<leader>/",
      false,
    },
    {
      "<leader>sg",
      false,
    },
    {
      "<leader>sG",
      false,
    },
    {
      "<leader>sw",
      false,
    },
    {
      "<leader>sW",
      false,
    },
    {
      "<leader>sw",
      false,
      mode = "v",
    },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { height = 0.99, width = 0.99, preview_width = 0.6 },
    },
  },
}
