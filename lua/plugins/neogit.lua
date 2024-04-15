return {
  "NeogitOrg/neogit",
  branch = "nightly",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = true,
  keys = {
    {
      "<leader>gg",
      function()
        require("neogit").open()
      end,
      desc = "Git",
    },
    {
      "<leader>gG",
      function()
        require("neogit").open({ cwd = vim.fn.getcwd() })
      end,
      desc = "Git (cwd)",
    },
  },
}
