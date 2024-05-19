return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-telescope/telescope-live-grep-args.nvim" },
  keys = {
    -- Grep (Root Dir)
    {
      "<leader>/",
      false,
    },
    -- Buffer
    {
      "<leader>sb",
      false,
    },
    -- Git Commits
    {
      "<leader>gc",
      false,
    },
    -- Git Status
    {
      "<leader>gs",
      false,
    },
    -- Grep (Root Dir)
    {
      "<leader>sg",
      false,
    },
    -- Grep (cwd)
    {
      "<leader>sG",
      false,
    },
    -- Word (Root Dir)
    {
      "<leader>sw",
      false,
    },
    -- Word (cwd)
    {
      "<leader>sW",
      false,
    },
    -- Selection (Root Dir)
    {
      "<leader>sw",
      false,
      mode = "v",
    },
    -- Selection (cwd)
    {
      "<leader>sW",
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
