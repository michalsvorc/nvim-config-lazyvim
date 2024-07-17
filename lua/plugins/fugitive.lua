local key_prefix = "<leader>g"

---@type LazySpec
return {
  "tpope/vim-fugitive",
  lazy = false,
  keys = {
    {
      key_prefix .. "!",
      function()
        vim.cmd("Git blame")
      end,
      desc = "Blame",
    },
    {
      key_prefix .. "c",
      function()
        vim.cmd("vert Git commit")
      end,
      desc = "Commit",
    },
    {
      key_prefix .. "d",
      function()
        vim.cmd("Gvdiffsplit")
      end,
      desc = "Diff",
    },
    {
      key_prefix .. "g",
      function()
        vim.cmd("vert Git")
      end,
      desc = "Status Menu",
    },
    {
      key_prefix .. "l",
      function()
        vim.cmd("vert Git log")
      end,
      desc = "Log",
    },
    {
      key_prefix .. "L",
      function()
        vim.cmd("vert Git log -- %")
      end,
      desc = "Log current",
    },
    {
      key_prefix .. "p",
      function()
        vim.cmd("Git pull")
      end,
      desc = "Pull",
    },
    {
      key_prefix .. "P",
      function()
        vim.cmd("Git push")
      end,
      desc = "Push",
    },
    {
      key_prefix .. "R",
      function()
        vim.cmd("Gread")
      end,
      desc = "Read",
    },
    {
      key_prefix .. "w",
      function()
        vim.cmd("Gwrite")
      end,
      desc = "Write",
    },
  },
}
