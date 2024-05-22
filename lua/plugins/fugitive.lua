---@type LazySpec
return {
  "tpope/vim-fugitive",
  lazy = false,
  keys = {
    {
      "<leader>gg",
      function()
        vim.cmd("vert Git")
      end,
      desc = "Menu",
    },
    {
      "<leader>gc",
      function()
        vim.cmd("vert Git commit")
      end,
      desc = "Commit",
    },
    {
      "<leader>gl",
      function()
        vim.cmd("vert Git log")
      end,
      desc = "Log",
    },
    {
      "<leader>gL",
      function()
        vim.cmd("vert Git log -- %")
      end,
      desc = "Log current",
    },
    {
      "<leader>gs",
      function()
        vim.cmd("Git status")
      end,
      desc = "Status",
    },
    {
      "<leader>gd",
      function()
        vim.cmd("Gvdiffsplit")
      end,
      desc = "Diff",
    },
  },
}
