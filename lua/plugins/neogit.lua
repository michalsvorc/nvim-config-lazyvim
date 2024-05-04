return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("neogit").setup({
      disable_hint = true,
      kind = "tab",
      commit_editor = {
        kind = "vsplit",
      },
      integrations = {
        telescope = true,
      },
    })
  end,
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
