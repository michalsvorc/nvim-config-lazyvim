return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-telescope/telescope-live-grep-args.nvim" },
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
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { height = 0.99, width = 0.99 },
      },
    })
    require("telescope").load_extension("harpoon")
  end,
}
