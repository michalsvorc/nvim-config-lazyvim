---@type LazySpec
return {
  "tpope/vim-fugitive",
  lazy = false,
  keys = {
    {
      "<leader>gc",
      function()
        vim.cmd("vert Git commit")
      end,
      desc = "Commit",
    },
    {
      "<leader>gd",
      function()
        vim.cmd("Gvdiffsplit")
      end,
      desc = "Diff",
    },
    {
      "<leader>gg",
      function()
        vim.cmd("vert Git")
      end,
      desc = "Status Menu",
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
      "<leader>gp",
      function()
        vim.cmd("Git pull")
      end,
      desc = "Pull",
    },
    {
      "<leader>gP",
      function()
        vim.cmd("Git push")
      end,
      desc = "Push",
    },
    {
      "<leader>gR",
      function()
        vim.cmd("Gread")
      end,
      desc = "Read",
    },
    {
      "<leader>gs",
      function()
        vim.cmd("Git status")
      end,
      desc = "Status",
    },
    {
      "<leader>gw",
      function()
        vim.cmd("Gwrite")
      end,
      desc = "Write",
    },
  },
}
