---@type LazySpec
return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({
      prefills = {
        search = "",
        replacement = "",
        filesFilter = "!.git/",
        flags = "-.",
      },
    })
  end,
  keys = {
    {
      "<leader>r",
      function()
        require("grug-far").grug_far()
      end,
      mode = "n",
      desc = "FaR",
    },
    {
      "<leader>r",
      function()
        local opts = {
          prefills = {
            search = vim.fn.expand("<cword>"),
          },
        }
        require("grug-far").grug_far(opts)
      end,
      mode = "v",
      desc = "FaR (selection)",
    },
    {
      "<leader>R",
      function()
        local opts = {
          prefills = {
            flags = vim.fn.expand("%"),
          },
        }
        require("grug-far").grug_far(opts)
      end,
      mode = "n",
      desc = "FaR (current buffer)",
    },
    {
      "<leader>R",
      function()
        local opts = {
          prefills = {
            search = vim.fn.expand("<cword>"),
            flags = vim.fn.expand("%"),
          },
        }
        require("grug-far").grug_far(opts)
      end,
      mode = "v",
      desc = "FaR (selection, current buffer)",
    },
  },
}
