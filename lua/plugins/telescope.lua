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
  config = function()
    require("telescope").load_extension("live_grep_args")
  end,
}
